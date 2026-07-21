ods excel file = "/directory/Table2.xlsx";

libname savepath "/directory";
OPTIONS nofmterr;

proc format;
	value parameterf 1 = "Households"
	2 = "Respondents"
	3 = "Time 1"
	4 = "Time 2"
	5 = "Increment (Time 1 to Time 2)"
	6 = "Difference in increment"
	7 = "P value";
run;

*original model;
ods exclude all;
ods table CovB = cv ParameterEstimates = coeff;
proc glimmix data = savepath.analytic;
class factor_one_rc (ref = "0") factor_two_rc (ref = "0") wave (ref = "0") household_id;
model showed_up (event = "1") = wave factor_one_rc factor_one_rc*wave factor_two_rc factor_two_rc*wave /dist = binary solution cl CovB;
random intercept/subject = household_id;
lsmeans wave*factor_one_rc/ ilink cl;
run; 
ods exclude none;

*equality of coefficients test;
*SE;
data cvf1;
	set cv (rename = (COL6 = f1v COL12 = f1f2cv));
	if row in (6) then output;
	keep f1v f1f2cv;
run;

data cvf2;
	set cv (rename = (COL12 = f2v));
	if row = 12 then output;
	keep f2v;
run;

*difference in coefficients;
data coefftemp;
	set coeff;
	if (factor_one_rc = 1 and wave = 1) or (factor_two_rc = 1 and wave = 1) then output;
	keep estimate;
run;

proc transpose data = coefftemp out = coefft;
run;

*t value, 95% CI, and p-value;
proc sql;
	create table eoc as 
	select t.*, l.*, sqrt((t.f1v+l.f2v) - (2*f1f2cv)) as diff_se, n.col1 as bf1, n.col2 as bf2, (n.col2-col1) as bdiff, 
	(1.96*sqrt((t.f1v+l.f2v) - (2*f1f2cv))) as me, 
	(n.col2-col1)+(1.96*sqrt((t.f1v+l.f2v) - (2*f1f2cv))) as ucl,
	(n.col2-col1)-(1.96*sqrt((t.f1v+l.f2v) - (2*f1f2cv))) as lcl,
	(n.col2-col1)/sqrt((t.f1v+l.f2v) - (2*f1f2cv)) as t,
	(1-probt(abs((n.col2-col1)/sqrt((t.f1v+l.f2v) - (2*f1f2cv))),3239))*2 as p
	from cvf1 t, cvf2 l, coefft n;
quit;

proc print data = eoc;
run;

*bootstrapped probabilities;
proc surveyselect data = savepath.analytic noprint seed = 132
	out = rs (rename=(Replicate=SampleID)) n = 3000
	method = urs
	reps = 2000 outhits;
	cluster household_id;
run;

ods exclude all;
proc glimmix data = rs;
class factor_one_rc (ref = "0") factor_two_rc (ref = "0") wave (ref = "0") household_id;
model showed_up (event = "1") = wave factor_one_rc factor_one_rc*wave factor_two_rc factor_two_rc*wave /dist = binary solution;
random intercept/subject = household_id;
output out = savepath.estm1 pred(ilink blup) = p;
by SampleID;
run; 
ods exclude none;

*groups;
*messaging;
%macro tab(name, v, group);
proc sql;
	create table &name as 
	select wave, avg(p) as avgp, SampleID from savepath.estm1
	where &v = &group
	group by sampleID, wave
  order by sampleID, wave;
quit;

proc transpose data = &name out = &name.t;
	by SampleID;
run;

data savepath.&name.t;
	set &name.t (rename = (COL1 = &name.w1 COL2 = &name.w2));
	&name.diff = &name.w2-&name.w1;
	where _NAME_ ne "wave";
	drop _NAME_;
run;
%mend tab;
%tab(f10, factor_one_rc, 0);
%tab(f11, factor_one_rc, 1);
%tab(f20, factor_two_rc, 0);
%tab(f21, factor_two_rc, 1);

proc sql;
	create table savepath.total as
	select t.*, l.f11w1, l.f11w2, l.f11diff, 
	n.f20w1, n.f20w2, n.f20diff,
	o.f21w1, o.f21w2, o.f21diff,
	((l.f11diff)-(t.f10diff)) as f1did,
	((o.f21diff)-(n.f20diff)) as f2did,
	((l.f11diff-t.f10diff) -	(o.f21diff-n.f20diff)) as diff_did
	from savepath.f10t t 
	left join
	savepath.f11t l
	on t.sampleid = l.sampleid
	left join 
	savepath.f20t n
	on t.sampleid = n.sampleid
	left join 
	savepath.f21t o 
	on t.sampleid = o.sampleid;
quit;

%macro cis(var);
proc univariate data = savepath.total noprint;
	var &var;
	output out = &var.ci mean = mean median = median pctlpts = 2.5 97.5 pctlpre = ci;
run;
%mend cis;
%cis(f10w1);
%cis(f10w2);
%cis(f10diff);
%cis(f11w1);
%cis(f11w2);
%cis(f11diff);
%cis(f1did);
%cis(f20w1);
%cis(f20w2);
%cis(f20diff);
%cis(f21w1);
%cis(f21w2);
%cis(f21diff);
%cis(f2did);
%cis(diff_did);

*table 3;
options validvarname = any;
%macro tab(arm, group, int, no);
proc sql;
	create table &arm.housects as 
	select put(count(distinct household_id),25.) as &group from savepath.analytic
	where &int = &no;
quit;

proc sql;
	create table &arm.personcts as 
	select put(count(distinct study_id),25.) as &group from savepath.analytic 
	where &int = &no;
quit;
	
data &arm;
	length &group $32.;
	set &arm.w1ci
	&arm.w2ci
	&arm.diffci;
	lcl_p = round(ci2_5, 0.0001)*100;
	ucl_p = round(ci97_5, 0.0001)*100;
	mean_p = round(mean, 0.0001)*100;
	&group = catx(' ', mean_p, cat( '(', lcl_p, ', ', ucl_p, ')'));
	keep &group;
run;

data &arm;
	set 
	&arm.housects
	&arm.personcts
	&arm;
	%if &arm = f10 or &arm = f20 %then %do;
	parameter = _n_;
	%end;
run;
%mend tab;
%tab(f10, 'Personal Messaging'n, factor_one_rc, 0);
%tab(f11, 'Family Messaging'n, factor_one_rc, 1);
%tab(f20, 'Lottery Incentive'n, factor_two_rc, 0);
%tab(f21, 'Insurance Incentive'n, factor_two_rc, 1);

%macro comb(group, name, var, name2);
data &group.did;
	length &name $32.;
	set &group.didci;
	lcl_p = round(ci2_5, 0.0001)*100;
	ucl_p = round(ci97_5, 0.0001)*100;
	mean_p = round(mean, 0.0001)*100;
	&name = catx(' ', mean_p, cat( '(', lcl_p, ', ', ucl_p, ')'));
	keep &name;
run;

data &group.p;
	set coeff;
	&name = put(probt, 10.3);
	if &var = 1 and wave = 1 then output;
	keep &name;
run;

*add diff-in-diff and p value;
data &group.1;
	set &group.1 &group.did &group.p;
	Parameter = _n_;
run;

*merge with estimates + cis;
proc sql;
	create table &group as 
	select t.Parameter, t.&name, l.&name2 from &group.1 t 
	left join &group.0 l 
	on t.parameter = l.parameter;
quit;

proc print data = &group;
	format parameter parameterf.;
run;

*export for R graphs;
proc export data = &group outfile = "/directory/&group.prob_v2.csv"
	replace;
run;

%mend comb;
%comb(f1, 'Family Messaging'n, factor_one_rc, 'Personal Messaging'n);
%comb(f2, 'Insurance Incentive'n, factor_two_rc, 'Lottery Incentive'n);
ods excel close;
	


ods pdf file = "/directory/3way_interaction.pdf";
libname savepath "/directory";
OPTIONS nofmterr;

data temp;
	set savepath.analytic;
	wave_v2 = wave+1;
run;

*Two-way interaction;
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe2way FitStatistics=FS2way Tests3=t3r;
proc glimmix data = temp method=quad;
	class factor_one_rc (ref = "0") factor_two_rc (ref = "0") household_id;
	model showed_up (event = "1") = wave_v2 factor_one_rc factor_two_rc wave_v2*factor_one_rc wave_v2*factor_two_rc/cl dist = binary solution;
	title "2-way interaction";
	random intercept/subject = household_id;
run;

*Three-way interaction;
ods table ParameterEstimates = pe3way FitStatistics=FS3way Tests3=t3f;
proc glimmix data = temp method=quad;
	class factor_one_rc (ref = "0") factor_two_rc (ref = "0") household_id;
	model showed_up (event = "1") = wave_v2 factor_one_rc factor_two_rc wave_v2*factor_one_rc wave_v2*factor_two_rc 
	wave_v2*factor_one_rc*factor_two_rc/cl dist = binary solution;
	title "3-way interaction";
	random intercept/subject = household_id;
run;
ods graphics on;
ods exclude none;

proc print data = pe3Way;
	title "Full model-3-way interaction";
run;

*degrees of freedom-restricted model;
proc sql;
	create table dfr as 
	select sum(NumDF) as DFrest from t3r;
quit;

*degrees of freedom-full model;
proc sql;
	create table dff as 
	select sum(NumDF) as DFfull from t3f;
quit;

data fs3way;
	set fs3way (rename=(value=LLfull));
	if _N_ = 1 then output;
	keep LLfull;
run;

data fs2way;
	set fs2way (rename=(value=LLrest));
	if _N_ = 1 then output;
	keep LLrest;
run;

proc sql;
	create table waldtest as 
	select t.*, l.*, n.*, m.* from fs3way t, fs2way l, dff n, dfr m;
quit;

data waldtest;
	set waldtest;
	LRTest = round(abs(llfull-llrest),0.01);
	DF = dffull-dfrest;
	pValue = sdf("ChiSq", LRTest, DF); 
run;

proc print data = waldtest;
	Title "Chi-square Wald testing LL between restricted (2-way) and full (3-way) model";
run;
ods pdf close;






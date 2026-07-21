*table output;	
ods rft file="/directory/TableS2a.rtf";

*directory and formatting options;
libname savepath "/directory";
OPTIONS nofmterr;
ods escapechar="^"; 
%LET PLUSMIN=%SYSFUNC(BYTE(177));

*row titles;
proc format;
	value $parameterf
	'atitle1' = "Primary Hypothesis"
	'factor_one_rc*wave' = "^{style ^{NBSPACE 5}}Time x Messaging^{super 1}"
	'factor_two_rc*wave' = "^{style ^{NBSPACE 5}}Time x Financial Incentives^{super 2}"
	'gtitle2' = "Secondary Hypotheses^{super 3}"
	'tested' = "^{style ^{NBSPACE 5}}Tested for SARS-CoV-2"
	'tested_pos' = "^{style ^{NBSPACE 5}}Tested positive for SARS-CoV-2"
	'covid_trust_info___4' = "^{style ^{NBSPACE 5}}Medical professionals most trusted"
	'risk_v2' = '^{style ^{NBSPACE 5}}Risk averse^{super 4}'
	'health_v2' = "^{style ^{NBSPACE 5}}Health issue^{super 5}"
	'ssi_v2' = "^{style ^{NBSPACE 5}}Receiving SSI^{super 6}"
	'snap_v2' = "^{style ^{NBSPACE 5}}Receiving food stamps^{super 7}"
	'discrimination_v2' = "^{style ^{NBSPACE 5}}Discrimination^{super 8}"
	'race_v3' = "^{style ^{NBSPACE 5}}Non-White race"
	'race_ethn_hispanic_2' =  "^{style ^{NBSPACE 5}}Hispanic ethnicity"
	'vaccine_concerns_v2_' = '^{style ^{NBSPACE 5}}Money primary vaccine barrier';
run;

*main model;
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe0;
proc glimmix data = savepath.analytic;
class factor_one_rc (ref = "0") factor_two_rc (ref = "0") wave (ref = "0") household_id;
model showed_up (event = "1") = wave factor_one_rc factor_one_rc*wave factor_two_rc factor_two_rc*wave /dist = binary solution cl;
random intercept/subject = household_id;
run; 

*edit table;
proc sql;
	create table est0 as 
	select Effect as Parameter, catx(" ", round(estimate, 0.01), cat("(", round(Lower, 0.01), ", ", round(Upper, 0.01),")")) as Est, round(StdErr, 0.01) as SE,
	round(tValue, 0.01) as stat,
	cat(round(Probt, 0.001)) as p from 
	pe0 t 
	where (factor_one_rc = 1 and wave = 1) or (factor_two_rc = 1 and wave = 1);
quit;

data est0;
	retain Parameter est se stat pval;
	length Parameter $ 64 est $ 32 pval $ 8;
	label est = "Estimate (95% CI)" SE = "SE" stat = "Statistic" pval = "P Value";
	set est0;
	if parameter = "factor_one_rc*wave" then pval = trim(p) || "*";
	else if parameter = "factor_two_rc*wave" then pval = trim(p) || "**";
	drop p;
run;

*title rows;
%macro title(name);
proc sql;
		create table &name
		(Parameter char(64),
	  est char(32),
		se num(8),
		stat num(8),
		pval char(8)
		);
		
		insert into &name
		values("&name", ' ', . , . , ' ');
quit;
%mend title;
%title(atitle1);
%title(gtitle2);
OPTIONS MISSING = ' ';

*append title rows with model estimates;
data firhyp;
	set atitle1
	est0
	gtitle2;
run;

*estimates for secondary hypotheses;
%macro log(var, no);
ods table ParameterEstimates = pe&var clparmwald = ci&var LSMeans = prob&no;
proc logistic data = savepath.analytic_v2;
	class &var (ref = "0")/param = glm;
	model showed_up_w1 (event = "1") = &var/clparm = wald;
	lsmeans &var /ilink cl diff; 
	where head_of_household = 1;
run;

*combine p value and 95% CIs;
proc sql;
	create table est as 
	select t.variable as Parameter, catx(" ", round(t.estimate, 0.01), cat("(", round(l.LowerCL, 0.01), ", ", round(l.UpperCL, 0.01),")")) as Est, round(t.StdErr, 0.01) as SE,
	round(t.WaldChiSq, 0.01) as stat,
	cat(round(t.ProbChiSq, 0.001)) as p from 
	pe&var t 
	left join 
	ci&var l
	on t.ClassVal0 = l.ClassVal0
	where t.ClassVal0 = "1";
quit;

data est&no;
	retain Parameter est se stat pval;
	length Parameter $ 64 est $ 32 pval $ 8;
	label est = "Estimate (95% CI)" SE = "SE" stat = "Statistic" pval = "P Value";
	set est;
	%if &var = covid_trust_info___4 | &var = vaccine_concerns_v2___8 %then %do;
	pval = trim(p) || "**";
	%end;
	%else %if &var = risk_v2 %then %do;
	pval = trim(p) || "*";
	%end;
  %else %do;
  pval = p;
  %end;
  drop p;
run;

%mend log;
%log(tested, 1); 
%log(tested_pos, 2); 
%log(covid_trust_info___4, 3); 
%log(risk_v2, 4); 
%log(health_v2, 5);
%log(ssi_v2, 6); 
%log(snap_v2, 7); 
%log(discrimination_v2, 8);
%log(race_v3, 9); 
%log(race_ethn_hispanic_2, 10);
%log(vaccine_concerns_v2___8, 11); 
ods exclude none;

*append secondary hypotheses estimates;
proc datasets lib=work nolist; 
delete sechyp;    
quit; 
run;
             
%macro append_all;   
%do i=1 %to 11;        
proc append base=sechyp data=est&i;
run;    
%end;
%mend append_all;
%append_all;

data savepath.tableS2a;
	set firhyp sechyp;
	format parameter $parameterf.;
run;

*output table;
proc report data = savepath.tableS2a nowd
	 style(report)=[rules=none frame=hsides cellspacing=1 cellpadding=1 borderbottomcolor = white]  
	 style(header) = [background=white borderbottomwidth=2.25pt borderbottomcolor = black bordertopcolor = white];
	 define est / center;
	 define se / center;
	 define stat / center;
	 define pval / center;
	 compute after / style={just=l};
	 line "Abbreviations: CI, confidence interval; SE, standard error; SSI, supplemental security income.";
	 line "^{super 1}Time 2 log odds attendance for Family Messaging group.";
	 line "^{super 2}Time 2 log odds attendance for Loss Protection group.";
	 line "^{super 3}Subset of survey questions in Supplemental Table S1.";
	 line "^{super 4}Risk score of 5 or less.";
	 line "^{super 5}Head of household noted at least one condition.";
	 line "^{super 6}SSI received by children, adults, or both.";
	 line "^{super 7}Head of household marked ‘yes’ before or after the pandemic started.";
	 line "^{super 8}Head of household noted at least one discriminatory incident.";
	 line "*Significant at P <  0.05.";
	 line "**Significant at P < 0.01.";
 	 endcomp;
run;
ods rtf close;


ods rtf file="/directory/TableS2.rtf";
libname savepath "/directory";
OPTIONS nofmterr;
ods escapechar="^";

*row titles;
proc format;
	value $parameterf
	'risk_v3*factor_two_r' = "^{style ^{NBSPACE 5}}Risk seeking^{super 3}"
	'essential*factor_two' = "^{style ^{NBSPACE 5}}Essential worker"
	'contact_v*factor_two' = "^{style ^{NBSPACE 5}}Close contact at work^{super 4}"
	'ppe_work_*factor_two' = "^{style ^{NBSPACE 5}}PPE at work^{super 5}"
	'transport*factor_two' = "^{style ^{NBSPACE 5}}Shared transportation^{super 6}"
	'income_v2*factor_two' = "^{style ^{NBSPACE 5}}Income <= $49,000"
	'discrimin*factor_two' = '^{style ^{NBSPACE 5}}Discrimination^{super 7}'
	'employ_st*factor_two' = "^{style ^{NBSPACE 5}}Unemployed"
	'mental*factor_two_rc' = "^{style ^{NBSPACE 5}}Mental health issue^{super 8}"
	'depressio*factor_two' = "^{style ^{NBSPACE 5}}Depression"
	'snap_v2*factor_two_r' = "^{style ^{NBSPACE 5}}Food stamps^{super 9}"
	'ssi_v2*factor_two_rc' = "^{style ^{NBSPACE 5}}SSI^{super 10}"
	'pos_w1_v2' =  "^{style ^{NBSPACE 5}}Time 1 seropositivity";
run;

*recode risk aversion to risk seeking;
data savepath.analytic_v2;
	set savepath.analytic_v2;
	if risk_v2 = . then risk_v3 = .;
	else if risk_v2 = 1 then risk_v3 = 0;
	else risk_v3 = 1;
run;
	
*Secondary Hypotheses Time 2;
%macro log(var, no);
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe&var clparmwald = ci&var;
proc logistic data = savepath.analytic_v2;
	class &var (ref = "0") factor_two_rc (ref = "0");
	model showed_up_w2 (event = "1") = factor_two_rc &var &var*factor_two_rc/clparm = wald;
	where showed_up_w1 = 1 and head_of_household = 1;
run;

proc sql;
	create table est&no as 
	select t.variable as Parameter, catx(" ", round(t.estimate, 0.01), cat("(", round(l.LowerCL, 0.01), ", ", round(l.UpperCL, 0.01),")")) as Est, round(t.StdErr, 0.01) as SE,
	round(t.WaldChiSq, 0.01) as stat,
	cat(round(t.ProbChiSq, 0.001)) as p from 
	pe&var t 
	left join 
	ci&var l
	on t.variable = l.parameter
	where t.ClassVal0 = "1" and t.ClassVal1 = "1";
quit;

*change variable lengths;
data est&no;
	length Parameter $ 36 Est $ 36 SE 8 stat 8 p $ 8;
	set est&no;
run;

%mend log;
%log(risk_v3, 1);
%log(essential, 2); 
%log(contact_v2, 3);
%log(ppe_work_v2, 4);
%log(transport_v3, 5); 
%log(income_v2, 6);
%log(discrimination_v2, 7);
%log(employ_status_v2, 8);
%log(mental, 9);
%log(depression, 10);
%log(snap_v2, 11);
%log(ssi_v2, 12);

*Time 1 seropositivity status and Time 2 attendance;
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe13;
	proc glimmix data = savepath.analytic_v2;
	class pos_w1_v2 (ref = "0") household_id;
	model showed_up_w2 (event = "1") = pos_w1_v2/cl dist = binary solution;
	random intercept/subject = household_id;
	where showed_up_w1 = 1;
run;

*edit table;
proc sql;
	create table est13 as 
	select Effect as Parameter, catx(" ", round(estimate, 0.01), cat("(", round(Lower, 0.01), ", ", round(Upper, 0.01),")")) as Est, round(StdErr, 0.01) as SE,
	round(tValue, 0.01) as stat,
	cat(round(Probt, 0.001)) as p from 
	pe13 t 
	where (pos_w1_v2 = 1);
quit;

*change variable lengths;
data est13;
	length Parameter $ 36 Est $ 36 SE 8 stat 8 p $ 8;
	set est13;
run;

*append secondary hypotheses estimates;
proc datasets lib=work nolist; 
delete sechyp;    
quit; 
run;
             
%macro append_all;   
%do i=1 %to 13;        
proc append base=sechyp data=est&i;
run;    
%end;
%mend append_all;
%append_all;
ods exclude none;

*add format, label, and reorder variables;
data savepath.table_s2;
	retain Parameter est SE stat p;
	label est = "Estimate (95% CI)" SE = "SE" stat = "Statistic" p = "P Value";
	set sechyp;
	format parameter $parameterf.;
run;

*output table;
proc report data = savepath.table_s2 nowd
	 style(report)=[rules=none frame=hsides cellspacing=1 cellpadding=1 borderbottomcolor = white]  
	 style(header) = [background=white borderbottomwidth=2.25pt borderbottomcolor = black bordertopcolor = white];
	 define est / center;
	 define se / center style(column)={cellwidth=0.75in};;
	 define stat / center style(column)={cellwidth=0.75in};;
	 define p / center style(column)={cellwidth=0.75in};;
	 compute after / style={just=l};
	 line "Abbreviations: CI, confidence interval; SE, standard error; SSI, supplemental security income; PPE, personal protective equipment.";
	 line "^{super 1}Subset of survey questions in Supplemental Table S3.";
	 line "^{super 2}The interaction effect for parameter x Financial Incentives (reference group is the Lottery study arm).";
	 line "^{super 3}Risk score of more than 5.";
	 line "^{super 4}Head of household marked 'Yes, all of the time'.";
	 line "^{super 5}Head of household marked ’Never’.";
	 line "^{super 6}Head of household marked ‘Shared carpool’, ‘Bus’, ‘Subway or short-distance train’, or ‘Ride-share (Uber, Lyft, etc.) or taxicab’.";
	 line "^{super 7}Head of household noted at least one discriminatory incident.";
	 line "^{super 8}Head of household marked 'Other mental health disorder'.";
	 line "^{super 9}Head of household marked ‘yes’ before or after the pandemic started. ";
	 line "^{super 10}SSI received by children, adults, or both.";
 	 endcomp;
run;
ods rtf close;
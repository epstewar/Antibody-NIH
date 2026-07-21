*main model;
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe0;
proc glimmix data = savepath.analytic;
class factor_one_rc (ref = "0") factor_two_rc (ref = "0") wave (ref = "0") household_id;
model showed_up (event = "1") = wave factor_one_rc factor_one_rc*wave factor_two_rc factor_two_rc*wave /dist = binary solution cl;
random intercept/subject = household_id;
run;

*conditional on T1 messaging;
ods table ParameterEstimates = pecond_f1;
proc glimmix data = savepath.analytic;
class factor_one_rc (ref = "0") household_id;
model showed_up (event = "1") = factor_one_rc /dist = binary solution cl;
random intercept/subject = household_id;
where wave = 1;
run;  

*conditional on T1 financial incentives;
ods table ParameterEstimates = pecond_f2;
proc glimmix data = savepath.analytic;
class factor_two_rc (ref = "0") household_id;
model showed_up (event = "1") = factor_two_rc /dist = binary solution cl;
random intercept/subject = household_id;
where wave = 1;
run; 

*conditional on T1 financial incentives*messaging;
ods table ParameterEstimates = pecond_f12;
proc glimmix data = savepath.analytic;
class factor_one_rc (ref = "0") factor_two_rc (ref = "0") household_id;
model showed_up (event = "1") = factor_one_rc*factor_two_rc /dist = binary solution cl;
random intercept/subject = household_id;
where wave = 1;
run;  

ods excel file = "/schaeffer-a/sch-projects/dua-data-projects/BEARI/Antibody_Analysis/Code/NIH_analysis/recent_17Oct25/Results/conditional.xlsx";
proc print data = pecond_f1; 
run;

proc print data = pecond_f2; 
run;

proc print data = pecond_f12; 
run;
ods rtf close;


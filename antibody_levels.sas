ods pdf file = "/directory/antibody_levels.pdf";
libname savepath "/directory";
OPTIONS nofmterr;

*percentage seropositivity by wave (in "Heterogeneity of Effects and Descriptive Trends" section of results);
data pos_w1;
	set savepath.analytic_v2 (rename = (pos_w1_v2 = pos));
	wave = 0;
	keep study_id pos wave household_id;
	if showed_up_w1 = 1 then output;
run;

data pos_w2;
	set savepath.analytic_v2 (rename = (pos_w2_v2 = pos));
	wave = 1;
	keep study_id pos wave household_id;
	if showed_up_w2 = 1 then output;
run;

data totalpos;
	set pos_w1 pos_w2;
run;

*percentage seropositivity by wave;
ods graphics off;
ods exclude all;
ods table LSMeans = pospercent;
proc logistic data = totalpos;
	class wave (ref = "0")/param = glm;
	model pos (event = "1") = wave;
	lsmeans wave / ilink cl;
run;

*create data with two rows per respondent who attended both Time 1 and Time 2 (n = 414);
data w1;
	set savepath.analytic_v2 (rename = (pos_w1_v2 = pos));
	wave = 0;
	if (showed_up_w1 = 1) and (showed_up_w2 = 1) then output;
	keep study_id household_id igg_level igm_level wave pos;
run;

*need to drop these variables in order to rename;
data temp;
	set savepath.analytic_v2;
	drop igg_level igm_level;
run;

data w2;
	set temp (rename = (igg_valuen_v2 = igg_level igm_valuen_v2 = igm_level pos_w2_v2 = pos));
	wave = 1;
	if (showed_up_w1 = 1) and (showed_up_w2 = 1) then output;
	keep study_id household_id igg_level igm_level wave pos;
run;

*append wave 1 and wave 2 antibody results;
data anti;
	set w1 w2;
run;

*mean IgG level at each wave controlling for household;
%macro anti(type);
ods exclude all;
ods graphics off;
ods table LSMeans = mean SolutionF = pe;
proc mixed data = anti;
	class wave (ref = "0") household_id;
	model &type = wave/solution cl;
	random intercept/subject = household_id; 
	lsmean wave/cl;
run;
ods exclude none;

proc print data = pe;
	title "Slope (95% CI) for &type Level";
run;

proc print data = mean;
	title "Mean (95% CI) for &type Level";
run;
%mend anti;
%anti(igg_level);
%anti(igm_level);
ods pdf close;

ods graphics off;
ods exclude all;
*seropositivity log-odds controlling for household ID;
ods table ParameterEstimates = pe;
proc glimmix data = anti;
	class wave (ref = "0") household_id;
	model pos (event = "1") = wave / dist = binary solution cl;
	random intercept/subject = household_id; 
run;
ods exclude none;

proc print data = pe;
	title "Seropositivity Log Odds (95% CI) Controlling for Household (glimmix)";
run;

proc print data = pospercent;
	title "Observed Percentage (95% CI) Seropositivity by Time (logistic)";
run;

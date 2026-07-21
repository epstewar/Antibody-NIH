libname savepath "/directory";
ods pdf file = "/directory/consort.pdf";
OPTIONS nofmterr;
	
	*total number of respondents and households;
	proc sql;
		title "Total respondents and households";
		select count(distinct household_Id) as household_ct, count(*) as respondent_ct from savepath.analytic_v2;
	quit;
	
	*by study arm;
	proc sql;
		title "Total respondents and households by study arm";
		select count(distinct household_Id) as household_ct, count(*) as respondent_ct, factor_one_rc, factor_two_rc from savepath.analytic_v2
		group by factor_one_rc, factor_two_rc
		order by factor_one_rc, factor_two_rc;
	quit;
	
	*collapse categories;
	proc sql;
 	create table new as 
 	select *,
 	case 
 	when specimen_collected = . then ''
 	when specimen_collected = 4 then 'not sent/short draw'
 	when specimen_collected = 5 then 'not sent/refused'
 	when notes_for_results_received like '%Missing%' or 
 	notes_for_results_received like '%missing%' or 
 	notes_for_results_received like '%found%' or 
 	notes_for_results_received like '%lost%' then 'sent/missing'
 	else 'sent/not missing'
	end as sample_status,
 	
 	case
 	when specimen_collected_v2 = . then ''
 	when (specimen_collected_v2 = 4 and igg_w2 = 'missing') then 'not sent/short draw'
 	when (specimen_collected_v2 = 5) then 'not sent/refused'
 	when notes_for_results_received_v2 like '%Missing%' or 
 	notes_for_results_received_v2 like '%missing%' or 
 	notes_for_results_received_v2  like '%found%' or 
 	notes_for_results_received_v2 like '%lost%' or 
 	(specimen_collected_v2 = 1 and results_received_v2 = .) or 
 	specimen_collected_v2 = 6 then 'sent/missing'
 	else 'sent/not missing'
	end as sample_status_v2
	from savepath.analytic_v2;
	quit;
	
*respondent counts by study arm;
data new;
	length sample_status $ 22. sample_status_v2 $ 22.;
	set new;
	if sample_status = '' then sample_status = "lost to follow-up";
	if sample_status_v2 = '' then sample_status_v2 = "lost to follow-up";
run;

*counts by study arm;
*Wave 1;
proc sql;
	title "Wave 1 respondent lost to follow-up counts by study arm";
	select factor_one_rc, factor_two_rc, sample_status, count(*) as respondent_ct from new
	group by factor_one_rc, factor_two_rc, sample_status
	order by factor_one_rc, factor_two_rc, sample_status;
quit;

proc sql;
	title "Wave 1 household lost to follow-up counts by study arm";
	select factor_one_rc, factor_two_rc, sample_status, count(distinct household_id) as household_ct from new
	where head_of_household = 1 and sample_status = 'lost to follow-up'
	group by sample_status, factor_one_rc, factor_two_rc
	order by factor_one_rc, factor_two_rc, sample_status;
quit;

*Wave 2;
proc sql;
	title "Wave 2 respondent lost to follow-up counts by study arm";
	select factor_one_rc, factor_two_rc, sample_status_v2, count(*) as respondent_ct from new
	where sample_status ne 'lost to follow-up' 
	group by factor_one_rc, factor_two_rc, sample_status_v2
	order by factor_one_rc, factor_two_rc, sample_status_v2;
quit;

*household counts by study arm;
proc sql;
	title "Wave 2 household lost to follow-up counts by study arm";
	select factor_one_rc, factor_two_rc, sample_status_v2, count(distinct household_id) as household_ct from new
	where head_of_household = 1 and sample_status ne 'lost to follow-up' and sample_status_v2 = "lost to follow-up"
	group by sample_status_v2, factor_one_rc, factor_two_rc
	order by factor_one_rc, factor_two_rc, sample_status_v2;
quit;
ods pdf close;



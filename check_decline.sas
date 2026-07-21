ods pdf file="/directory/decline_chi_sq.pdf";
libname savepath "/directory";
options nofmterr;

*formats;
proc format;
	value $redcap_event_name_ 'event_1_arm_1'='Event 1 (Arm 1: Arm 1)' 'event_1_arm_2'='Event 1 (Arm 2: Arm 2)';
	value factor_one_ 1='1) PERSONAL RISK CONDITION' 2='2) FAMILY RISK CONDITION';
	value factor_two_ 1='1) FOR INSURANCE CONDITION' 2='2) FOR LOTTERY CONDITION';
	value decision_ 1='Not eligible' 2='Not eligible, not in LA county' 
	3='Not interested, eligibility unknown' 4='Not interested, eligible' 
	5='Not interested, child refusal' 6='Interested, eligible';
	value decision_script_ 1='Decision made prior to script' 2='Decision made after script';
	value decision_declined_re_v_0_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_1_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_2_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_3_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_4_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_5_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_6_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_7_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_8_ 0='Unchecked' 1='Checked';
	value decision_declined_re_v_9_ 0='Unchecked' 1='Checked';
	value decision_cat_ 0="ineligible" 1="declined" 2="agreed";
	value int_cat 0="pers/lott" 1="pers/int" 2="fam/lott" 3="fam/ins";
run;

*add household_id;
data temp;
set savepath.decline_studyarm;
household_id = substr(study_id,1,6);
keep study_id household_id factor_one factor_two decision decision_script;
run;

*remove duplicate households;
*if interested and distinterested in same household, select interested (descending);
proc sort data = temp;
	by household_id descending decision;
run;

data temp;
	set temp;
	by household_id;
	if first.household_id then rn = 1;
	else rn+1;
	*these households are not in analytic sample (999999?), so 'not interested, eligibility unknown' selected;
	if household_id in ('999999', '104830') then decision = 3;
	if rn = 1 then output;
run;

*study ids in analytic file that are missing from decision/screening file (n = 11,921);
proc sql;
	create table temp2 as 
	select household_id, study_id, factor_one, factor_two, decision from savepath.analytic_v2
	where study_id in 
  ('100399-02', '103654-02', '103694-01', '105274-02',
	 '105774-02', '106356-02', '106763-02', '106894-02', '108019-02', '108676-02',
	 '109506-02', '109769-02', '109852-02', '111369-02', '118804-02', '120079-02')
		order by household_id, study_id;
quit;

data temp2;
	set temp2;
	*assuming households missing decision response accepted;
	if decision = . then decision = 6;
run;

*add to decision/screening file (N = 11,921+16 = 11,937);
data temp3;
	set temp temp2;
	if decision in (1,2) then decision_cat = 0;
	else if decision in (3,4,5) then decision_cat = 1;
	else decision_cat = 2;
	if factor_one = 1 and factor_two = 2 then int = 0;
	else if factor_one = 1 and factor_two = 1 then int_cat = 1;
	else if factor_one = 2 and factor_two = 2 then int_cat = 3;
	else if factor_one = 2 and factor_two = 2 then int_cat = 4;
	format decision_cat decision_cat_.;
run;

*make sure there are no duplicate households;
/*proc sql;
	select count(household_id) as ct_house, count(distinct household_id) as ct_distinct_house from temp3;
quit;*/

proc freq data = temp3;
	table decision_cat;
run;

*prop. accepted households by study arm (exclude ineligible and those who declined pre-script);
proc freq data = temp3;
	table factor_one*decision_cat/chisq;
	where decision_cat ne 0;
run;

*prop. accepted households by study arm (exclude ineligible and those who declined pre-script);
proc freq data = temp3;
	table factor_two*decision_cat/chisq;
	where decision_cat ne 0;
run;

*compare decision responses in analytic and screening file;
proc sql;
	create table check as 
	select t.household_id, t.decision as d_v1, l.decision as d_v2, in_analytic, in_screening from 
	(select *,'yes' as in_analytic from savepath.analytic_v2 where head_of_household = 1)t
	full join 
	(select distinct household_id, decision, 'yes' as in_screening from temp)l
	on t.household_id = l.household_id;
quit;

proc sql;
	create table counts as
	select count(*) as ct, d_v1, d_v2, in_analytic, in_screening from check 
	group by d_v1, d_v2, in_analytic, in_screening;
quit;

ods excel file="/directory/screencts_v2.xlsx";
data counts;
	set counts;
	if in_analytic = '' then in_analytic = 'no';
run;

proc print data = counts;
	title1 "Consort diagram numbers";
	title2 "31 respondents included in analysis who later declined";
	title3 "5,316 ineligible and 5,996 declined";
run;
ods pdf close;






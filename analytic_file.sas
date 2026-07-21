libname savepath "/directory";
OPTIONS nofmterr;

data savepath.analytic_v1;
	set savepath.nih_15apr24;
	
	if fi_sna = 3 then fi_sna = 0;
	
	array old {35} self_reported_disability_v2 covid_percept_protect_v2 covid_percept_fam_v2 covid_percept_risk_v2 covid_percept_indep_v2 covid_trust_info_v2 
	percept_risk_v2 cc_imm_v2 cc_autoimm_v2 cc_hypertension_v2 cc_diabetes_v2 cc_chronickd_v2 cc_cancer_v2 cc_cvd_v2 cc_asthma_v2 cc_copd_v2 cc_clung_v2 cc_sickle_v2
	cc_depression_v2 cc_asud_v2 cc_intrav_v2 cc_othermh_v2 cc_otherchroniccond_v2 srha_v fi_snap_v2 fi_ssi_ssdi_v2 family_income_v2 employed_ew_v2 work_wash_v2 work_closecont_v2
	work_ppe_others_v2 	work_ppe_yourself_v2 work_ppe_v2 work_ppe_access_v2 current_employment_status_v2;
  
	array span {35} s_self_reported_disability covid_percept_protect_v covid_percept_fam_v covid_percept_risk_v covid_percept_indep_v covid_trust_info_v 
	percept_ris cc_imm_cd41ef cc_autoimm_c2d93b cc_hypertension_8d5e43 cc_diabetes_8c79a2 cc_chronickd_feb3ef cc_cancer_be993e cc_cvd_3a8430 cc_asthma_de5a1c cc_copd_7146ce cc_clung_00819f
	cc_sickle_7ca04b cc_depression_e3ace0 cc_asud_b0d0cc cc_intrav_72203d cc_othermh_34a736 cc_otherchroniccond_8f65d1 srha fi_sna fi_ssi_ssd family_income_cde0a2 employed_ew_cb1e17
	work_wash_6e6917 work_closecont_9e4b91 work_ppe_other work_ppe_yoursel work_ppe_715948 work_ppe_acces current_employment_status_span;
	
	array new {35} disability covid_percept covid_percept_fam covid_percept_risk covid_percept_indep covid_trust_info risk immunity  
	autoimmune hyper diabetes kidney cancer cvd asthma copd lung sickle depression asud intrav mental chronic srh_assess snap ssi income essential wash contact ppe_others
	ppe_yourself ppe_work ppe_access employ_status;
	
  do i = 1 to 35;
  if old{i} = . then new{i} = span{i};
  else new{i} = old{i};
  end;
  
  array old_v2 {50} covid_info_source_v2___1 covid_info_source_v2___2  covid_info_source_v2___3  covid_info_source_v2___4  covid_info_source_v2___5  covid_info_source_v2___6  
  covid_info_source_v2___7 covid_info_source_v2___8  covid_info_source_v2___9  covid_info_source_v2___10  covid_info_source_v2___11  covid_info_source_v2___90 	vaccine_reasons_v2___1
  vaccine_reasons_v2___2 	vaccine_reasons_v2___3 	vaccine_reasons_v2___4 	vaccine_reasons_v2___5 	vaccine_reasons_v2___6 	vaccine_reasons_v2___7 	vaccine_reasons_v2___8 	vaccine_reasons_v2___9
  vaccine_concerns_v2___1 vaccine_concerns_v2___2 vaccine_concerns_v2___3 vaccine_concerns_v2___4 vaccine_concerns_v2___5 vaccine_concerns_v2___6 vaccine_concerns_v2___7 vaccine_concerns_v2___8
  vaccine_concerns_v2___9 vaccine_concerns_v2___10	fi_discrimation_v2___1 	fi_discrimation_v2___2 	fi_discrimation_v2___3 	fi_discrimation_v2___4 	fi_discrimation_v2___5
  fi_discrimation_v2___6 	fi_discrimation_v2___7 	fi_discrimation_v2___8 	fi_discrimation_v2___9 	fi_discrimation_v2___10 work_transport_v2___1 work_transport_v2___2 work_transport_v2___3
  work_transport_v2___4 work_transport_v2___5 work_transport_v2___6 work_transport_v2___7 work_transport_v2___8 work_transport_v2___90;
  
  array span_v2 {50} covid_info_source_v___1 covid_info_source_v___2 covid_info_source_v___3 covid_info_source_v___4 covid_info_source_v___5 covid_info_source_v___6 
  covid_info_source_v___7 covid_info_source_v___8 covid_info_source_v___9 covid_info_source_v___10 covid_info_source_v___11 covid_info_source_v___90 vaccine_reasons_9a0558___1
  vaccine_reasons_9a0558___2 vaccine_reasons_9a0558___3 vaccine_reasons_9a0558___4 vaccine_reasons_9a0558___5 vaccine_reasons_9a0558___6 vaccine_reasons_9a0558___7 vaccine_reasons_9a0558___8
  vaccine_reasons_9a0558___9 vaccine_concerns_10a54e___1 vaccine_concerns_10a54e___2 vaccine_concerns_10a54e___3 vaccine_concerns_10a54e___4 vaccine_concerns_10a54e___5 vaccine_concerns_10a54e___6
  vaccine_concerns_10a54e___7 vaccine_concerns_10a54e___8 vaccine_concerns_10a54e___9 vaccine_concerns_10a54e___10 	fi_discrimatio___1 	fi_discrimatio___2 	fi_discrimatio___3
  fi_discrimatio___4 	fi_discrimatio___5 	fi_discrimatio___6 	fi_discrimatio___7 	fi_discrimatio___8	fi_discrimatio___9 	fi_discrimatio___10 	work_transpor___1 	work_transpor___2
  work_transpor___3 	work_transpor___4 	work_transpor___5 	work_transpor___6 	work_transpor___7 	work_transpor___8 	work_transpor___90;
  
  do i = 1 to 50;
  if old_v2{i} = 0 and span_v2{i} = 1 then do;
  old_v2{i} = span_v2{i};   
  end;
  end;
  
  array miss{2} tested_for_covid_v2 tested_positive_for_covid_v2;
  do i = 1 to 2;
  miss{i} = miss{i}-1;
  if miss{i} in (97, 98) then miss{i} = .;
  end;
  
  %macro v2(v,anti,no);
	*seropositive version two (including inconclusive);
	if &v = "" then &anti._w&no = "missing";
	else if &v = 1 then &anti._w&no = "yes";
	else if (&v = 2) or (&v = 3) then &anti._w&no = "no";
	else &anti._w&no = "inconclusive";
  %mend v2;
  %v2(igg_result, igg, 1);
  %v2(igg_result_v2, igg, 2);
  %v2(igm_result, igm, 1);
  %v2(igm_result_v2, igm, 2);
  
  *seropositive yes vs. no based on revised antibody levels;
  if (igg_level = . and igm_level = .) then pos_w1 = .;
	else if (0.36 < igg_level) or (0.64 < igm_level) then pos_w1 = 1;
	else pos_w1 = 0;
	
	if (igg_valuen_v2 = . and igm_valuen_v2 = .) then pos_w2 = .;
	else if (0.36 < igg_valuen_v2) or (0.64 < igm_valuen_v2) then pos_w2 = 1;
	else pos_w2 = 0;
	
	*seropositivty based on manufacturer's test levels (igg_result/igm_result);
	*wave 1;
	if (igg_orig = . and igm_orig = .) or (igg_orig = 4 and igm_orig = 4) then pos_w1_v2 = .;
	else if igg_orig in (1, 2) or igm_orig in (1, 2) then pos_w1_v2 = 1;
	else pos_w1_v2 = 0;
	
	*seropositivty based on manufacturer's test levels (igg_result/igm_result);
	*wave 2;
	if (igg_result_v2 = . and igm_result_v2 = .) or (igg_result_v2 = 4 and igm_result_v2 = 4) then pos_w2_v2 = .;
	else if igg_result_v2 in (1, 2) or igm_result_v2 in (1, 2) then pos_w2_v2 = 1;
	else pos_w2_v2 = 0;
  
  *household id;
  household_id = substr(study_id, 1, 6);
  
  *fixing data errors;
  if study_id = '124843-05' then factor_one = 1;
  if study_id = '124843-05' then factor_two = 2;
  if study_id = '102475-03' or study_Id = '102475-04' then factor_one = 1;
  
  *fixing data errors-odd HOH cases;
  if household_id = '101654' then head_of_household = 1;
  if household_id in ('116746', '104262') then delete;
  if study_id = '102475-04' then head_of_household = 2;
  if study_id = '104197-04' then head_of_household = 2;
  
  *recode factor one;
  if factor_one = 1 then factor_one_rc = 0;
  else factor_one_rc = 1;
  
  *recode factor two;
  if factor_two = 2 then factor_two_rc = 0;
  else factor_two_rc = 1;
  
  *had testing;
  if specimen_collected ne . then showed_up_w1 = 1;
 	else showed_up_w1 = 0; 
 	
  if specimen_collected = . then third_out = 0;
  else if specimen_collected ne . and specimen_collected_v2 = . then third_out = 1;
  else if specimen_collected ne . and specimen_collected_v2 ne . then third_out = 2;
  
  if specimen_collected_v2 ne . then showed_up_w2 = 1;
 	else showed_up_w2 = 0;
 run;
 
*clean/create survey predictors;
data savepath.analytic_v2;
	length race $ 32.;
	set savepath.analytic_v1 (rename = (tested_for_covid_v2 = tested tested_positive_for_covid_v2 = tested_pos));
	
	*reverse code risk aversion;
	risk_rc = 10 - risk;
	
	if risk = . then risk_v2 = .;
	else if 0 <= risk <= 5 then risk_v2 = 1;
	else risk_v2 = 0;
	
  *essential worker;
	if essential = 98 then essential = .;
	
	*wash ordinal-yes, all the time to no, not at all;
	if wash = 6 then wash = .;
	
	*wash binary, 1 = yes, all the time vs. other;
	if wash = . then wash_v2 = .;
	else if wash = 1 then wash_v2 = 1;
	else wash_v2 = 0;
	
	*contact ordinal-yes, all the time to no, not at all;
	if contact = 6 then contact = .;
	
	*contact binary- yes, all the time vs. other;
	if contact = . then contact_v2 = .;
	else if contact = 1 then contact_v2 = 1;
	else contact_v2 = 0;
	
	*ppe_others ordinal-wearing cloth masks, 1 = never, 5 = always;
	if ppe_others = 6 then ppe_others = .;
	
	*reverse code PPE;
	ppe_others_rc = 5 - ppe_others;
	
	*ppe_others binary-never vs. other;
	if ppe_others = . then ppe_others_v2 = .;
	else if ppe_others = 1 then ppe_others_v2 = 1;
	else ppe_others_v2 = 0;
	
	*ppe_yourself ordinal-1 = never, 5 = always;
	if ppe_yourself = 6 then ppe_yourself = .;
	
	*reverse code ppe_yourself;
	ppe_yourself_rc = 5-ppe_yourself;
	
	*ppe_yourself, binary-never vs. other;
	if ppe_yourself = . then ppe_yourself_v2 = .;
	else if ppe_yourself = 1 then ppe_yourself_v2 = 1;
	else ppe_yourself_v2 = 0;
	
	*ppe_work, how often access to PPE-ordinal, 1 = All the time, 5 = never;
	if ppe_work = 6 then ppe_work = .;
	
	*ppe_work, binary, 1 = All the time vs. other;
	if ppe_work = . then ppe_work_v2 = .;
	else if ppe_work = 5 then ppe_work_v2 = 1;
	else ppe_work_v2 = 0;
	
	*ppe_access, how often work provide you with PPE-ordinal, 1 = never, 5 = always;
	if ppe_access = 6 then ppe_access = .;
	ppe_access_rc = 5-ppe_access;
	
	*ppe_access, binary-1 = never, 5 = always;
	if ppe_access = . then ppe_access_v2 = .;
	else if ppe_access = 1 then ppe_access_v2 = 1;
	else ppe_access_v2 = 0;
	
	*transportation ordinal- ___2 = carpool, ___3 = bus, ___4 = subway/train, ___5 = long-distance train;
	transport_v2 = work_transport_v2___2 + work_transport_v2___3 + work_transport_v2___4 + work_transport_v2___5;
	
	*transportation binary, 1 = at least one risky transportation item vs. no risky transportation;
	if transport_v2 = . then transport_v3 = .;
	else if transport_v2 > 0 then transport_v3 = 1;
	else transport_v3 = 0;
	
	*work_ppe, one point per risky item: essential worker, wash, higher scores indicate higher risk;
	work_ppe = essential + wash + contact + ppe_others_rc + ppe_yourself_rc + ppe_work + ppe_access_rc;
	
	*binary-at least one risky PPE/work situation vs. none;
	if work_ppe = . then work_ppe_v2 = .;
	else if work_ppe GE 8 then work_ppe_v2 = 0;
	else work_ppe_v2 = 1;
	
	*empoloyment status categorical-working now, laid off. 96 = other, 98, 99 don't know and prefer not to anwer;
	if employ_status in (98, 99) then employ_status = .;
	if employ_status = 96 then employ_status = 8;
	employ_status = employ_status - 1;
	
	*employment binary, 0 = employed, 1 = other;
	if employ_status = . then employ_status_v2 = .;
	else if employ_status = 0 then employ_status_v2 = 0;
	else employ_status_v2 = 1;
	
	*change race/ethnicity;
	if race_ethn_hispanic_2 = 99 then race_ethn_hispanic_2 = .;
	
	if race_ethn_race_2___1 = 1 or race_ethn_race_2___3 = 1 or race_ethn_race_2___4 = 1 then asian = 1;
	else asian = 0;
	
	*covid trust info, make into binary dummies;
	covid_trust_info = covid_trust_info - 1;
	
	%macro dodummy;
	%do i = 0 %to 10;
	if covid_trust_info = &i then covid_trust_info___&i = 1;
	else covid_trust_info___&i = 0;
  %end;
  %mend dodummy;
  %dodummy;
	
	*race/ethnicity: ___2 = black, ___5 = white, Asian = ___1, ___3, ___4 (see above);
	*includes mixed race;
	if race_ethn_race_2___2 = 1 then race = 1;
	else if race_ethn_race_2___5 then race = 0;
	else if asian = 1 then race = 2;
	else if race_ethn_race_2___15 then race = 3;
	else if (race_ethn_race_2___2 = 1) and (race_ethn_race_2___5 = 1) then race = 4;
	else if (race_ethn_race_2___2 = 1) and (asian = 1) then race = 5;
	else if (race_ethn_race_2___2 = 1) and (race_ethn_race_2___15) then race = 6;
	else if (race_ethn_race_2___5 = 1) and (race_ethn_race_2___15) then race = 7;
	else if (race_ethn_race_2___5 = 1) and (asian = 1) then race = 8;
	else if (asian = 1) and (race_ethn_race_2___15 = 1) then race = 9;
	else race = '';
	
	*race simple: 0 = white, 1 = black, 2 = asian, 3 = other;
	if 0 <= race <= 4 then race_v2 = race;
	else if race > 4 then race_v2 = 5;
	
	*race, binary white vs. other;
	if race = . then race_v3 = .;
	else if race = 0 then race_v3 = 0;
	else race_v3 = 1;
	
	*combine race and ethnicity;
	if race_v3 = . or race_ethn_hispanic_2 = . then race_ethn = .;
	else if race_v3 = 0 and race_ethn_hispanic_2 = 1 then race_ethn = 1;
	else if race_v3 = 0 and race_ethn_hispanic_2 = 0 then race_ethn = 0;
	else if race_v3 = 1 and race_ethn_hispanic_2 = 0 then race_ethn = 2;
	else if race_v3 = 1 and race_ethn_hispanic_2 = 1 then race_ethn = 3;
	
	if race_ethn = . then race_ethn_v2 = .;
	else if race_ethn = 3 then race_ethn_v2 = 1;
	else race_ethn_v2 = 0;
	
	*covid percept protect: believe covid vaccine will help, 0 = strongly disagree, 4 = strongly agree;
	covid_percept = covid_percept - 1;
	*covid percept fam.: believe vaccine will help family, 0 = strongly disagree, 4 = strongly agree;
	covid_percept_fam = covid_percept_fam - 1;
	*covid percept risk: believe it will help reduce my covid risk, 0 = strongly disagree, 4 = strongly agree;
	covid_percept_risk = covid_percept_risk - 1;
	
	*covid percept all: more points equals higher belief that vaccine will help;
	covid_percept_all = covid_percept+covid_percept_fam+covid_percept_risk;
	
	*binary: those who strongly disagree vs. everyone else;
	if covid_percept_all = . then covid_percept_all_v2 = .;
	else if covid_percept_all > 9 then covid_percept_all_v2 = 1;
	else covid_percept_all_v2 = 0;
	
	*food stamps binary: 0 = no, 1 = yes;
	if snap = . then snap_v2 = .;
	else if snap = 0 then snap_v2 = 0;
	else snap_v2 = 1;
	
	*SSI binary 0 = no, 1 = yes;
	ssi = ssi - 1;
	if ssi = . then ssi_v2 = .;
	else if ssi = 3 then ssi_v2 = 0;
	else ssi_v2 = 1;
	
	*ssi v3: 0 = none, 1 = children or adults receive, 2 = both children and adults receive;
  if ssi = . then ssi_v3 = .;
  else if ssi in (1, 2) then ssi_v3 = 1;
  else if ssi = 3 then ssi_v3 = 2;
  else ssi_v3 = 0;
  
  *reverse code SSI for summed income;
  if ssi = . then ssi_rc = .;
  else if ssi = 3 then ssi_rc = 2;
  else if ssi in (1, 2) then ssi_rc = 1;
  else ssi_rc = 0;
  
  *reverse code snap binary;
  if snap = . then snap_rc = .;
  else if snap = 0 then snap_rc = 1;
  else snap_rc = 0;
  
  if disability = 98 then disability = .;
  if income = 99 then income = .;
  
  *economic security: orindal, higher values indicate greater security;
  econ_sec = income + snap_rc + ssi_rc;
  
  *binary economic security: greater than two points econ. insecurity and 2 points or less;
  if econ_sec = . then econ_sec_v2 = .;
  else if econ_sec > 5 then econ_sec_v2 = 1;
  else econ_sec_v2 = 0;
  
  *binary income: <= 49,000 vs. above 49,000;
  if income = . then income_v2 = .;
  else if income LE 5 then income_v2 = 1;
  else income_v2 = 0;
  
  *discriminatory instances, ordinal: at school, job, etc.;
  discrimination = fi_discrimation_v2___1 + fi_discrimation_v2___2 + fi_discrimation_v2___3 + fi_discrimation_v2___4 + fi_discrimation_v2___5 + fi_discrimation_v2___6 + fi_discrimation_v2___7 + fi_discrimation_v2___8 + fi_discrimation_v2___9 + fi_discrimation_v2___10;
  
  *discrimination, binary: 0 = no instances, 1 = at least one;
  if discrimination = . then discrimination_v2 = .;
  else if discrimination => 2 then discrimination_v2 = 1;
  else discrimination_v2 = 0;
  
  *health, ordinal: no of health conditions, diabetes, kidney, etc;
  health = immunity + autoimmune + hyper + diabetes + kidney + cancer + cvd + asthma + copd + lung + sickle + depression + asud + intrav + mental + chronic; 
  
  *health, binary: any health condition vs . none;
  if health = . then health_v2 = .;
  else if health > 0 then health_v2 = 1;
  else health_v2 = 0;
  
  *recode decision;
  if decision = . then decision_rc = .;
  else if decision = 1 then decision_rc = .;
  else if decision = 6 then decision_rc = 1;
  else decision_rc = 0; 
  
  *self reported health: binary, excellent vs. not excellent;
  if self_reported_health_v_1 = . then srh_assess = .;
  else if self_reported_health_v_1 in (1, 2) then srh_assess = 1;
  else srh_assess = 0;
  
  if factor_one_rc = 0 and factor_two_rc = 0 then int_cat = 0;
  else if factor_one_rc = 0 and factor_two_rc = 1 then int_cat = 1;
  else if factor_one_rc = 1 and factor_two_rc = 0 then int_cat = 2;
  else if factor_one_rc = 1 and factor_two_rc = 1 then int_cat = 3;
  
  *earnings analysis;
  if showed_up_w1 = 0 and showed_up_w2 = 0 then earnings = 0;
  else if showed_up_w1 = 1 and showed_up_w2 = 0 then earnings = 54;
  else if showed_up_w1 = 1 and showed_up_w2 = 1 then earnings = 60;
run;

*restructure data;
data temp;
set savepath.analytic_v2;
if factor_one_rc ne . then output;
run;

*analytic data long format for Model 1;
*wave 1;
data w1;
	set temp (rename = (showed_up_w1 = showed_up));
	wave = 0;
	keep household_id study_id factor_one_rc factor_two_rc int_cat wave showed_up;
run;

*wave 2;
data w2;
	set temp (rename = (showed_up_w2 = showed_up));
	wave = 1;
	if showed_up_w1 = 1 then output;
	keep household_id study_id factor_one_rc factor_two_rc int_cat wave showed_up;
run;

*combine wave 1 and wave 2;
data savepath.analytic;
	set w1 w2;
run;

*export data;
proc export data = savepath.analytic 
	outfile = "/directory/analytic.dta"
	dbms = dta
	replace;
run;
	
proc export data = savepath.analytic 
	outfile = "/directory/analytic.csv"
	dbms = csv
	replace;
run;
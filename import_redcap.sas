libname savepath "/directory";

/* Edit the following line to reflect the full path to your CSV file */
%let csv_file = '/directory/NIHfile.csv';

OPTIONS nofmterr;

proc format;
	value $redcap_event_name_ 'event_1_arm_1'='Event 1 (Arm 1: Arm 1)' 'event_1_arm_2'='Event 1 (Arm 2: Arm 2)';
	value head_of_household_ 1='Yes, participating' 2='No, participating' 
		3='Not eligible / Not interested but HH participating';
	value factor_one_ 1='1) PERSONAL RISK CONDITION' 2='2) FAMILY RISK CONDITION';
	value factor_two_ 1='1) FOR INSURANCE CONDITION' 2='2) FOR LOTTERY CONDITION';
	value race_ethn_race_2___1_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___2_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___3_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___4_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___5_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___15_ 0='Unchecked' 1='Checked';
	value race_ethn_race_2___99_ 0='Unchecked' 1='Checked';
	value race_ethn_hispanic_2_ 0='No, not of Hispanic, Latino, or Spanish origin / No, no de origen hispano, latino o español' 1='Yes, of Hispanic, Latino, or Spanish origin / Sí, de origen hispano, latino o español' 
		99='Prefer not to answer / Prefiero no responder';
	value birth_sex_ 1='Female / Femenino' 0='Male / Masculino' 
		2='Non-binary / No binario(a)' 96='None of these describe me / Ninguno de estos me describe' 
		99='Prefer not to answer / Prefiero no responder';
	value education_level_ 0='Have never gone to school / Nunca he ido a la escuela' 1='5th grade or less / 5º grado o menos' 
		2='6th to 8th grade / de 6º a 8º grado' 3='9th to 12th grade, no diploma / 9º a 12º grado, sin diploma' 
		4='High school graduate or GED completed / Graduado de la escuela secundaria o GED completado' 5='Some college level/ Technical / Vocational degree / Algún nivel universitario / técnico / título vocacional' 
		6='Bachelor''s degree / Licenciatura' 7='Other advanced degree (Master''s, Doctoral degree) /  Otro grado avanzado (Maestría, Doctorado)' 
		98='Prefer not to answer / Prefiero no responder' 99='Don''t know / No lo sé';
	value specimen_collected_ 1='Yes, full' 2='Yes, short draw, one specimen sent' 
		3='Yes, short draw, two specimen sent' 4='Yes, short draw, no specimen sent' 
		5='No, refused' 6='Other (specify in notes)';
	value general_results_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igg_result_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igm_result_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igg_result_2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igm_result_2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igm_result_v2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igg_result_v2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value withdrawn___yes_ 0='Unchecked' 1='Checked';
	value specimen_collected_v2_ 1='Yes, full' 2='Yes, short draw, one specimen sent' 
		3='Yes, short draw, two specimen sent' 4='Yes, short draw, no specimen sent' 
		5='No, refused' 6='Other (specify in notes)';
	value specimen_collected_2_v2_ 1='Yes, full' 2='Yes, short draw, one specimen sent' 
		3='Yes, short draw, two specimen sent' 4='Yes, short draw, no specimen sent' 
		5='No, refused' 6='Other (specify in notes)';
	value igm_result_2_v2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value igg_result_2_v2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value specimen_collected_2_ 1='Yes, full' 2='Yes, short draw, one specimen sent' 
		3='Yes, short draw, two specimen sent' 4='Yes, short draw, no specimen sent' 
		5='No, refused' 6='Other (specify in notes)';
	value specimen_collection_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value results_received_ 1='Yes' 0='No';
	value results_recieved_not_exp___1_ 0='Unchecked' 1='Checked';
	value results_received_v2_ 1='Yes' 0='No';
	value results_received_not_exp_2___1_ 0='Unchecked' 1='Checked';
	value general_results_v2_ 1='Positive' 2='Borderline Positive' 
		3='Negative' 4='Inconclusive';
	value specimen_collection__v_0_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value current_employment_status_v2_ 1='Working now' 2='Only temporarily laid off, sick leave or maternity leave' 
		3='Looking for work, unemployed' 4='Retired' 
		5='Disabled, permanently or temporarily' 6='Keeping house' 
		7='Student' 96='Other (Specify)' 
		98='Prefer not to answer' 99='Don''t know';
	value covid_percept_protect_v2_ 1='1 (strongly disagree)' 2='2' 
		3='3' 4='4' 
		5='5 (strongly agree)';
	value covid_percept_fam_v2_ 1='1 (strongly disagree)' 2='2' 
		3='3' 4='4' 
		5='5 (strongly agree)';
	value percept_risk_v2_ 0='0' 1='1' 
		2='2' 3='3' 
		4='4' 5='5' 
		6='6' 7='7' 
		8='8' 9='9' 
		10='10';
	value covid_percept_risk_v2_ 1='1 (strongly disagree)' 2='2' 
		3='3' 4='4' 
		5='5 (strongly agree)';
	value covid_percept_indep_v2_ 1='1 (strongly disagree)' 2='2' 
		3='3' 4='4' 
		5='5 (strongly agree)';
	value family_income_v2_ 1='Less than $15,000' 2='$15,000 - $19,999' 
		3='$20,000 - $24,999' 4='$25,000 - $34,999' 
		5='$35,000 - $49,999' 6='$50,000 - $74,999' 
		7='$75,000 - $99,999' 8='$100,000 and above' 
		99='Prefer not to answer';
	value employed_ew_v2_ 1='Yes' 0='No' 
		99='Prefer not to answer' 98='Unknown';
	value tested_for_covid_v2_ 1='Yes   (Sí)' 2='No' 
		98='Don''t know   ( No lo sé)' 99='Prefer not to answer   (Prefiero no responder)';
	value positivemonth_covidtest_v2_ 1='January   (enero)' 2='February   (febrero)' 
		3='March   (marzo)' 4='April   (abril)' 
		5='May   (mayo)' 6='June   (junio)' 
		7='July   (Julio)' 8='August   (agosto)' 
		9='September   (septiembre)' 10='October   (octubre)' 
		11='November   (noviembre)' 12='December   (diciembre)';
	value positiveyear_covidtest_v2_ 1='2019' 2='2020' 
		3='2021' 4='2022';
	value tested_positive_for_covid_v2_ 1='Yes   (Sí)' 2='No' 
		98='Don''t know   ( No lo sé)' 99='Prefer not to answer   (Prefiero no responder)';
	value covid_info_source_v2___1_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___2_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___3_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___4_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___5_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___6_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___7_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___8_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___9_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___10_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___11_ 0='Unchecked' 1='Checked';
	value covid_info_source_v2___90_ 0='Unchecked' 1='Checked';
	value covid_trust_info_v2_ 1='Spouse/partner' 2='Other family members' 
		3='Friends or coworkers' 4='Religious leader' 
		5='Doctor/medical provider' 6='Television' 
		7='Radio or podcosts' 8='Newspaper (printed or online)' 
		9='Government or other official websites' 10='Social media' 
		11='Google search, Wikipedia, or other nongovernmental websites' 90='Other';
	value vaccine_reasons_v2___1_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___2_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___3_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___4_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___5_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___6_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___7_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___8_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_v2___9_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___1_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___2_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___3_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___4_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___5_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___6_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___7_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___8_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___9_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_v2___10_ 0='Unchecked' 1='Checked';
	value cc_imm_v2_ 1='Yes' 0='No';
	value cc_autoimm_v2_ 1='Yes' 0='No';
	value cc_hypertension_v2_ 1='Yes' 0='No';
	value cc_chronickd_v2_ 1='Yes' 0='No';
	value cc_diabetes_v2_ 1='Yes' 0='No';
	value cc_cancer_v2_ 1='Yes' 0='No';
	value cc_cvd_v2_ 1='Yes' 0='No';
	value cc_asthma_v2_ 1='Yes' 0='No';
	value cc_copd_v2_ 1='Yes' 0='No';
	value cc_clung_v2_ 1='Yes' 0='No';
	value cc_sickle_v2_ 1='Yes' 0='No';
	value cc_depression_v2_ 1='Yes' 0='No';
	value cc_asud_v2_ 1='Yes' 0='No';
	value cc_intrav_v2_ 1='Yes' 0='No';
	value cc_othermh_v2_ 1='Yes' 0='No';
	value cc_otherchroniccond_v2_ 1='Yes' 0='No';
	value self_reported_health_v_1_ 1='Excellent' 2='Very good' 
		3='Good' 4='Fair' 
		5='Poor' 99='Prefer not to answer' 
		98='Don''t know';
	value self_reported_disability_v2_ 1='Yes' 0='No' 
		98='Prefer not to answer';
	value fi_discrimation_v2___1_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___2_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___3_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___4_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___5_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___6_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___7_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___8_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___9_ 0='Unchecked' 1='Checked';
	value fi_discrimation_v2___10_ 0='Unchecked' 1='Checked';
	value jobloss_covid19_v2_ 1='Yes' 0='No';
	value fi_ssi_ssdi_v2_ 1='Yes, one or more children only' 2='Yes, one or more adults only' 
		3='Yes, both one or more children and one or more adults' 4='No';
	value fi_snap_v2_ 1='Yes, starting before the COVID-19 pandemic started' 2='Yes, starting after the COVID-19 pandemic started' 
		0='No';
	value work_wash_v2_ 1='Yes, all of the time' 2='Yes, most of the time' 
		3='Some of the time' 4='Rarely' 
		5='Not at all' 6='Not Applicable';
	value work_closecont_v2_ 1='Yes, all of the time' 2='Yes, most of the time' 
		3='Some of the time' 4='Rarely' 
		5='Not at all' 6='Not Applicable';
	value work_ppe_v2_ 1='Yes, all of the time' 2='Yes, most of the time' 
		3='Some of the time' 4='Rarely' 
		5='Not at all' 6='Not applicable';
	value work_ppe_others_v2_ 1='Never' 2='Rarely' 
		3='Sometimes' 4='Most of the time' 
		5='Always' 6='Not Applicable';
	value work_ppe_yourself_v2_ 1='Never' 2='Rarely' 
		3='Sometimes' 4='Most of the time' 
		5='Always' 6='Not Applicable';
	value work_ppe_access_v2_ 1='Never' 2='Rarely' 
		3='Sometimes' 4='Most of the time' 
		5='Always' 6='Not Applicable';
	value work_transport_v2___1_ 0='Unchecked' 1='Checked';
	value work_transport_v2___2_ 0='Unchecked' 1='Checked';
	value work_transport_v2___3_ 0='Unchecked' 1='Checked';
	value work_transport_v2___4_ 0='Unchecked' 1='Checked';
	value work_transport_v2___5_ 0='Unchecked' 1='Checked';
	value work_transport_v2___6_ 0='Unchecked' 1='Checked';
	value work_transport_v2___7_ 0='Unchecked' 1='Checked';
	value work_transport_v2___8_ 0='Unchecked' 1='Checked';
	value work_transport_v2___90_ 0='Unchecked' 1='Checked';
	value jobloss_covid19_span_ 1='Sí' 0='No';
	value current_employment_status_span_ 1='Actualmente con trabajo' 2='Solo temporalmente despedido, licencia por enfermedad o por maternidad' 
		3='Buscando trabajo, desempleado' 4='Jubilado' 
		5='Discapacitado, permanente o temporalmente' 6='Trabajo doméstico' 
		7='Estudiante' 96='Otro (especificar)' 
		98='Prefiero no responder' 99='No lo sé';
	value employed_ew_cb1e17_ 1='Sí' 0='No' 
		99='Prefiero no responder' 98='Incierto';
	value family_income_cde0a2_ 1='Menos de $15,000' 2='$15,000 - $19,999' 
		3='$20,000 - $24,999' 4='$25,000 - $34,999' 
		5='$35,000 - $49,999' 6='$50,000 - $74,999' 
		7='$75,000 - $99,999' 8='$100,000 y más' 
		99='Prefiero no responder';
	value percept_ris_ 0='0' 1='1' 
		2='2' 3='3' 
		4='4' 5='5' 
		6='6' 7='7' 
		8='8' 9='9' 
		10='10';
	value work_wash_6e6917_ 1='Sí, todo el tiempo' 2='Sí, la mayoría del tiempo' 
		3='En algunos momentos' 4='Rara vez' 
		5='No en absoluto' 6='No aplica';
	value work_closecont_9e4b91_ 1='Sí, todo el tiempo' 2='Sí, la mayoría del tiempo' 
		3='En algunos momentos' 4='Rara vez' 
		5='No en absoluto' 6='No aplica';
	value work_ppe_other_ 1='Nunca' 2='Rara vez' 
		3='A veces' 4='La mayor parte del tiempo' 
		5='Siempre' 6='No aplica';
	value work_ppe_yoursel_ 1='Nunca' 2='Rara vez' 
		3='A veces' 4='La mayor parte del tiempo' 
		5='Siempre' 6='No aplica';
	value work_ppe_715948_ 1='Sí, todo el tiempo' 2='Sí, la mayoría del tiempo' 
		3='En algunos momentos' 4='Raras veces' 
		5='No en absoluto' 6='No aplica';
	value work_ppe_acces_ 1='Nunca' 2='Rara vez' 
		3='A veces' 4='La mayor parte del tiempo' 
		5='Siempre' 6='No aplica';
	value cc_imm_cd41ef_ 1='Sí' 0='No';
	value cc_autoimm_c2d93b_ 1='Sí' 0='No';
	value cc_hypertension_8d5e43_ 1='Sí' 0='No';
	value cc_diabetes_8c79a2_ 1='Sí' 0='No';
	value cc_chronickd_feb3ef_ 1='Sí' 0='No';
	value cc_cancer_be993e_ 1='Sí' 0='No';
	value cc_cvd_3a8430_ 1='Sí' 0='No';
	value cc_asthma_de5a1c_ 1='Sí' 0='No';
	value cc_copd_7146ce_ 1='Sí' 0='No';
	value cc_clung_00819f_ 1='Sí' 0='No';
	value cc_depression_e3ace0_ 1='Sí' 0='No';
	value cc_asud_b0d0cc_ 1='Sí' 0='No';
	value cc_sickle_7ca04b_ 1='Sí' 0='No';
	value cc_intrav_72203d_ 1='Sí' 0='No';
	value cc_othermh_34a736_ 1='Sí' 0='No';
	value cc_otherchroniccond_8f65d1_ 1='Sí' 0='No';
	value s_self_reported_heal_v_2_ 1='Excelente' 2='Muy bien' 
		3='Buena' 4='Regular' 
		5='Mala' 99='Prefiero no responder' 
		98='No lo sé';
	value s_self_reported_disability_ 1='Sí' 0='No' 
		98='Prefiero no responder';
	value covid_percept_protect_v_ 1='1 (muy en desacuerdo)' 2='2' 
		3='3' 4='4' 
		5='5 (Totalmente de acuerdo)';
	value covid_percept_fam_v_ 1='1 (muy en desacuerdo)' 2='2' 
		3='3' 4='4' 
		5='5 (Totalmente de acuerdo)';
	value covid_percept_risk_v_ 1='1 (muy en desacuerdo)' 2='2' 
		3='3' 4='4' 
		5='5 (Totalmente de acuerdo)';
	value covid_percept_harm_v_ 1='1 (muy en desacuerdo)' 2='2' 
		3='3' 4='4' 
		5='5 (Totalmente de acuerdo)';
	value covid_percept_indep_v_ 1='1 (muy en desacuerdo)' 2='2' 
		3='3' 4='4' 
		5='5 (Totalmente de acuerdo)';
	value covid_trust_info_v_ 1='Cónyuge / pareja' 2='Otros miembros de la familia' 
		3='Amigos(a) o compañeros de trabajo' 4='Líder religioso' 
		5='Doctor / proveedor médico' 6='Televisión' 
		7='Radio o podcasts' 8='Periódico (impreso o en línea)' 
		9='Gobierno u otros sitios web oficiales' 10='Redes sociales' 
		11='Búsqueda de Google, Wikipedia u otros sitios web no gubernamentales' 90='Otro';
	value covid_info_source_v___1_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___2_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___3_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___4_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___5_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___6_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___7_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___8_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___9_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___10_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___11_ 0='Unchecked' 1='Checked';
	value covid_info_source_v___90_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___1_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___2_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___3_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___4_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___5_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___6_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___7_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___8_ 0='Unchecked' 1='Checked';
	value vaccine_reasons_9a0558___9_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___1_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___2_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___3_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___4_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___5_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___6_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___7_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___8_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___9_ 0='Unchecked' 1='Checked';
	value vaccine_concerns_10a54e___10_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___1_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___2_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___3_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___4_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___5_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___6_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___7_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___8_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___9_ 0='Unchecked' 1='Checked';
	value fi_discrimatio___10_ 0='Unchecked' 1='Checked';
	value work_transpor___1_ 0='Unchecked' 1='Checked';
	value work_transpor___2_ 0='Unchecked' 1='Checked';
	value work_transpor___3_ 0='Unchecked' 1='Checked';
	value work_transpor___4_ 0='Unchecked' 1='Checked';
	value work_transpor___5_ 0='Unchecked' 1='Checked';
	value work_transpor___6_ 0='Unchecked' 1='Checked';
	value work_transpor___7_ 0='Unchecked' 1='Checked';
	value work_transpor___8_ 0='Unchecked' 1='Checked';
	value work_transpor___90_ 0='Unchecked' 1='Checked';
	value fi_ssi_ssd_ 1='Sí, uno o más niños(a) solamente.' 2='Sí, uno o más adultos solamente' 
		3='Sí, tanto uno o más niños como uno o más adultos' 4='No';
	value fi_sna_ 1='Sí, antes de que comenzara la pandemia de COVID-19' 2='Sí, después de que comenzara la pandemia de COVID-19' 
		3='No';
	value decision_ 1='Not eligible' 2='Not eligible, not in LA county' 
		3='Not interested, eligibility unknown' 4='Not interested, eligible' 
		5='Not interested, child refusal' 6='Interested, eligible';
	value decision_v2_ 1='Not eligible' 2='Not interested, eligibility unknown' 
		3='Not interested, eligible' 4='Interested, eligible';
run;

data work.redcap; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id $500. ;
	informat redcap_event_name $500. ;
	informat head_of_household best32. ;
	informat factor_one best32. ;
	informat factor_two best32. ;
	informat decision_date yymmdd10. ;
	informat age best32. ;
	informat race_ethn_race_2___1 best32. ;
	informat race_ethn_race_2___2 best32. ;
	informat race_ethn_race_2___3 best32. ;
	informat race_ethn_race_2___4 best32. ;
	informat race_ethn_race_2___5 best32. ;
	informat race_ethn_race_2___15 best32. ;
	informat race_ethn_race_2___99 best32. ;
	informat race_ethn_hispanic_2 best32. ;
	informat birth_sex best32. ;
	informat education_level best32. ;
	informat specimen_collected best32. ;
	informat collection_date $500. ;
	informat codefarnear $500. ;
	informat general_results best32. ;
	informat igg_result best32. ;
	informat igm_result best32. ;
	informat igg_result_2 best32. ;
	informat igm_result_2 best32. ;
	informat collection_date_v2 $500. ;
	informat igm_result_v2 best32. ;
	informat igg_result_v2 best32. ;
	informat lot_date_2 yymmdd10. ;
	informat withdrawn___yes best32. ;
	informat specimen_collected_v2 best32. ;
	informat specimen_collected_2_v2 best32. ;
	informat igm_result_2_v2 best32. ;
	informat igg_result_2_v2 best32. ;
	informat specimen_collected_2 best32. ;
	informat notes_bio_collection_2 $5000. ;
	informat specimen_collection_complete best32. ;
	informat results_received best32. ;
	informat results_recieved_not_exp___1 best32. ;
	informat notes_for_results_received $5000. ;
	informat notes_for_results_received_v2 $5000. ;
	informat results_received_v2 best32. ;
	informat results_received_not_exp_2___1 best32. ;
	informat general_results_v2 best32. ;
	informat notes_bio_collection_2_v2 $5000. ;
	informat specimen_collection__v_0 best32. ;
	informat current_employment_status_v2 best32. ;
	informat covid_percept_protect_v2 best32. ;
	informat covid_percept_fam_v2 best32. ;
	informat percept_risk_v2 best32. ;
	informat covid_percept_risk_v2 best32. ;
	informat covid_percept_indep_v2 best32. ;
	informat family_income_v2 best32. ;
	informat employed_ew_v2 best32. ;
	informat tested_for_covid_v2 best32. ;
	informat positivemonth_covidtest_v2 best32. ;
	informat positiveyear_covidtest_v2 best32. ;
	informat tested_positive_for_covid_v2 best32. ;
	informat covid_info_source_v2___1 best32. ;
	informat covid_info_source_v2___2 best32. ;
	informat covid_info_source_v2___3 best32. ;
	informat covid_info_source_v2___4 best32. ;
	informat covid_info_source_v2___5 best32. ;
	informat covid_info_source_v2___6 best32. ;
	informat covid_info_source_v2___7 best32. ;
	informat covid_info_source_v2___8 best32. ;
	informat covid_info_source_v2___9 best32. ;
	informat covid_info_source_v2___10 best32. ;
	informat covid_info_source_v2___11 best32. ;
	informat covid_info_source_v2___90 best32. ;
	informat covid_info_source_other_v2 $500. ;
	informat covid_trust_info_v2 best32. ;
	informat covid_trust_info_other_v2 $500. ;
	informat vaccine_reasons_v2___1 best32. ;
	informat vaccine_reasons_v2___2 best32. ;
	informat vaccine_reasons_v2___3 best32. ;
	informat vaccine_reasons_v2___4 best32. ;
	informat vaccine_reasons_v2___5 best32. ;
	informat vaccine_reasons_v2___6 best32. ;
	informat vaccine_reasons_v2___7 best32. ;
	informat vaccine_reasons_v2___8 best32. ;
	informat vaccine_reasons_v2___9 best32. ;
	informat vaccine_concerns_v2___1 best32. ;
	informat vaccine_concerns_v2___2 best32. ;
	informat vaccine_concerns_v2___3 best32. ;
	informat vaccine_concerns_v2___4 best32. ;
	informat vaccine_concerns_v2___5 best32. ;
	informat vaccine_concerns_v2___6 best32. ;
	informat vaccine_concerns_v2___7 best32. ;
	informat vaccine_concerns_v2___8 best32. ;
	informat vaccine_concerns_v2___9 best32. ;
	informat vaccine_concerns_v2___10 best32. ;
	informat cc_imm_v2 best32. ;
	informat cc_autoimm_v2 best32. ;
	informat cc_hypertension_v2 best32. ;
	informat cc_chronickd_v2 best32. ;
	informat cc_diabetes_v2 best32. ;
	informat cc_cancer_v2 best32. ;
	informat cc_cvd_v2 best32. ;
	informat cc_asthma_v2 best32. ;
	informat cc_copd_v2 best32. ;
	informat cc_clung_v2 best32. ;
	informat cc_sickle_v2 best32. ;
	informat cc_depression_v2 best32. ;
	informat cc_asud_v2 best32. ;
	informat cc_intrav_v2 best32. ;
	informat cc_othermh_v2 best32. ;
	informat cc_otherchroniccond_v2 best32. ;
	informat self_reported_health_v_1 best32. ;
	informat self_reported_disability_v2 best32. ;
	informat fi_discrimation_v2___1 best32. ;
	informat fi_discrimation_v2___2 best32. ;
	informat fi_discrimation_v2___3 best32. ;
	informat fi_discrimation_v2___4 best32. ;
	informat fi_discrimation_v2___5 best32. ;
	informat fi_discrimation_v2___6 best32. ;
	informat fi_discrimation_v2___7 best32. ;
	informat fi_discrimation_v2___8 best32. ;
	informat fi_discrimation_v2___9 best32. ;
	informat fi_discrimation_v2___10 best32. ;
	informat cur_employ_stat_specify_v2 $500. ;
	informat jobloss_covid19_v2 best32. ;
	informat fi_ssi_ssdi_v2 best32. ;
	informat fi_snap_v2 best32. ;
	informat work_wash_v2 best32. ;
	informat work_closecont_v2 best32. ;
	informat work_ppe_v2 best32. ;
	informat work_ppe_others_v2 best32. ;
	informat work_ppe_yourself_v2 best32. ;
	informat work_ppe_access_v2 best32. ;
	informat work_transport_v2___1 best32. ;
	informat work_transport_v2___2 best32. ;
	informat work_transport_v2___3 best32. ;
	informat work_transport_v2___4 best32. ;
	informat work_transport_v2___5 best32. ;
	informat work_transport_v2___6 best32. ;
	informat work_transport_v2___7 best32. ;
	informat work_transport_v2___8 best32. ;
	informat work_transport_v2___90 best32. ;
	informat work_transport_other_v2 $500. ;
	informat jobloss_covid19_span best32. ;
	informat current_employment_status_span best32. ;
	informat cur_employ_stat_specify_7a104f $500. ;
	informat employed_ew_cb1e17 best32. ;
	informat family_income_cde0a2 best32. ;
	informat percept_ris best32. ;
	informat work_wash_6e6917 best32. ;
	informat work_closecont_9e4b91 best32. ;
	informat work_ppe_other best32. ;
	informat work_ppe_yoursel best32. ;
	informat work_ppe_715948 best32. ;
	informat work_ppe_acces best32. ;
	informat cc_imm_cd41ef best32. ;
	informat cc_autoimm_c2d93b best32. ;
	informat cc_hypertension_8d5e43 best32. ;
	informat cc_diabetes_8c79a2 best32. ;
	informat cc_chronickd_feb3ef best32. ;
	informat cc_cancer_be993e best32. ;
	informat cc_cvd_3a8430 best32. ;
	informat cc_asthma_de5a1c best32. ;
	informat cc_copd_7146ce best32. ;
	informat cc_clung_00819f best32. ;
	informat cc_depression_e3ace0 best32. ;
	informat cc_asud_b0d0cc best32. ;
	informat cc_sickle_7ca04b best32. ;
	informat cc_intrav_72203d best32. ;
	informat cc_othermh_34a736 best32. ;
	informat cc_otherchroniccond_8f65d1 best32. ;
	informat s_self_reported_heal_v_2 best32. ;
	informat s_self_reported_disability best32. ;
	informat covid_percept_protect_v best32. ;
	informat covid_percept_fam_v best32. ;
	informat covid_percept_risk_v best32. ;
	informat covid_percept_harm_v best32. ;
	informat covid_percept_indep_v best32. ;
	informat covid_trust_info_v best32. ;
	informat covid_trust_info_other_v $500. ;
	informat covid_info_source_v___1 best32. ;
	informat covid_info_source_v___2 best32. ;
	informat covid_info_source_v___3 best32. ;
	informat covid_info_source_v___4 best32. ;
	informat covid_info_source_v___5 best32. ;
	informat covid_info_source_v___6 best32. ;
	informat covid_info_source_v___7 best32. ;
	informat covid_info_source_v___8 best32. ;
	informat covid_info_source_v___9 best32. ;
	informat covid_info_source_v___10 best32. ;
	informat covid_info_source_v___11 best32. ;
	informat covid_info_source_v___90 best32. ;
	informat covid_info_source_other_v $500. ;
	informat vaccine_reasons_9a0558___1 best32. ;
	informat vaccine_reasons_9a0558___2 best32. ;
	informat vaccine_reasons_9a0558___3 best32. ;
	informat vaccine_reasons_9a0558___4 best32. ;
	informat vaccine_reasons_9a0558___5 best32. ;
	informat vaccine_reasons_9a0558___6 best32. ;
	informat vaccine_reasons_9a0558___7 best32. ;
	informat vaccine_reasons_9a0558___8 best32. ;
	informat vaccine_reasons_9a0558___9 best32. ;
	informat vaccine_concerns_10a54e___1 best32. ;
	informat vaccine_concerns_10a54e___2 best32. ;
	informat vaccine_concerns_10a54e___3 best32. ;
	informat vaccine_concerns_10a54e___4 best32. ;
	informat vaccine_concerns_10a54e___5 best32. ;
	informat vaccine_concerns_10a54e___6 best32. ;
	informat vaccine_concerns_10a54e___7 best32. ;
	informat vaccine_concerns_10a54e___8 best32. ;
	informat vaccine_concerns_10a54e___9 best32. ;
	informat vaccine_concerns_10a54e___10 best32. ;
	informat fi_discrimatio___1 best32. ;
	informat fi_discrimatio___2 best32. ;
	informat fi_discrimatio___3 best32. ;
	informat fi_discrimatio___4 best32. ;
	informat fi_discrimatio___5 best32. ;
	informat fi_discrimatio___6 best32. ;
	informat fi_discrimatio___7 best32. ;
	informat fi_discrimatio___8 best32. ;
	informat fi_discrimatio___9 best32. ;
	informat fi_discrimatio___10 best32. ;
	informat work_transpor___1 best32. ;
	informat work_transpor___2 best32. ;
	informat work_transpor___3 best32. ;
	informat work_transpor___4 best32. ;
	informat work_transpor___5 best32. ;
	informat work_transpor___6 best32. ;
	informat work_transpor___7 best32. ;
	informat work_transpor___8 best32. ;
	informat work_transpor___90 best32. ;
	informat transporte_otro $500. ;
	informat fi_ssi_ssd best32. ;
	informat fi_sna best32. ;
	informat decision best32. ;
	informat decision_v2 best32. ;
	informat igm_value $500. ;
	informat igg_value $500. ;
	informat igm_value_2 $500. ;
	informat igg_value_2 $500. ;
	informat igm_value_2_v2 $500. ;
	informat igg_value_v2 $500. ;
	informat igg_value_2_v2 $500. ;
	informat igm_value_v2 $500. ;

	format study_id $500. ;
	format redcap_event_name $500. ;
	format head_of_household best12. ;
	format factor_one best12. ;
	format factor_two best12. ;
	format decision_date yymmdd10. ;
	format age best12. ;
	format race_ethn_race_2___1 best12. ;
	format race_ethn_race_2___2 best12. ;
	format race_ethn_race_2___3 best12. ;
	format race_ethn_race_2___4 best12. ;
	format race_ethn_race_2___5 best12. ;
	format race_ethn_race_2___15 best12. ;
	format race_ethn_race_2___99 best12. ;
	format race_ethn_hispanic_2 best12. ;
	format birth_sex best12. ;
	format education_level best12. ;
	format specimen_collected best12. ;
	format collection_date $500. ;
	format codefarnear $500. ;
	format general_results best12. ;
	format igg_result best12. ;
	format igm_result best12. ;
	format igg_result_2 best12. ;
	format igm_result_2 best12. ;
	format collection_date_v2 $500. ;
	format igm_result_v2 best12. ;
	format igg_result_v2 best12. ;
	format lot_date_2 yymmdd10. ;
	format withdrawn___yes best12. ;
	format specimen_collected_v2 best12. ;
	format specimen_collected_2_v2 best12. ;
	format igm_result_2_v2 best12. ;
	format igg_result_2_v2 best12. ;
	format specimen_collected_2 best12. ;
	format notes_bio_collection_2 $5000. ;
	format specimen_collection_complete best12. ;
	format results_received best12. ;
	format results_recieved_not_exp___1 best12. ;
	format notes_for_results_received $5000. ;
	format notes_for_results_received_v2 $5000. ;
	format results_received_v2 best12. ;
	format results_received_not_exp_2___1 best12. ;
	format general_results_v2 best12. ;
	format notes_bio_collection_2_v2 $5000. ;
	format specimen_collection__v_0 best12. ;
	format current_employment_status_v2 best12. ;
	format covid_percept_protect_v2 best12. ;
	format covid_percept_fam_v2 best12. ;
	format percept_risk_v2 best12. ;
	format covid_percept_risk_v2 best12. ;
	format covid_percept_indep_v2 best12. ;
	format family_income_v2 best12. ;
	format employed_ew_v2 best12. ;
	format tested_for_covid_v2 best12. ;
	format positivemonth_covidtest_v2 best12. ;
	format positiveyear_covidtest_v2 best12. ;
	format tested_positive_for_covid_v2 best12. ;
	format covid_info_source_v2___1 best12. ;
	format covid_info_source_v2___2 best12. ;
	format covid_info_source_v2___3 best12. ;
	format covid_info_source_v2___4 best12. ;
	format covid_info_source_v2___5 best12. ;
	format covid_info_source_v2___6 best12. ;
	format covid_info_source_v2___7 best12. ;
	format covid_info_source_v2___8 best12. ;
	format covid_info_source_v2___9 best12. ;
	format covid_info_source_v2___10 best12. ;
	format covid_info_source_v2___11 best12. ;
	format covid_info_source_v2___90 best12. ;
	format covid_info_source_other_v2 $500. ;
	format covid_trust_info_v2 best12. ;
	format covid_trust_info_other_v2 $500. ;
	format vaccine_reasons_v2___1 best12. ;
	format vaccine_reasons_v2___2 best12. ;
	format vaccine_reasons_v2___3 best12. ;
	format vaccine_reasons_v2___4 best12. ;
	format vaccine_reasons_v2___5 best12. ;
	format vaccine_reasons_v2___6 best12. ;
	format vaccine_reasons_v2___7 best12. ;
	format vaccine_reasons_v2___8 best12. ;
	format vaccine_reasons_v2___9 best12. ;
	format vaccine_concerns_v2___1 best12. ;
	format vaccine_concerns_v2___2 best12. ;
	format vaccine_concerns_v2___3 best12. ;
	format vaccine_concerns_v2___4 best12. ;
	format vaccine_concerns_v2___5 best12. ;
	format vaccine_concerns_v2___6 best12. ;
	format vaccine_concerns_v2___7 best12. ;
	format vaccine_concerns_v2___8 best12. ;
	format vaccine_concerns_v2___9 best12. ;
	format vaccine_concerns_v2___10 best12. ;
	format cc_imm_v2 best12. ;
	format cc_autoimm_v2 best12. ;
	format cc_hypertension_v2 best12. ;
	format cc_chronickd_v2 best12. ;
	format cc_diabetes_v2 best12. ;
	format cc_cancer_v2 best12. ;
	format cc_cvd_v2 best12. ;
	format cc_asthma_v2 best12. ;
	format cc_copd_v2 best12. ;
	format cc_clung_v2 best12. ;
	format cc_sickle_v2 best12. ;
	format cc_depression_v2 best12. ;
	format cc_asud_v2 best12. ;
	format cc_intrav_v2 best12. ;
	format cc_othermh_v2 best12. ;
	format cc_otherchroniccond_v2 best12. ;
	format self_reported_health_v_1 best12. ;
	format self_reported_disability_v2 best12. ;
	format fi_discrimation_v2___1 best12. ;
	format fi_discrimation_v2___2 best12. ;
	format fi_discrimation_v2___3 best12. ;
	format fi_discrimation_v2___4 best12. ;
	format fi_discrimation_v2___5 best12. ;
	format fi_discrimation_v2___6 best12. ;
	format fi_discrimation_v2___7 best12. ;
	format fi_discrimation_v2___8 best12. ;
	format fi_discrimation_v2___9 best12. ;
	format fi_discrimation_v2___10 best12. ;
	format cur_employ_stat_specify_v2 $500. ;
	format jobloss_covid19_v2 best12. ;
	format fi_ssi_ssdi_v2 best12. ;
	format fi_snap_v2 best12. ;
	format work_wash_v2 best12. ;
	format work_closecont_v2 best12. ;
	format work_ppe_v2 best12. ;
	format work_ppe_others_v2 best12. ;
	format work_ppe_yourself_v2 best12. ;
	format work_ppe_access_v2 best12. ;
	format work_transport_v2___1 best12. ;
	format work_transport_v2___2 best12. ;
	format work_transport_v2___3 best12. ;
	format work_transport_v2___4 best12. ;
	format work_transport_v2___5 best12. ;
	format work_transport_v2___6 best12. ;
	format work_transport_v2___7 best12. ;
	format work_transport_v2___8 best12. ;
	format work_transport_v2___90 best12. ;
	format work_transport_other_v2 $500. ;
	format jobloss_covid19_span best12. ;
	format current_employment_status_span best12. ;
	format cur_employ_stat_specify_7a104f $500. ;
	format employed_ew_cb1e17 best12. ;
	format family_income_cde0a2 best12. ;
	format percept_ris best12. ;
	format work_wash_6e6917 best12. ;
	format work_closecont_9e4b91 best12. ;
	format work_ppe_other best12. ;
	format work_ppe_yoursel best12. ;
	format work_ppe_715948 best12. ;
	format work_ppe_acces best12. ;
	format cc_imm_cd41ef best12. ;
	format cc_autoimm_c2d93b best12. ;
	format cc_hypertension_8d5e43 best12. ;
	format cc_diabetes_8c79a2 best12. ;
	format cc_chronickd_feb3ef best12. ;
	format cc_cancer_be993e best12. ;
	format cc_cvd_3a8430 best12. ;
	format cc_asthma_de5a1c best12. ;
	format cc_copd_7146ce best12. ;
	format cc_clung_00819f best12. ;
	format cc_depression_e3ace0 best12. ;
	format cc_asud_b0d0cc best12. ;
	format cc_sickle_7ca04b best12. ;
	format cc_intrav_72203d best12. ;
	format cc_othermh_34a736 best12. ;
	format cc_otherchroniccond_8f65d1 best12. ;
	format s_self_reported_heal_v_2 best12. ;
	format s_self_reported_disability best12. ;
	format covid_percept_protect_v best12. ;
	format covid_percept_fam_v best12. ;
	format covid_percept_risk_v best12. ;
	format covid_percept_harm_v best12. ;
	format covid_percept_indep_v best12. ;
	format covid_trust_info_v best12. ;
	format covid_trust_info_other_v $500. ;
	format covid_info_source_v___1 best12. ;
	format covid_info_source_v___2 best12. ;
	format covid_info_source_v___3 best12. ;
	format covid_info_source_v___4 best12. ;
	format covid_info_source_v___5 best12. ;
	format covid_info_source_v___6 best12. ;
	format covid_info_source_v___7 best12. ;
	format covid_info_source_v___8 best12. ;
	format covid_info_source_v___9 best12. ;
	format covid_info_source_v___10 best12. ;
	format covid_info_source_v___11 best12. ;
	format covid_info_source_v___90 best12. ;
	format covid_info_source_other_v $500. ;
	format vaccine_reasons_9a0558___1 best12. ;
	format vaccine_reasons_9a0558___2 best12. ;
	format vaccine_reasons_9a0558___3 best12. ;
	format vaccine_reasons_9a0558___4 best12. ;
	format vaccine_reasons_9a0558___5 best12. ;
	format vaccine_reasons_9a0558___6 best12. ;
	format vaccine_reasons_9a0558___7 best12. ;
	format vaccine_reasons_9a0558___8 best12. ;
	format vaccine_reasons_9a0558___9 best12. ;
	format vaccine_concerns_10a54e___1 best12. ;
	format vaccine_concerns_10a54e___2 best12. ;
	format vaccine_concerns_10a54e___3 best12. ;
	format vaccine_concerns_10a54e___4 best12. ;
	format vaccine_concerns_10a54e___5 best12. ;
	format vaccine_concerns_10a54e___6 best12. ;
	format vaccine_concerns_10a54e___7 best12. ;
	format vaccine_concerns_10a54e___8 best12. ;
	format vaccine_concerns_10a54e___9 best12. ;
	format vaccine_concerns_10a54e___10 best12. ;
	format fi_discrimatio___1 best12. ;
	format fi_discrimatio___2 best12. ;
	format fi_discrimatio___3 best12. ;
	format fi_discrimatio___4 best12. ;
	format fi_discrimatio___5 best12. ;
	format fi_discrimatio___6 best12. ;
	format fi_discrimatio___7 best12. ;
	format fi_discrimatio___8 best12. ;
	format fi_discrimatio___9 best12. ;
	format fi_discrimatio___10 best12. ;
	format work_transpor___1 best12. ;
	format work_transpor___2 best12. ;
	format work_transpor___3 best12. ;
	format work_transpor___4 best12. ;
	format work_transpor___5 best12. ;
	format work_transpor___6 best12. ;
	format work_transpor___7 best12. ;
	format work_transpor___8 best12. ;
	format work_transpor___90 best12. ;
	format transporte_otro $500. ;
	format fi_ssi_ssd best12. ;
	format fi_sna best12. ;
	format decision best12. ;
	format decision_v2 best12. ;
	format igm_value $500. ;
	format igg_value $500. ;
	format igm_value_2 $500. ;
	format igg_value_2 $500. ;
	format igm_value_2_v2 $500. ;
	format igg_value_v2 $500. ;
	format igg_value_2_v2 $500. ;
	format igm_value_v2 $500. ;

input
	study_id $
	redcap_event_name $
	head_of_household
	factor_one
	factor_two
	decision_date
	age
	race_ethn_race_2___1
	race_ethn_race_2___2
	race_ethn_race_2___3
	race_ethn_race_2___4
	race_ethn_race_2___5
	race_ethn_race_2___15
	race_ethn_race_2___99
	race_ethn_hispanic_2
	birth_sex
	education_level
	specimen_collected
	collection_date $
	codefarnear $
	general_results
	igg_result
	igm_result
	igg_result_2
	igm_result_2
	collection_date_v2 $
	igm_result_v2
	igg_result_v2
	lot_date_2
	withdrawn___yes
	specimen_collected_v2
	specimen_collected_2_v2
	igm_result_2_v2
	igg_result_2_v2
	specimen_collected_2
	notes_bio_collection_2 $
	specimen_collection_complete
	results_received
	results_recieved_not_exp___1
	notes_for_results_received $
	notes_for_results_received_v2 $
	results_received_v2
	results_received_not_exp_2___1
	general_results_v2
	notes_bio_collection_2_v2 $
	specimen_collection__v_0
	current_employment_status_v2
	covid_percept_protect_v2
	covid_percept_fam_v2
	percept_risk_v2
	covid_percept_risk_v2
	covid_percept_indep_v2
	family_income_v2
	employed_ew_v2
	tested_for_covid_v2
	positivemonth_covidtest_v2
	positiveyear_covidtest_v2
	tested_positive_for_covid_v2
	covid_info_source_v2___1
	covid_info_source_v2___2
	covid_info_source_v2___3
	covid_info_source_v2___4
	covid_info_source_v2___5
	covid_info_source_v2___6
	covid_info_source_v2___7
	covid_info_source_v2___8
	covid_info_source_v2___9
	covid_info_source_v2___10
	covid_info_source_v2___11
	covid_info_source_v2___90
	covid_info_source_other_v2 $
	covid_trust_info_v2
	covid_trust_info_other_v2 $
	vaccine_reasons_v2___1
	vaccine_reasons_v2___2
	vaccine_reasons_v2___3
	vaccine_reasons_v2___4
	vaccine_reasons_v2___5
	vaccine_reasons_v2___6
	vaccine_reasons_v2___7
	vaccine_reasons_v2___8
	vaccine_reasons_v2___9
	vaccine_concerns_v2___1
	vaccine_concerns_v2___2
	vaccine_concerns_v2___3
	vaccine_concerns_v2___4
	vaccine_concerns_v2___5
	vaccine_concerns_v2___6
	vaccine_concerns_v2___7
	vaccine_concerns_v2___8
	vaccine_concerns_v2___9
	vaccine_concerns_v2___10
	cc_imm_v2
	cc_autoimm_v2
	cc_hypertension_v2
	cc_chronickd_v2
	cc_diabetes_v2
	cc_cancer_v2
	cc_cvd_v2
	cc_asthma_v2
	cc_copd_v2
	cc_clung_v2
	cc_sickle_v2
	cc_depression_v2
	cc_asud_v2
	cc_intrav_v2
	cc_othermh_v2
	cc_otherchroniccond_v2
	self_reported_health_v_1
	self_reported_disability_v2
	fi_discrimation_v2___1
	fi_discrimation_v2___2
	fi_discrimation_v2___3
	fi_discrimation_v2___4
	fi_discrimation_v2___5
	fi_discrimation_v2___6
	fi_discrimation_v2___7
	fi_discrimation_v2___8
	fi_discrimation_v2___9
	fi_discrimation_v2___10
	cur_employ_stat_specify_v2 $
	jobloss_covid19_v2
	fi_ssi_ssdi_v2
	fi_snap_v2
	work_wash_v2
	work_closecont_v2
	work_ppe_v2
	work_ppe_others_v2
	work_ppe_yourself_v2
	work_ppe_access_v2
	work_transport_v2___1
	work_transport_v2___2
	work_transport_v2___3
	work_transport_v2___4
	work_transport_v2___5
	work_transport_v2___6
	work_transport_v2___7
	work_transport_v2___8
	work_transport_v2___90
	work_transport_other_v2 $
	jobloss_covid19_span
	current_employment_status_span
	cur_employ_stat_specify_7a104f $
	employed_ew_cb1e17
	family_income_cde0a2
	percept_ris
	work_wash_6e6917
	work_closecont_9e4b91
	work_ppe_other
	work_ppe_yoursel
	work_ppe_715948
	work_ppe_acces
	cc_imm_cd41ef
	cc_autoimm_c2d93b
	cc_hypertension_8d5e43
	cc_diabetes_8c79a2
	cc_chronickd_feb3ef
	cc_cancer_be993e
	cc_cvd_3a8430
	cc_asthma_de5a1c
	cc_copd_7146ce
	cc_clung_00819f
	cc_depression_e3ace0
	cc_asud_b0d0cc
	cc_sickle_7ca04b
	cc_intrav_72203d
	cc_othermh_34a736
	cc_otherchroniccond_8f65d1
	s_self_reported_heal_v_2
	s_self_reported_disability
	covid_percept_protect_v
	covid_percept_fam_v
	covid_percept_risk_v
	covid_percept_harm_v
	covid_percept_indep_v
	covid_trust_info_v
	covid_trust_info_other_v $
	covid_info_source_v___1
	covid_info_source_v___2
	covid_info_source_v___3
	covid_info_source_v___4
	covid_info_source_v___5
	covid_info_source_v___6
	covid_info_source_v___7
	covid_info_source_v___8
	covid_info_source_v___9
	covid_info_source_v___10
	covid_info_source_v___11
	covid_info_source_v___90
	covid_info_source_other_v $
	vaccine_reasons_9a0558___1
	vaccine_reasons_9a0558___2
	vaccine_reasons_9a0558___3
	vaccine_reasons_9a0558___4
	vaccine_reasons_9a0558___5
	vaccine_reasons_9a0558___6
	vaccine_reasons_9a0558___7
	vaccine_reasons_9a0558___8
	vaccine_reasons_9a0558___9
	vaccine_concerns_10a54e___1
	vaccine_concerns_10a54e___2
	vaccine_concerns_10a54e___3
	vaccine_concerns_10a54e___4
	vaccine_concerns_10a54e___5
	vaccine_concerns_10a54e___6
	vaccine_concerns_10a54e___7
	vaccine_concerns_10a54e___8
	vaccine_concerns_10a54e___9
	vaccine_concerns_10a54e___10
	fi_discrimatio___1
	fi_discrimatio___2
	fi_discrimatio___3
	fi_discrimatio___4
	fi_discrimatio___5
	fi_discrimatio___6
	fi_discrimatio___7
	fi_discrimatio___8
	fi_discrimatio___9
	fi_discrimatio___10
	work_transpor___1
	work_transpor___2
	work_transpor___3
	work_transpor___4
	work_transpor___5
	work_transpor___6
	work_transpor___7
	work_transpor___8
	work_transpor___90
	transporte_otro $
	fi_ssi_ssd
	fi_sna
	decision
	decision_v2
	igm_value $
	igg_value $
	igm_value_2 $
	igg_value_2 $
	igm_value_2_v2 $
	igg_value_v2 $
	igg_value_2_v2 $
	igm_value_v2 $
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

data savepath.NIH_15Apr24;
	set redcap;
	label study_id='Study ID';
	label redcap_event_name='Event Name';
	label head_of_household='Head of Household';
	label factor_one='Factor 1';
	label factor_two='Factor 2';
	label decision_date='Decision date';
	label age='Age ';
	label race_ethn_race_2___1='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=American Indian or Alaska Native / Indio americano o nativo de Alaska)';
	label race_ethn_race_2___2='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=Black or African American / Negro o afroamericano(a))';
	label race_ethn_race_2___3='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=Asian / Asiático)';
	label race_ethn_race_2___4='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=Native Hawaiian or  Other Pacific Islander / Nativo hawaiano(a) u de otra isla del Pacífico)';
	label race_ethn_race_2___5='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=White / Blaco)';
	label race_ethn_race_2___15='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=Some other race / Alguna otra raza)';
	label race_ethn_race_2___99='What is your race? ¿Cuál es su raza?   Mark one or more boxes AND print origins. (choice=Prefer not to answer / Prefiero no responder)';
	label race_ethn_hispanic_2='Are you of Hispanic, Latino, or Spanish origin?  ¿Es de origen hispano, latino o español?  ';
	label birth_sex='What was your sex assigned at birth?  ¿Cuál fue su sexo asignado al nacer?';
	label education_level='What is the highest level of education you have achieved outside or in the United States?  Grades roughly equivalent to years of school.  ¿Cuál es el nivel más alto de educación que ha logrado fuera o en los Estados Unidos? Grados aproximadamente equivalentes a años de escuela. ';
	label specimen_collected='Initial specimen collected?';
	label collection_date='Initial Specimen Collected Date and Time';
	label codefarnear='Code for Far/Near';
	label general_results='Results:';
	label igg_result='IgG Result';
	label igm_result='IgM Result';
	label igg_result_2='IgG Result';
	label igm_result_2='IgM Result';
	label collection_date_v2='Follow-up Specimen Collection Date and Time';
	label igm_result_v2='IgM Result';
	label igg_result_v2='IgG Result';
	label lot_date_2='Lottery date:';
	label withdrawn___yes='Participant decided to withdraw? (choice=Yes)';
	label specimen_collected_v2='Follow- up specimen collected?';
	label specimen_collected_2_v2='Repeat specimen testing ?';
	label igm_result_2_v2='IgM Result';
	label igg_result_2_v2='IgG Result';
	label specimen_collected_2='Repeat specimen testing ?';
	label notes_bio_collection_2='Notes about biospecimen collection';
	label specimen_collection_complete='Complete?';
	label results_received='Results received? ';
	label results_recieved_not_exp___1='Is the specimen result not expected (i.e. no results from the lab)? (choice=Yes)';
	label notes_for_results_received='Notes';
	label notes_for_results_received_v2='Notes';
	label results_received_v2='Results received? ';
	label results_received_not_exp_2___1='Is the specimen result not expected (i.e. no results from the lab)? (choice=Yes)';
	label general_results_v2='Results:';
	label notes_bio_collection_2_v2='Notes about biospecimen collection';
	label specimen_collection__v_0='Complete?';
	label current_employment_status_v2='We would like to know about what you do -- are you working now, looking for work, retired, keeping house, a student, or something else?';
	label covid_percept_protect_v2='I believe that the COVID-19 vaccine could protect me against COVID-19.';
	label covid_percept_fam_v2='If I get the COVID-19 vaccine, I believe that will help to protect my family and friends.';
	label percept_risk_v2='How do you see yourself: Are you generally a person who is fully prepared to take risks or do you try to avoid taking risks? on a scale from 0 to 10 (where 0 is unwilling to take risks to 10, fully prepared to take risks).';
	label covid_percept_risk_v2='I believe that the COVID-19 vaccine could reduce my risk of getting COVID-19.';
	label covid_percept_indep_v2='I am confident that I will be able to independently get the COVID-19 vaccine.';
	label family_income_v2='In 2020, what was your total household income before taxes?';
	label employed_ew_v2='Are you considered an essential worker? An essential worker is someone who was required to go to work even when stay at home orders were in place ';
	label tested_for_covid_v2='Have you ever been tested for COVID-19?  ¿Alguna vez se le ha realizado una prueba para detectar la COVID19?';
	label positivemonth_covidtest_v2='What month did you first test positive for COVID-19?   ¿En qué mes dio positivo por primera vez en la prueba para la COVID-19?';
	label positiveyear_covidtest_v2='What year did you first test positive for COVID-19?  ¿En qué año se realizó su prueba más reciente para la COVID-19?';
	label tested_positive_for_covid_v2='Have you ever tested positive for COVID-19?  ¿Alguna vez ha dado positivo en la prueba para la COVID-19?';
	label covid_info_source_v2___1='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Spouse/partner)';
	label covid_info_source_v2___2='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Other family members)';
	label covid_info_source_v2___3='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Friends or coworkers)';
	label covid_info_source_v2___4='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Religious leader)';
	label covid_info_source_v2___5='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Doctor/medical provider)';
	label covid_info_source_v2___6='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Television)';
	label covid_info_source_v2___7='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Radio or podcosts)';
	label covid_info_source_v2___8='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Newspaper (printed or online))';
	label covid_info_source_v2___9='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Government or other official websites)';
	label covid_info_source_v2___10='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Social media)';
	label covid_info_source_v2___11='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Google search, Wikipedia, or other nongovernmental websites)';
	label covid_info_source_v2___90='Do you use any of the following sources to find information about COVID-19 (select all that apply)?: (choice=Other)';
	label covid_info_source_other_v2='Please specify the other sources';
	label covid_trust_info_v2='Which information source do you trust the most? (select one)';
	label covid_trust_info_other_v2='Please specify your most trusted information source';
	label vaccine_reasons_v2___1='Why would you get a COVID-19 vaccine? (choice=I want to keep my family safe)';
	label vaccine_reasons_v2___2='Why would you get a COVID-19 vaccine? (choice=I want to keep my community safe)';
	label vaccine_reasons_v2___3='Why would you get a COVID-19 vaccine? (choice=I want to keep myself safe)';
	label vaccine_reasons_v2___4='Why would you get a COVID-19 vaccine? (choice=I have a chronic health problem, like asthma or diabetes)';
	label vaccine_reasons_v2___5='Why would you get a COVID-19 vaccine? (choice=My doctor told me to get a COVID-19 vaccine)';
	label vaccine_reasons_v2___6='Why would you get a COVID-19 vaccine? (choice=I dont want to get really sick from COVID-19)';
	label vaccine_reasons_v2___7='Why would you get a COVID-19 vaccine? (choice=I want to feel safe around other people)';
	label vaccine_reasons_v2___8='Why would you get a COVID-19 vaccine? (choice=I believe life wont go back to normal until most people get a COVID-19 vaccine)';
	label vaccine_reasons_v2___9='Why would you get a COVID-19 vaccine? (choice=Other)';
	label vaccine_concerns_v2___1='Why would you NOT get a COVID-19 vaccine?  (choice=Im allergic to vaccines)';
	label vaccine_concerns_v2___2='Why would you NOT get a COVID-19 vaccine?  (choice=I dont like needles)';
	label vaccine_concerns_v2___3='Why would you NOT get a COVID-19 vaccine?  (choice=Im not concerned about getting really sick from COVID-19)';
	label vaccine_concerns_v2___4='Why would you NOT get a COVID-19 vaccine?  (choice=Im concerned about side effects from the vaccine)';
	label vaccine_concerns_v2___5='Why would you NOT get a COVID-19 vaccine?  (choice=I dont think vaccines work very well)';
	label vaccine_concerns_v2___6='Why would you NOT get a COVID-19 vaccine?  (choice=I dont trust that the vaccine will be safe)';
	label vaccine_concerns_v2___7='Why would you NOT get a COVID-19 vaccine?  (choice=I dont believe the COVID-19 pandemic is as bad as some people say it is)';
	label vaccine_concerns_v2___8='Why would you NOT get a COVID-19 vaccine?  (choice=I dont want to pay for it)';
	label vaccine_concerns_v2___9='Why would you NOT get a COVID-19 vaccine?  (choice=I dont know enough about how well a COVID-19 vaccine works)';
	label vaccine_concerns_v2___10='Why would you NOT get a COVID-19 vaccine?  (choice=Other)';
	label cc_imm_v2='Immunocompromised condition';
	label cc_autoimm_v2='Autoimmune disease';
	label cc_hypertension_v2='Hypertension (HTN, high blood pressure)';
	label cc_chronickd_v2='Chronic kidney disease (CKD)';
	label cc_diabetes_v2='Diabetes';
	label cc_cancer_v2='Cancer diagnosis and/or treatment within the past 12 months';
	label cc_cvd_v2='Cardiovascular disease (CVD or heart disease)';
	label cc_asthma_v2='Asthma ';
	label cc_copd_v2='Chronic obstructive pulmonary disease (COPD)';
	label cc_clung_v2='Other chronic lung disease';
	label cc_sickle_v2='Sickle Cell Anemia';
	label cc_depression_v2='Depression';
	label cc_asud_v2='Alcohol or substance use disorder';
	label cc_intrav_v2='Intravenous drug use';
	label cc_othermh_v2='Other mental health disorder';
	label cc_otherchroniccond_v2='Other chronic condition';
	label self_reported_health_v_1='Would you say your health in general is excellent, very good, good, fair, or poor?';
	label self_reported_disability_v2='Do you have a disability that interferes with your ability to carry out daily activities? Examples of daily activities include walking, climbing stairs, shopping, balancing a checkbook,  bathing or dressing.';
	label fi_discrimation_v2___1='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=At school?)';
	label fi_discrimation_v2___2='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=Getting hired or getting a job?)';
	label fi_discrimation_v2___3='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=At work?)';
	label fi_discrimation_v2___4='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=Getting housing?)';
	label fi_discrimation_v2___5='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=Getting medical care?)';
	label fi_discrimation_v2___6='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=Getting service in a store or restaurant?)';
	label fi_discrimation_v2___7='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=Getting credit, bank loans, or a mortgage?)';
	label fi_discrimation_v2___8='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=On the street or in a public setting?)';
	label fi_discrimation_v2___9='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=From the police or in the courts?)';
	label fi_discrimation_v2___10='Have you ever experienced discrimination, been prevented from doing something, or been hassled or made to feel inferior in any of the following situations because of your race, ethnicity, or color? Select all that apply. (choice=None of the above (exclusive))';
	label cur_employ_stat_specify_v2='Current employment status, Other - specify';
	label jobloss_covid19_v2='Have you, or has anyone in your household, experienced a loss of employment income since the start of the COVID-19 pandemic (March 2020)?';
	label fi_ssi_ssdi_v2='Are you or someone in your household currently receiving SSI (Supplemental Security Income) or SSDI (Social Security Disability Insurance)?';
	label fi_snap_v2='Are you or someone in your household currently receiving SNAP benefits (sometimes called food stamps)?';
	label work_wash_v2='In your workplace, do you have access to necessary facilities to wash?';
	label work_closecont_v2='Does your work require you to be in close contact (i.e. within 6 ft) with others?';
	label work_ppe_v2='In your workplace, do you have access to necessary personal protective equipment (PPE)? ';
	label work_ppe_others_v2='How often are the customers and your co-workers wearing face masks or cloth face coverings?';
	label work_ppe_yourself_v2='How often do you use personal protective equipment (PPE; for example, masks, gloves, eye protection) while at work?';
	label work_ppe_access_v2='How often does your work provide you with personal protective equipment (PPE; for example, masks, gloves, eye protection)?';
	label work_transport_v2___1='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Personal Vehicle)';
	label work_transport_v2___2='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Shared carpool)';
	label work_transport_v2___3='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Bus)';
	label work_transport_v2___4='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Subway or short-distance train)';
	label work_transport_v2___5='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Long-distance train or commuter rail)';
	label work_transport_v2___6='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Bicycle)';
	label work_transport_v2___7='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Walked)';
	label work_transport_v2___8='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Ride-share (Uber, Lyft, etc.) or taxicab)';
	label work_transport_v2___90='In the past three weeks, what transportation did you use for work and/or essential errands (e.g., going to the grocery store or pharmacy, in-person medical visits, going to the bank, etc.)? Select all that apply. (choice=Other)';
	label work_transport_other_v2='Please specify your other transportation.';
	label jobloss_covid19_span='¿Usted o alguien en su hogar ha experimentado una pérdida de ingresos laborales desde el inicio de la pandemia de COVID-19 (Marzo de 2020)?';
	label current_employment_status_span='Nos gustaría saber qué hace: ¿está trabajando actualmente o buscando trabajo, es jubilado, realiza trabajo doméstico, es estudiante u otro?';
	label cur_employ_stat_specify_7a104f='Situación laboral actual, otra: especifique';
	label employed_ew_cb1e17='¿Se considera usted un trabajador esencial? Un trabajador esencial es alguien que estaba obligado a ir a trabajar incluso cuando hay órdenes de quedarse en su hogar ';
	label family_income_cde0a2='En 2020, ¿cuáles fueron sus ingresos domésticos totales sin los impuestos?';
	label percept_ris='En una escale de 0 a 10 ¿Es usted generalmente una persona que está completamente preparada para correr riesgos o intenta evitar correr riesgos? (0 significando que no está dispuesto a correr riesgos a 10, totalmente preparado para asumir riesgos)';
	label work_wash_6e6917='En su lugar de trabajo, ¿tiene acceso a las instalaciones necesarias para lavarse?';
	label work_closecont_9e4b91='¿Su trabajo requiere que esté en contacto cercano (es decir, menos de 6 metros) de otras personas?';
	label work_ppe_other='¿Con qué frecuencia los clientes y sus compañeros de trabajo usan máscaras faciales o cubiertas faciales de tela?';
	label work_ppe_yoursel='¿Con qué frecuencia usa equipo de protección personal (EPP; por ejemplo, máscaras, guantes, protección para los ojos) en el trabajo?';
	label work_ppe_715948='En su lugar de trabajo, ¿tiene acceso equipos de protección individual (EPI)? ';
	label work_ppe_acces='¿Con qué frecuencia su trabajo le proporciona equipo de protección personal (EPP; por ejemplo, máscaras, guantes, protección para los ojos)?';
	label cc_imm_cd41ef='Afección de inmunodeficiencia';
	label cc_autoimm_c2d93b='Enfermedad autoinmune';
	label cc_hypertension_8d5e43='Hipertensión (HTA, presión arterial alta)';
	label cc_diabetes_8c79a2='Diabetes';
	label cc_chronickd_feb3ef='Nefropatía crónica (NPC)';
	label cc_cancer_be993e='Diagnóstico y/o tratamiento del cáncer en los últimos 12 meses';
	label cc_cvd_3a8430='Enfermedad cardiovascular (ECV o cardiopatía)';
	label cc_asthma_de5a1c='Asma ';
	label cc_copd_7146ce='Enfermedad pulmonar obstructiva crónica (EPOC)';
	label cc_clung_00819f='Otra enfermedad pulmonar crónica';
	label cc_depression_e3ace0='Depresión';
	label cc_asud_b0d0cc='Trastornos relacionados con el consumo de alcohol o sustancias';
	label cc_sickle_7ca04b='Anemia de células falciformes';
	label cc_intrav_72203d='Uso de medicamentos intravenosos';
	label cc_othermh_34a736='Otro trastorno de salud mental';
	label cc_otherchroniccond_8f65d1='Otra afección crónica';
	label s_self_reported_heal_v_2='¿Diría que su salud en general es excelente, muy bien, buena, regular o mala?';
	label s_self_reported_disability='¿Tiene una discapacidad que interfiere en su capacidad para realizar las actividades de todos los días? Algunos ejemplos de actividades de todos los días son caminar, subir escaleras, comprar, llevar su contabilidad, bañarse o vestirse.';
	label covid_percept_protect_v='Creo que la vacuna COVID-19 podría protegerme contra COVID-19.';
	label covid_percept_fam_v='Si obtengo la vacuna COVID-19, creo que ayudará a proteger a mi familia y amigos.';
	label covid_percept_risk_v='Creo que la vacuna COVID-19 podría reducir mi riesgo de contraer COVID-19.';
	label covid_percept_harm_v='Me preocupa que cualquier vacuna de COVID-19 pueda causar más daño que el propio COVID-19.';
	label covid_percept_indep_v='Estoy seguro de que podré obtener la vacuna COVID-19 de forma independiente.';
	label covid_trust_info_v='En qué fuente de información confías más? (Seleccione uno)  ';
	label covid_trust_info_other_v='Especifique su fuente de información más confiable';
	label covid_info_source_v___1='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Cónyuge / pareja)';
	label covid_info_source_v___2='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Otros miembros de la familia)';
	label covid_info_source_v___3='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Amigos(a) o compañeros de trabajo)';
	label covid_info_source_v___4='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Líder religioso)';
	label covid_info_source_v___5='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Doctor / proveedor médico)';
	label covid_info_source_v___6='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Televisión)';
	label covid_info_source_v___7='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Radio o podcasts)';
	label covid_info_source_v___8='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Periódico (impreso o en línea))';
	label covid_info_source_v___9='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Gobierno u otros sitios web oficiales)';
	label covid_info_source_v___10='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Redes sociales)';
	label covid_info_source_v___11='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Búsqueda de Google, Wikipedia u otros sitios web no gubernamentales)';
	label covid_info_source_v___90='¿Utiliza alguna de las siguientes fuentes para encontrar información sobre COVID-19 (seleccione todas las que correspondan) ? (choice=Otro)';
	label covid_info_source_other_v='Especifique otras fuentes';
	label vaccine_reasons_9a0558___1='¿Por qué se vacunaría contra COVID-19? (choice=Quiero mantener a mi familia segura)';
	label vaccine_reasons_9a0558___2='¿Por qué se vacunaría contra COVID-19? (choice=Quiero mantener a mi comunidad segura)';
	label vaccine_reasons_9a0558___3='¿Por qué se vacunaría contra COVID-19? (choice=Quiero mantenerme seguro)';
	label vaccine_reasons_9a0558___4='¿Por qué se vacunaría contra COVID-19? (choice=Tengo un problema de salud crónico, como el asma o la diabetes)';
	label vaccine_reasons_9a0558___5='¿Por qué se vacunaría contra COVID-19? (choice=Mi médico me ha dicho que me vacune contra la COVID-19)';
	label vaccine_reasons_9a0558___6='¿Por qué se vacunaría contra COVID-19? (choice=No me quiero enfermar de COVID-19)';
	label vaccine_reasons_9a0558___7='¿Por qué se vacunaría contra COVID-19? (choice=Quiero sentirme seguro al estar rodeado de otras personas)';
	label vaccine_reasons_9a0558___8='¿Por qué se vacunaría contra COVID-19? (choice=Creo que la vida no volverá a la normalidad hasta que la mayoría de las personas se vacunen contra la COVID-19)';
	label vaccine_reasons_9a0558___9='¿Por qué se vacunaría contra COVID-19? (choice=Otro)';
	label vaccine_concerns_10a54e___1='¿Por qué NO se vacunaría contra COVID-19?  (choice=Soy alérgico a las vacunas)';
	label vaccine_concerns_10a54e___2='¿Por qué NO se vacunaría contra COVID-19?  (choice=No me gustan las agujas)';
	label vaccine_concerns_10a54e___3='¿Por qué NO se vacunaría contra COVID-19?  (choice=No me preocupa estar enfermo/a de COVID-19)';
	label vaccine_concerns_10a54e___4='¿Por qué NO se vacunaría contra COVID-19?  (choice=Me preocupan los efectos secundarios de la vacuna)';
	label vaccine_concerns_10a54e___5='¿Por qué NO se vacunaría contra COVID-19?  (choice=No creo que las vacunas funcionen muy bien)';
	label vaccine_concerns_10a54e___6='¿Por qué NO se vacunaría contra COVID-19?  (choice=No creo que la vacuna sea segura)';
	label vaccine_concerns_10a54e___7='¿Por qué NO se vacunaría contra COVID-19?  (choice=No creo que la pandemia de la COVID-19 sea tan grave como dicen)';
	label vaccine_concerns_10a54e___8='¿Por qué NO se vacunaría contra COVID-19?  (choice=No quiero pagarla)';
	label vaccine_concerns_10a54e___9='¿Por qué NO se vacunaría contra COVID-19?  (choice=No sé lo suficiente acerca de la vacuna contra la COVID-19)';
	label vaccine_concerns_10a54e___10='¿Por qué NO se vacunaría contra COVID-19?  (choice=Otro)';
	label fi_discrimatio___1='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿En la escuela?)';
	label fi_discrimatio___2='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿Ser contratado(a) o conseguir un trabajo?)';
	label fi_discrimatio___3='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿En el trabajo?)';
	label fi_discrimatio___4='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿Conseguir vivienda?)';
	label fi_discrimatio___5='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿Está recibiendo atención médica?)';
	label fi_discrimatio___6='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿Recibir servicio en una tienda o restaurante?)';
	label fi_discrimatio___7='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿Obtener crédito, préstamos bancarios o hipoteca?)';
	label fi_discrimatio___8='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿En la calle o en un lugar público?)';
	label fi_discrimatio___9='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=¿De la policía o de los tribunales?)';
	label fi_discrimatio___10='¿Alguna vez ha experimentado discriminación, se le ha impedido hacer algo o ha sido molestado o hecho sentir inferior en alguna de las siguientes situaciones debido a su raza, origen étnico o color? Seleccione todas las que correspondan. (choice=Ninguna de las anteriores)';
	label work_transpor___1='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Vehículo personal)';
	label work_transpor___2='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Carpool compartido)';
	label work_transpor___3='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Bus)';
	label work_transpor___4='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Metro o tren de corta distancia)';
	label work_transpor___5='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Tren de larga distancia o tren de cercanías)';
	label work_transpor___6='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Bicicleta)';
	label work_transpor___7='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Caminó)';
	label work_transpor___8='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Viaje compartido (Uber, Lyft, etc.) o taxi)';
	label work_transpor___90='En las últimas tres semanas, ¿qué transporte usó para el trabajo y / o los mandados esenciales (por ejemplo, ir al supermercado o farmacia, visitas médicas en persona, ir al banco, etc.)? Seleccione todas las que correspondan. (choice=Otro)';
	label transporte_otro='Transporte, otra: especifique';
	label fi_ssi_ssd='¿Recibe actualmente usted o alguien de su hogar SSI (Seguridad de ingreso suplementario) o SSDI (Seguro de discapacidad del Seguro Social)?';
	label fi_sna='¿Está usted o alguien de su hogar recibiendo beneficios  de SNAP (a veces llamados estampillas de comida)?';
	label decision='Agreed to participate?';
	label decision_v2='Agreed to participate?';
	label igm_value='IgM Value';
	label igg_value='IgG Value';
	label igm_value_2='IgM Value';
	label igg_value_2='IgG Value';
	label igm_value_2_v2='IgM Value';
	label igg_value_v2='IgG Value';
	label igg_value_2_v2='IgG Value';
	label igm_value_v2='IgM Value';
	format redcap_event_name redcap_event_name_.;
	format head_of_household head_of_household_.;
	format factor_one factor_one_.;
	format factor_two factor_two_.;
	format race_ethn_race_2___1 race_ethn_race_2___1_.;
	format race_ethn_race_2___2 race_ethn_race_2___2_.;
	format race_ethn_race_2___3 race_ethn_race_2___3_.;
	format race_ethn_race_2___4 race_ethn_race_2___4_.;
	format race_ethn_race_2___5 race_ethn_race_2___5_.;
	format race_ethn_race_2___15 race_ethn_race_2___15_.;
	format race_ethn_race_2___99 race_ethn_race_2___99_.;
	format race_ethn_hispanic_2 race_ethn_hispanic_2_.;
	format birth_sex birth_sex_.;
	format education_level education_level_.;
	format specimen_collected specimen_collected_.;
	format general_results general_results_.;
	format igg_result igg_result_.;
	format igm_result igm_result_.;
	format igg_result_2 igg_result_2_.;
	format igm_result_2 igm_result_2_.;
	format igm_result_v2 igm_result_v2_.;
	format igg_result_v2 igg_result_v2_.;
	format withdrawn___yes withdrawn___yes_.;
	format specimen_collected_v2 specimen_collected_v2_.;
	format specimen_collected_2_v2 specimen_collected_2_v2_.;
	format igm_result_2_v2 igm_result_2_v2_.;
	format igg_result_2_v2 igg_result_2_v2_.;
	format specimen_collected_2 specimen_collected_2_.;
	format specimen_collection_complete specimen_collection_complete_.;
	format results_received results_received_.;
	format results_recieved_not_exp___1 results_recieved_not_exp___1_.;
	format results_received_v2 results_received_v2_.;
	format results_received_not_exp_2___1 results_received_not_exp_2___1_.;
	format general_results_v2 general_results_v2_.;
	format specimen_collection__v_0 specimen_collection__v_0_.;
	format current_employment_status_v2 current_employment_status_v2_.;
	format covid_percept_protect_v2 covid_percept_protect_v2_.;
	format covid_percept_fam_v2 covid_percept_fam_v2_.;
	format percept_risk_v2 percept_risk_v2_.;
	format covid_percept_risk_v2 covid_percept_risk_v2_.;
	format covid_percept_indep_v2 covid_percept_indep_v2_.;
	format family_income_v2 family_income_v2_.;
	format employed_ew_v2 employed_ew_v2_.;
	format tested_for_covid_v2 tested_for_covid_v2_.;
	format positivemonth_covidtest_v2 positivemonth_covidtest_v2_.;
	format positiveyear_covidtest_v2 positiveyear_covidtest_v2_.;
	format tested_positive_for_covid_v2 tested_positive_for_covid_v2_.;
	format covid_info_source_v2___1 covid_info_source_v2___1_.;
	format covid_info_source_v2___2 covid_info_source_v2___2_.;
	format covid_info_source_v2___3 covid_info_source_v2___3_.;
	format covid_info_source_v2___4 covid_info_source_v2___4_.;
	format covid_info_source_v2___5 covid_info_source_v2___5_.;
	format covid_info_source_v2___6 covid_info_source_v2___6_.;
	format covid_info_source_v2___7 covid_info_source_v2___7_.;
	format covid_info_source_v2___8 covid_info_source_v2___8_.;
	format covid_info_source_v2___9 covid_info_source_v2___9_.;
	format covid_info_source_v2___10 covid_info_source_v2___10_.;
	format covid_info_source_v2___11 covid_info_source_v2___11_.;
	format covid_info_source_v2___90 covid_info_source_v2___90_.;
	format covid_trust_info_v2 covid_trust_info_v2_.;
	format vaccine_reasons_v2___1 vaccine_reasons_v2___1_.;
	format vaccine_reasons_v2___2 vaccine_reasons_v2___2_.;
	format vaccine_reasons_v2___3 vaccine_reasons_v2___3_.;
	format vaccine_reasons_v2___4 vaccine_reasons_v2___4_.;
	format vaccine_reasons_v2___5 vaccine_reasons_v2___5_.;
	format vaccine_reasons_v2___6 vaccine_reasons_v2___6_.;
	format vaccine_reasons_v2___7 vaccine_reasons_v2___7_.;
	format vaccine_reasons_v2___8 vaccine_reasons_v2___8_.;
	format vaccine_reasons_v2___9 vaccine_reasons_v2___9_.;
	format vaccine_concerns_v2___1 vaccine_concerns_v2___1_.;
	format vaccine_concerns_v2___2 vaccine_concerns_v2___2_.;
	format vaccine_concerns_v2___3 vaccine_concerns_v2___3_.;
	format vaccine_concerns_v2___4 vaccine_concerns_v2___4_.;
	format vaccine_concerns_v2___5 vaccine_concerns_v2___5_.;
	format vaccine_concerns_v2___6 vaccine_concerns_v2___6_.;
	format vaccine_concerns_v2___7 vaccine_concerns_v2___7_.;
	format vaccine_concerns_v2___8 vaccine_concerns_v2___8_.;
	format vaccine_concerns_v2___9 vaccine_concerns_v2___9_.;
	format vaccine_concerns_v2___10 vaccine_concerns_v2___10_.;
	format cc_imm_v2 cc_imm_v2_.;
	format cc_autoimm_v2 cc_autoimm_v2_.;
	format cc_hypertension_v2 cc_hypertension_v2_.;
	format cc_chronickd_v2 cc_chronickd_v2_.;
	format cc_diabetes_v2 cc_diabetes_v2_.;
	format cc_cancer_v2 cc_cancer_v2_.;
	format cc_cvd_v2 cc_cvd_v2_.;
	format cc_asthma_v2 cc_asthma_v2_.;
	format cc_copd_v2 cc_copd_v2_.;
	format cc_clung_v2 cc_clung_v2_.;
	format cc_sickle_v2 cc_sickle_v2_.;
	format cc_depression_v2 cc_depression_v2_.;
	format cc_asud_v2 cc_asud_v2_.;
	format cc_intrav_v2 cc_intrav_v2_.;
	format cc_othermh_v2 cc_othermh_v2_.;
	format cc_otherchroniccond_v2 cc_otherchroniccond_v2_.;
	format self_reported_health_v_1 self_reported_health_v_1_.;
	format self_reported_disability_v2 self_reported_disability_v2_.;
	format fi_discrimation_v2___1 fi_discrimation_v2___1_.;
	format fi_discrimation_v2___2 fi_discrimation_v2___2_.;
	format fi_discrimation_v2___3 fi_discrimation_v2___3_.;
	format fi_discrimation_v2___4 fi_discrimation_v2___4_.;
	format fi_discrimation_v2___5 fi_discrimation_v2___5_.;
	format fi_discrimation_v2___6 fi_discrimation_v2___6_.;
	format fi_discrimation_v2___7 fi_discrimation_v2___7_.;
	format fi_discrimation_v2___8 fi_discrimation_v2___8_.;
	format fi_discrimation_v2___9 fi_discrimation_v2___9_.;
	format fi_discrimation_v2___10 fi_discrimation_v2___10_.;
	format jobloss_covid19_v2 jobloss_covid19_v2_.;
	format fi_ssi_ssdi_v2 fi_ssi_ssdi_v2_.;
	format fi_snap_v2 fi_snap_v2_.;
	format work_wash_v2 work_wash_v2_.;
	format work_closecont_v2 work_closecont_v2_.;
	format work_ppe_v2 work_ppe_v2_.;
	format work_ppe_others_v2 work_ppe_others_v2_.;
	format work_ppe_yourself_v2 work_ppe_yourself_v2_.;
	format work_ppe_access_v2 work_ppe_access_v2_.;
	format work_transport_v2___1 work_transport_v2___1_.;
	format work_transport_v2___2 work_transport_v2___2_.;
	format work_transport_v2___3 work_transport_v2___3_.;
	format work_transport_v2___4 work_transport_v2___4_.;
	format work_transport_v2___5 work_transport_v2___5_.;
	format work_transport_v2___6 work_transport_v2___6_.;
	format work_transport_v2___7 work_transport_v2___7_.;
	format work_transport_v2___8 work_transport_v2___8_.;
	format work_transport_v2___90 work_transport_v2___90_.;
	format jobloss_covid19_span jobloss_covid19_span_.;
	format current_employment_status_span current_employment_status_span_.;
	format employed_ew_cb1e17 employed_ew_cb1e17_.;
	format family_income_cde0a2 family_income_cde0a2_.;
	format percept_ris percept_ris_.;
	format work_wash_6e6917 work_wash_6e6917_.;
	format work_closecont_9e4b91 work_closecont_9e4b91_.;
	format work_ppe_other work_ppe_other_.;
	format work_ppe_yoursel work_ppe_yoursel_.;
	format work_ppe_715948 work_ppe_715948_.;
	format work_ppe_acces work_ppe_acces_.;
	format cc_imm_cd41ef cc_imm_cd41ef_.;
	format cc_autoimm_c2d93b cc_autoimm_c2d93b_.;
	format cc_hypertension_8d5e43 cc_hypertension_8d5e43_.;
	format cc_diabetes_8c79a2 cc_diabetes_8c79a2_.;
	format cc_chronickd_feb3ef cc_chronickd_feb3ef_.;
	format cc_cancer_be993e cc_cancer_be993e_.;
	format cc_cvd_3a8430 cc_cvd_3a8430_.;
	format cc_asthma_de5a1c cc_asthma_de5a1c_.;
	format cc_copd_7146ce cc_copd_7146ce_.;
	format cc_clung_00819f cc_clung_00819f_.;
	format cc_depression_e3ace0 cc_depression_e3ace0_.;
	format cc_asud_b0d0cc cc_asud_b0d0cc_.;
	format cc_sickle_7ca04b cc_sickle_7ca04b_.;
	format cc_intrav_72203d cc_intrav_72203d_.;
	format cc_othermh_34a736 cc_othermh_34a736_.;
	format cc_otherchroniccond_8f65d1 cc_otherchroniccond_8f65d1_.;
	format s_self_reported_heal_v_2 s_self_reported_heal_v_2_.;
	format s_self_reported_disability s_self_reported_disability_.;
	format covid_percept_protect_v covid_percept_protect_v_.;
	format covid_percept_fam_v covid_percept_fam_v_.;
	format covid_percept_risk_v covid_percept_risk_v_.;
	format covid_percept_harm_v covid_percept_harm_v_.;
	format covid_percept_indep_v covid_percept_indep_v_.;
	format covid_trust_info_v covid_trust_info_v_.;
	format covid_info_source_v___1 covid_info_source_v___1_.;
	format covid_info_source_v___2 covid_info_source_v___2_.;
	format covid_info_source_v___3 covid_info_source_v___3_.;
	format covid_info_source_v___4 covid_info_source_v___4_.;
	format covid_info_source_v___5 covid_info_source_v___5_.;
	format covid_info_source_v___6 covid_info_source_v___6_.;
	format covid_info_source_v___7 covid_info_source_v___7_.;
	format covid_info_source_v___8 covid_info_source_v___8_.;
	format covid_info_source_v___9 covid_info_source_v___9_.;
	format covid_info_source_v___10 covid_info_source_v___10_.;
	format covid_info_source_v___11 covid_info_source_v___11_.;
	format covid_info_source_v___90 covid_info_source_v___90_.;
	format vaccine_reasons_9a0558___1 vaccine_reasons_9a0558___1_.;
	format vaccine_reasons_9a0558___2 vaccine_reasons_9a0558___2_.;
	format vaccine_reasons_9a0558___3 vaccine_reasons_9a0558___3_.;
	format vaccine_reasons_9a0558___4 vaccine_reasons_9a0558___4_.;
	format vaccine_reasons_9a0558___5 vaccine_reasons_9a0558___5_.;
	format vaccine_reasons_9a0558___6 vaccine_reasons_9a0558___6_.;
	format vaccine_reasons_9a0558___7 vaccine_reasons_9a0558___7_.;
	format vaccine_reasons_9a0558___8 vaccine_reasons_9a0558___8_.;
	format vaccine_reasons_9a0558___9 vaccine_reasons_9a0558___9_.;
	format vaccine_concerns_10a54e___1 vaccine_concerns_10a54e___1_.;
	format vaccine_concerns_10a54e___2 vaccine_concerns_10a54e___2_.;
	format vaccine_concerns_10a54e___3 vaccine_concerns_10a54e___3_.;
	format vaccine_concerns_10a54e___4 vaccine_concerns_10a54e___4_.;
	format vaccine_concerns_10a54e___5 vaccine_concerns_10a54e___5_.;
	format vaccine_concerns_10a54e___6 vaccine_concerns_10a54e___6_.;
	format vaccine_concerns_10a54e___7 vaccine_concerns_10a54e___7_.;
	format vaccine_concerns_10a54e___8 vaccine_concerns_10a54e___8_.;
	format vaccine_concerns_10a54e___9 vaccine_concerns_10a54e___9_.;
	format vaccine_concerns_10a54e___10 vaccine_concerns_10a54e___10_.;
	format fi_discrimatio___1 fi_discrimatio___1_.;
	format fi_discrimatio___2 fi_discrimatio___2_.;
	format fi_discrimatio___3 fi_discrimatio___3_.;
	format fi_discrimatio___4 fi_discrimatio___4_.;
	format fi_discrimatio___5 fi_discrimatio___5_.;
	format fi_discrimatio___6 fi_discrimatio___6_.;
	format fi_discrimatio___7 fi_discrimatio___7_.;
	format fi_discrimatio___8 fi_discrimatio___8_.;
	format fi_discrimatio___9 fi_discrimatio___9_.;
	format fi_discrimatio___10 fi_discrimatio___10_.;
	format work_transpor___1 work_transpor___1_.;
	format work_transpor___2 work_transpor___2_.;
	format work_transpor___3 work_transpor___3_.;
	format work_transpor___4 work_transpor___4_.;
	format work_transpor___5 work_transpor___5_.;
	format work_transpor___6 work_transpor___6_.;
	format work_transpor___7 work_transpor___7_.;
	format work_transpor___8 work_transpor___8_.;
	format work_transpor___90 work_transpor___90_.;
	format fi_ssi_ssd fi_ssi_ssd_.;
	format fi_sna fi_sna_.;
	format decision decision_.;
	format decision_v2 decision_v2_.;
	igg_value_re = compress(igg_value, , 'a');
	igm_value_re = compress(igm_value, , 'a');
	igm_value_2_re = compress(igm_value_2, , 'a');
	igg_value_2_re = compress(igg_value_2, , 'a');
	igg_value_v2_re = compress(igg_value_v2, , 'a');
	igm_value_v2_re = compress(igm_value_v2, , 'a');
	igm_value_2_v2_re = compress(igm_value_2_v2, , 'a');
	igg_value_2_v2_re = compress(igg_value_2_v2, , 'a');
	igg_valuen = input(igg_value_re, 8.);
	igm_valuen = input(igm_value_re, 8.);
	igm_valuen_2 = input(igm_value_2_re, 8.);
	igg_valuen_2 = input(igg_value_2_re, 8.);
	igg_valuen_v2 = input(igg_value_v2_re, 8.);
	igm_valuen_v2 = input(igm_value_v2_re, 8.);
	igm_valuen_2_v2 = input(igm_value_2_v2_re, 8.);
	igg_valuen_2_v2 = input(igg_value_2_v2_re, 8.);
	
	/*replace missing antibody levels*/
	/*wave 1 only-no replacements for wave 2*/
  if igg_valuen = . and igg_valuen_2 = . then igg_level = .;
	else if igg_valuen = . and igg_valuen_2 ne . then igg_level = igg_valuen_2;
	else igg_level = igg_valuen;
	if igm_valuen = . and igm_valuen_2 ne . then igm_level = igm_valuen_2;
  else igm_level = igm_valuen;
  
  /*replace missing antibody results*/
  /*wave 1*/
  if igg_result = . and igg_result_2 ne . then igg_orig = igg_result_2;
  else if igg_result = 4 and igg_result_2 = 3 then igg_orig = igg_result_2;
  else igg_orig = igg_result;
  
  if igm_result = . and igm_result_2 ne . then igm_orig = igm_result_2;
  else if igm_result = 4 and igm_result_2 = 3 then igm_orig = igm_result_2;
  else igm_orig = igm_result;
run;

*check counts for revised seropositivity;
proc sql;
	select count(*) as ct, igg_result, igg_result_2, igg_orig from savepath.NIH_15Apr24 
	where specimen_collected ne .
	group by igg_result, igg_result_2, igg_orig;
quit;

proc sql;
	select count(*) as ct, igm_result, igm_result_2, igm_orig from savepath.NIH_15Apr24 
	where specimen_collected ne .
	group by igm_result, igm_result_2, igm_orig;
quit;

proc sql;
	select count(*) as ct, igg_orig, igm_orig from savepath.NIH_15Apr24
	where specimen_collected ne .
	group by igg_orig, igm_orig 
	order by igg_orig, igm_orig;
quit;









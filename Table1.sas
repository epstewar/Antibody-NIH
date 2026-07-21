*output results;
ods rtf file="/directory/Table1.rtf";
ods escapechar="^"; 
libname savepath "/directory";
OPTIONS nofmterr;

proc format;
	value 
	$demof '1' =  "Households, No. (%)" 
	'2' = "Respondents, No. (%)"
	'3' = "No. of people in household, mean (SD)"
	'4' = "Age, mean (SD)"
	'5' = "Education level, No. (%)" 
	'6' = "^{style ^{NBSPACE 5}}Advanced degree"
	'7' = "^{style ^{NBSPACE 5}}Bachelor's degree"
	'8' = "^{style ^{NBSPACE 5}}Some college"
	'9' = "^{style ^{NBSPACE 5}}HS graduate or GED"
	'10' = "^{style ^{NBSPACE 5}}9th to 12th grade, no diploma"
	'11' = "^{style ^{NBSPACE 5}}6th to 8th grade"
	'12' = "^{style ^{NBSPACE 5}}5th grade or less"
	'13' = "^{style ^{NBSPACE 5}}Have never gone to school"
	'14' = "^{style ^{NBSPACE 5}}Missing"
	'15' = "Household income, No. (%)"
	'16' = "^{style ^{NBSPACE 5}}100,000 and above"
	'17' = "^{style ^{NBSPACE 5}}75,000-99,999"
	'18' = "^{style ^{NBSPACE 5}}50,000-74,999"
	'19' = "^{style ^{NBSPACE 5}}35,0000-49,999"
	'20' = "^{style ^{NBSPACE 5}}25,000-34,999"
	'21' = "^{style ^{NBSPACE 5}}20,000-24,999"
	'22' = "^{style ^{NBSPACE 5}}15,000-19,999"
	'23' = "^{style ^{NBSPACE 5}}Less than 15,000"
	'24' = "^{style ^{NBSPACE 5}}Missing"
  '25' = "Race/Ethnicity, No. (%)"
	'26' = "^{style ^{NBSPACE 5}}White, Hispanic"
	'27' = "^{style ^{NBSPACE 5}}White, Non-Hispanic"
	'28' = "^{style ^{NBSPACE 5}}Non-White, Hispanic"
	'29' = "^{style ^{NBSPACE 5}}Non-White, Non-Hispanic"
	'30' = "^{style ^{NBSPACE 5}}Missing"
	'31' = "Sex, No. (%)"
	'32' = "^{style ^{NBSPACE 5}}Women"
	'33' = "^{style ^{NBSPACE 5}}Men"
	'34' = "^{style ^{NBSPACE 5}}Missing";
run;

*no. people in household;
proc sql;
	create table temp as 
	select t.*, l.house_ct from savepath.analytic_v2 t
	left join 
	(select count(*) as house_ct, household_id from savepath.analytic_v2 
	group by household_id) l
	on t.household_id = l.household_id;
quit;

data temp;
	length race_ethn 8;
	set temp;
	if education_level in (98, 99) then education_level = .;
	if essential = 98 then essential = .;
	
	if race_ethn_race_2___5 = 0 and race_ethn_hispanic_2 = 0 then race_ethn = 00;
	else if race_ethn_race_2___5 = 1 and race_ethn_hispanic_2 = 0 then race_ethn = 10;
	else if race_ethn_race_2___5 = 0 and race_ethn_hispanic_2 = 1 then race_ethn = 01;
	else if race_ethn_race_2___5 = 1 and race_ethn_hispanic_2 = 1 then race_ethn = 11;
	else race_ethn = '';
	
	if health = 0 then health_issue = 0;
	else health_issue = 1;
	
	if factor_one_rc = 0 and factor_two_rc = 0 then int_catn = 0;
	else if factor_one_rc = 0 and factor_two_rc = 1 then int_catn = 1;
	else if factor_one_rc = 1 and factor_two_rc = 0 then int_catn = 2;
	else if factor_one_rc = 1 and factor_two_rc = 1 then int_catn = 3;
	
	if birth_sex = 1 then sex = 1;
	else if birth_sex = 0 then sex = 0;
	else sex = .;
	format race_ethn z2.;
run;

%macro stats(var);
		%do i = 0 %to 3;
		proc sql;
		create table &var&i as
		select t.*, ct/sum(ct)*100 as perc from
		(select &var as Characteristic, count(*) as ct from temp 
		%if &var = income %then %do;
		where head_of_household = 1 and int_catn = &i
	  %end;
	  %else %do;
	  where int_catn = &i
	  %end;
	  group by &var) t;
	quit;
	
	data &var&i;
		length Characteristic 8 var $ 32;
		set &var&i;
		%if ct ne . %then %do;
	  ct_perc&i = catx('', ct, cat('(', round(perc, .01), '%', ')'));
	  %end;
	  var = "&var";
	  keep Characteristic ct_perc&i var;
	run;
	
	*title rows;
		proc sql;
		create table &var&i.title 
		(Characteristic num,
		var char(32),
		ct_perc&i char(32));
		
		insert into &var&i.title
		values(12, "&var", '');
	  quit;
	  
	  *append title rows to counts;
	  data &var&i;
	  	length Characteristic 8 var $ 32 ct_perc&i $ 32;
	  	set &var&i.title
	  	&var&i;
	  run;
	  
	 *mean no. people in household;
   proc sql;
		create table housect&i as
		select 1 as Characteristic, "abhouse_ct" as var length=32, catx(' ', mean_house_ct, cat( '(', sd_house_ct, ')')) as ct_perc&i from
		(select round(avg(house_ct),.01) as mean_house_ct, round(std(house_ct),.01) as sd_house_ct from temp
		where head_of_household = 1 and int_catn = &i);
   quit;
   
   *mean age;
    proc sql;
		create table age&i as
		select 1 as Characteristic, "age" as var length=32, catx(' ', mean_age, cat( '(', sd_age, ')')) as ct_perc&i from
		(select round(avg(age),.01) as mean_age, round(std(age),.01) as sd_age from temp
		where int_catn = &i);
   quit;
   
   *total number of households;
   proc sql;
   	create table totalhouses&i as 
   	select 2 as Characteristic, "aasamplect" as var length=32,  catx(' ', count(*), cat('(', round((count(*)/628)*100, .01), '%', ')')) as ct_perc&i from temp 
   	where head_of_household = 1 and int_catn = &i;
   quit;
 
     *total number of respondents;
   proc sql;
   	create table totalresponse&i as 
   	select 1 as Characteristic, "aasamplect" as var length=32, catx(' ', count(*), cat('(', round((count(*)/2166)*100, .01), '%', ')')) as ct_perc&i
   	from temp 
   	where int_catn = &i;
   quit;
  %end;	
  
  *overall;
  	proc sql;
		create table &var.4 as
		select t.*, ct/sum(ct)*100 as perc from
		(select &var as Characteristic, count(*) as ct from temp 
		%if &var = income %then %do;
		where head_of_household = 1
	  %end;
	  group by &var) t;
	quit;
	
	data &var.4;
		length Characteristic 8 var $ 32;
		set &var.4;
		%if ct ne . %then %do;
	  overall = catx('', ct, cat('(', round(perc, .01), '%', ')'));
	  %end;
	  var = "&var";
	  keep Characteristic overall var;
	run;
	
	*title rows;
		proc sql;
		create table &var.4title 
		(Characteristic num,
		var char(32),
		overall char(32));
		
		insert into &var.4title
		values(12, "&var", '');
	  quit;
	  
	  *append title rows to counts;
	  data &var.4;
	  	length Characteristic 8 var $ 32 Overall $ 32;
	  	set &var.4title
	  	&var.4;
	  run;
	  
	 *mean no. people in household;
   proc sql;
		create table housect4 as
		select 1 as Characteristic, "abhouse_ct" as var length=32, catx(' ', mean_house_ct, cat( '(', sd_house_ct, ')')) as Overall from
		(select round(avg(house_ct),.01) as mean_house_ct, round(std(house_ct),.01) as sd_house_ct from temp
		where head_of_household = 1);
   quit;
   
   *mean age;
    proc sql;
		create table age4 as
		select 1 as Characteristic, "age" as var length=32, catx(' ', mean_age, cat( '(', sd_age, ')')) as Overall from
		(select round(avg(age),.01) as mean_age, round(std(age),.01) as sd_age from temp);
   quit;
   
   *total number of households;
   proc sql;
   	create table totalhouses4 as 
   	select 2 as Characteristic, "aasamplect" as var length=32, put(count(*), 32.) as Overall from temp 
   	where head_of_household = 1;
   quit;
 
     *total number of respondents;
   proc sql;
   	create table totalresponse4 as 
   	select 1 as Characteristic, "aasamplect" as var length=32, put(count(*), 32.) as Overall from temp;
   quit;
%mend stats;
%stats(education_level);
%stats(race_ethn);
%stats(income);
%stats(sex);

*append data;
%macro app(no);
	%do i = 0 %to 4;
	data total&i;
	set 
	totalhouses&i
	totalresponse&i
	housect&i
	education_level&i
	race_ethn&i
	income&i
	age&i
	sex&i;
run;

proc sort data = total&i;
	by var descending characteristic;
run;
%end;
%mend app;
%app;

OPTIONS linesize = 256; 
data total;
	merge total0 
	total1 
	total2 
	total3 
	total4;
	by var descending characteristic;
	array miss{5} overall ct_perc0 ct_perc1 ct_perc2 ct_perc3;
	do i = 1 to 5;
		if miss{i} = '' and Characteristic ne 12 and var ne "aasamplect" then miss{i} = '0';
	end;
	demographic = cat(_n_);
	format Demographic $demof.;
	drop var Characteristic i;
run;

*reorder columns;
data savepath.table1;
	retain Demographic Overall ct_perc0 ct_perc1 ct_perc2 ct_perc3;
	set total;
run;

/*options nolabel;*/
*output table;
proc report data = savepath.table1 nowd SPLIT='~'
	 style(report)=[rules=none frame=hsides cellspacing=1 cellpadding=1 borderbottomwidth=2.25pt borderbottomcolor = black]  
	 style(header) = [background=white borderbottomwidth=2.25pt borderbottomcolor = black bordertopcolor = white];
	 define Demographic / left;
	 define Overall / center;
	 define ct_perc0 / 'Personal Messaging/Lottery' center;
	 define ct_perc1 / "Personal Messaging/Loss Protection" center;
	 define ct_perc2 / "Family Messaging/Lottery" center;
	 define ct_perc3 / "Family Messaging/Loss Protection" center;
run;
ods rtf close;


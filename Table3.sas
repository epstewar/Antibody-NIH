ods excel file = "/directory/Table3.xlsx";
libname savepath "/directory";
OPTIONS nofmterr;

proc format;
	value $ studyarmf "0" = "Personal/Lottery"
	"1" = "Personal Messaging/Loss Protection"
	"2" = "Family Messaging/Lottery"
	"3" = "Family Messing/Loss Protection";
run;

*count by interventions and wave;
proc sql;
	create table counts as 
	select count(*) as ct, int_cat, wave, showed_up from savepath.analytic 
	group by int_cat, wave, showed_up
	order by int_cat, wave, showed_up;
quit;

proc sort data = counts;
	by int_cat wave;
run;

proc transpose data = counts out = countst;
	by int_cat wave;
run;

data w1
	w2;
	set countst;
	total = COL1+COL2;
	if wave = 0 then output w1;
	else if wave = 1 then output w2;
	where _NAME_ ne 'showed_up';
	keep int_cat col1 col2 total;
run;

*add wave 2 probability and CI;
options validvarname = any;
data w2;
	set w2;
	p = col2/total;
	p0 = 1-p;
	SE = sqrt((p0*p)/total);
	p1 = round(p*100,0.01);
	ucl = round((p + 1.96*SE)*100,0.01);
	lcl = round((p - 1.96*SE)*100,0.01);
	w2 = catx(' ', p1, cat( '(', lcl, ', ', ucl, ')'));
	NNI = round((1/p),0.01);
	NNI_ucl = round((1/p)+1.96*sqrt((p*(1-p))/total),0.01);
	NNI_lcl = round((1/p)-1.96*sqrt((p*(1-p))/total),0.01);
	NNIR = catx(' ', NNI, cat( '(', NNI_lcl, ', ', NNI_ucl, ')'));
	label int_cat = "Study Arm" w2 = "Time 2 Percent Attendance (95% CI)" int_cat = "Study Arm" total = "Total Respondents Time 2" col2 = "Attended Time 2" NNIR = 'NNI (95% CI)';
run;

*number of households in each study arm;
proc sql;
	create table houses as 
	select count(distinct household_id) as ct_house, int_cat from savepath.analytic 
	group by int_cat
	order by int_cat;
quit;

proc sql;
	create table total as 
	select t.int_cat, n.ct_house as 'Total Households'n, t.total as 'Total Respondents Time 1'n,
  t.col2 as "Attended Time 1"n,
	l.total, l.col2, l.w2, l.NNIR from w1 t 
	left join 
	w2 l 
	on t.int_cat = l.int_cat
	left join 
	houses n 
	on t.int_cat = n.int_cat;
quit;
	
proc print data = total label;
	format int_cat $studyarmf.;
	label int_cat = "Study Arm";
run;
ods excel close;

	


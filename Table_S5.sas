ods rtf file="/directory/TableS4.rtf";
libname savepath "/directory";
OPTIONS nofmterr;
ods escapechar="^";

*row titles;
proc format;
	value rnf
	 1 = "Money Primary Vaccine Barrier"
	 2 = "^{style ^{NBSPACE 5}}Personal Messaging/Loss Protection"
	 3 = "^{style^{NBSPACE 5}}Family Messaging/Lottery"
	 4 = "^{style^{NBSPACE 5}}Family Messaging/Loss Protection"
	 5 = "Medical professionals most trusted"
	 6 = "^{style ^{NBSPACE 5}}Personal Messaging/Loss Protection"
	 7 = "^{style^{NBSPACE 5}}Family Messaging/Lottery"
	 8 = "^{style^{NBSPACE 5}}Family Messaging/Loss Protection"
	 9 = "Risk averse^{super 2}"
	 10 = "^{style ^{NBSPACE 5}}Personal Messaging/Loss Protection"
	 11 = "^{style^{NBSPACE 5}}Family Messaging/Lottery"
	 12 = "^{style^{NBSPACE 5}}Family Messaging/Loss Protection";
run;

*Heterogeneity of effect;
%macro log(var);
ods graphics off;
ods exclude all;
ods table ParameterEstimates = pe&var clparmwald = ci&var;
proc logistic data = savepath.analytic_v2;
	class &var (ref = "0") int_cat (ref = "0");
	model showed_up_w2 (event = "1") = int_cat &var int_cat*&var/clparm = wald;
	where showed_up_w1 = 1 and head_of_household = 1;
run;

proc sql;
	create table &var as 
	select t.variable, catx(" ", round(t.estimate, 0.01), cat("(", round(l.LowerCL, 0.01), ", ", round(l.UpperCL, 0.01),")")) as Est, round(t.StdErr, 0.01) as SE,
	round(t.WaldChiSq, 0.01) as chi,
	round(t.ProbChiSq, 0.001) as p from 
	pe&var t 
	left join 
	ci&var l
	on t.variable = l.parameter
	and t.classval1 = l.classval1
	where t.ClassVal0 = "1" and t.ClassVal1 in ("1", "2", "3");
quit;

*change variable lengths;
data &var;
	length variable $ 36 Est $ 36 SE 8 chi 8 p 8;
	set &var;
run;
%mend log;
%log(covid_trust_info___4);
%log(risk_v2); 
%log(vaccine_concerns_v2___8); 

*title rows;
%macro title(name);
proc sql;
		create table &name
		(variable char(64),
	  est char(32),
		se num(8),
		chi num(8),
		p num(8)
		);
		
		insert into &name
		values("&name", ' ', . , . , .);
quit;
%mend title;
%title(atitle);
%title(btitle);
%title(utitle);
OPTIONS MISSING = ' ';

*append dataframes;
data savepath.table_s4;
	label rn = "Parameter" est = "Estimate (95% CI)" SE = "SE" chi = "Chi-square" p = "P Value";
	retain rn est se chi p;
	set atitle
	covid_trust_info___4
	btitle
	risk_v2
	utitle
	vaccine_concerns_v2___8;
  rn = _n_;
  format rn rnf.;
  drop variable;
run;
ods exclude none;

*output table;
proc report data = savepath.table_s4 nowd
	 style(report)=[rules=none frame=hsides cellspacing=1 cellpadding=1 borderbottomcolor = white]  
	 style(header) = [background=white borderbottomwidth=2.25pt borderbottomcolor = black bordertopcolor = white];
	 define rn / left style(column)={cellwidth=2.2in};
	 define est / center style(column)={cellwidth=1.2in};
	 define se / center style(column)={cellwidth=0.75in};
	 define chi / center style(column)={cellwidth=0.75in};
	 define p / center style(column)={cellwidth=0.75in};
	 compute after / style={just=l};
	 line "Abbreviations: CI, confidence interval; SE, standard error.";
	 line "^{super 1}Risk score of 5 or less.";
 	 endcomp;
run;
ods rtf close;


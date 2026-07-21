**PURPOSE**

	The NIH-Antibody repository contains code for manuscript "Financial incentives and social messaging for repeat SARS-CoV-2 antibody testing among the underserved: A randomized trial" 
	published in Social Science & Medicine in July 2026
	
	DOI: https://doi.org/10.1016/j.socscimed.2026.119622
	
	DATA (collected from June 2021 to June 2023)
	1. Data collected on 2,164 individuals from 625 households from AltaMed Medical Group

**ANALYSES**

 *PRIMARY*
 
	1. Multi-level (mixed effects) logistic regression testing change in attendance (yes vs. no) from 
		 Time 1 to Time 2 for Messaging and Financial Incentives (individuals = 2,160, households = 625) 
	2. Table 2 values are estimated percentage points (PP) and change in estimated percentage 
	   points (treatment-by-time interaction effects)
	3. Linear probability model (mixed effects linear regression) testing change in mean attendance 
	   from Time 1 to Time 2 for Messaging and Financial Incentives (individuals = 2,160, households = 625)
	4. Testing for additive effects with a mixed effects logistic regression with a three-way time-by-treatment(s) 
	   interaction effect (time x messaging x financial incentives) 
	   a. Wald Test
	5. Number Needed to Incentivize (NNI): The reciprocal of the probability of attending Time 2, given attendance at Time 1```
	
 *SECONDARY*
 
	1. Time 1: logistic regression testing change in attendance for each head of household reported characteristic
	   (n = 625 households)
	2. Time 2: 
	   a. logistic regression testing difference (treatment-by-time interaction) in the change in Time 2 attendance, 
	   conditional on attending Time 1, by financial incentive study arm and each head of household reported characteristic 
	   (households = 625) 
	   b. Mixed effects logistic regression testing difference in Time 2 attendance by seropositivity status (yes vs. no) 
	   (individuals = 2,160, households = 625)
	      
 *MECHANISM OF EFFECT* 
 ``
	 
	 1. Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1,
	    between financial incentives and messaging study arms (treatment-by-treatment interaction) (individuals = 2,160,
	    households = 625)```
	    
	 *HETEROGENEITY OF EFFECTS AND DESCRIPTIVE TRENDS*
	 1. Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1, between 
	    study arm and each significant (at p < 0.05) head of household reported characteristic (individuals = 2,160, households = 625)
	    (reference group = personal/lottery)```
	 ```2. Antibody trends 
	    a. Chi-square testing whether inconclusive antibody test rates differed by study arm for Time 1 and Time 2 
	    b. Percentage of seropositive individuals at Time 1 vs. Time 2 
	    c. Mixed effects linear regression testing difference in mean IgG and IgM antibody levels at Time 1 vs. Time 2```
 
**SOFTWARE**
	```SAS version 9.4 and STATA software version 16```

**LICENSE**
	```Schaeffer Center for Health Policy and Economics, University Southern California```
	
**FILES** 
	```1. Import_redcap.sas 
	   a. import REDCap data, and create revised antibody level variables 
	
	2. analytic_file.sas
	   a. Edit and recode survey variables
	   b. Convert data from wide to long format for models (savepath.analytic)
	
	3. consort.sas
	   a. Output values for consort diagram (**Fig. 1; section 3.1 Sample**)
	
	4. check_decline.sas 
	   a. Output rates of decline and chi-square statistic ```(**Fig. 1; section 3.1 Sample**)```
	
	5. Table1.sas 
	   a. Calculate numbers (%) for sample characteristics ```(**Table 1; section 3.1 Sample**)```
	
	6. Table2.sas
	   a. Execute model for primary analysis and get bootstrapped distribution of predicted probabilities, 
	   differences in predicted probabilities, and the treatment-by-time interaction effects ```(**Table 2; section 3.2 Primary hypothesis**)```
	   a. 95% confidence intervals are based on the 2.5% and 97.5% cut-offs of bootstrapped distribution

	7. Table_S2a.sas
	   a. Output estimates for primary hypothesis 1 and secondary Time 1 hypotheses ```(**Supplementary Table S2a; section 3.2 Primary hypothesis**)```
	
	8. 3wayinteraction.sas
	   a. Output estimates for three-way interaction model testing for additive effects ```(**section 3.2 Primary hypothesis**)```
	
	9. Table_S2b.do
	   a. Output estimates for linear probability model ```(**Supplementary Table S2b; section 3.2 Primary hypothesis**)```
	   
	10. mechanism_of_effect.sas
	   a. Output estimates for mechanism of effect model ```(**section 3.3 Mechanism of the effect**)```
	
	11. Table3.sas 
	   a. Output statistics for NNI ```(**Table 3; section 3.3 Mechanism of the effect**)```
	
	11. Table_S4.sas
	   a. Output estimates for secondary Time 2 hypotheses ```(**Supplementary Table S4; section 3.4 secondary hypotheses**)```
	
	13. Table_S5.sas
	    a. Output estimates for heterogeneity of effect(s) ```(**Supplementary Table S5; section 3.5 Heterogeneity of effects and descriptive trends**)```
	
	14. antibody_levels.sas
	    a. Output descriptive statistics for antibody trends ```(**Supplementary Table 6 and Table 7; section 3.5 Heterogeneity of effects and descriptive trends**)```
	

	



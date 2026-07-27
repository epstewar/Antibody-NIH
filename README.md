**PURPOSE**

The NIH-Antibody repository contains code for manuscript "Financial incentives and social messaging for repeat SARS-CoV-2 antibody testing among the underserved: A randomized trial"
published in Social Science & Medicine in July 2026

DOI: https://doi.org/10.1016/j.socscimed.2026.119622

**DATA**

Data collected on 2,164 individuals from 625 households from AltaMed Medical Group from June 2021 to June 2023

**ANALYSES**

  *PRIMARY*

1. Multi-level (mixed effects) logistic regression testing change in attendance (yes vs. no) from Time 1 to Time 2 for Messaging and Financial Incentives
2. Table 2 values are estimated percentage points (PP) and change in estimated percentage points (treatment-by-time interaction effects)
3. Multi-level linear probability model testing change in mean attendance from Time 1 to Time 2 for Messaging and Financial Incentives
4. Testing for additive effects with a mixed effects logistic regression with a three-way time-by-treatment(s)
	 interaction effect (time x messaging x financial incentives)
    1. Wald Test
5. Number Needed to Incentivize (NNI): The reciprocal of the probability of attending Time 2, given Time 1

  *SECONDARY*

1. Time 1: logistic regression testing change in attendance for each head of household reported characteristic
2. Time 2:
    1. logistic regression testing difference (treatment-by-time interaction) in the change in Time 2 attendance,
			 conditional on Time 1 attendance, by financial incentive study arm and each head of household reported characteristic
    2. Mixed effects logistic regression testing difference in Time 2 attendance by seropositivity status (yes vs. no)

  *MECHANISM OF EFFECT*

1. Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1,
	 between financial incentives and messaging study arms (treatment-by-treatment interaction)

  *HETEROGENEITY OF EFFECTS AND DESCRIPTIVE TRENDS*

1. Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1, between
	 study arm and each significant (at p < 0.05) head of household reported characteristic
	 (reference group = personal/lottery)
2. Antibody trends
    1. Chi-square testing whether inconclusive antibody test rates differed by study arm for Time 1 and Time 2
    2. Percentage of seropositive individuals at Time 1 vs. Time 2
    3. Mixed effects linear regression testing difference in mean IgG and IgM antibody levels at Time 1 vs. Time 2

**SOFTWARE**

SAS version 9.4 and STATA software version 16

**LICENSE**

Schaeffer Center for Health Policy and Economics, University Southern California

**FILES**

<ol>
  <li>
    <strong>Import_redcap.sas</strong>
    <ol type="i">
      <li>import REDCap data, and create revised antibody level variables</li>
    </ol>
  </li>
</ol>


<ol start="2">
  <li>
    <strong>analytic_file.sas</strong>
    <ol type="i">
      <li>Edit and recode survey variables</li>
      <li>Convert data from wide to long format for models (<strong>savepath.analytic</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>consort.sas</strong>:
    <ol type="i">
      <li>Output values for consort diagram (<strong>Fig. 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>check_decline.sas</strong>:
    <ol type="i">
      <li>Output rates of decline and chi-square statistic (<strong>Fig. 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table1.sas</strong>:
    <ol type="i">
      <li>Calculate numbers (%) for sample characteristics (<strong>Table 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table2.sas</strong>:
    <ol type="i">
      <li>Execute model for primary analysis and get bootstrapped distribution of predicted probabilities, differences in predicted probabilities, and the treatment-by-time interaction effects (<strong>Table 2; section 3.2 Primary hypothesis</strong>)</li>
      <li>95% confidence intervals are based on the 2.5% and 97.5% cut-offs of bootstrapped distribution</li>
    </ol>
  </li>


  <li>
    <strong>Table_S2a.sas</strong>:
    <ol type="i">
      <li>Output estimates for primary hypothesis 1 and secondary Time 1 hypotheses (<strong>Supplementary Table S2a; section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>3wayinteraction.sas</strong>:
    <ol type="i">
      <li>Output estimates for three-way interaction model testing for additive effects (<strong>section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table_S2b.do</strong>:
    <ol type="i">
      <li>Output estimates for linear probability model (<strong>Supplementary Table S2b; section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>mechanism_of_effect.sas</strong>:
    <ol type="i">
      <li>Output estimates for mechanism of effect model (<strong>section 3.3 Mechanism of the effect</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table3.sas</strong>:
    <ol type="i">
      <li>Output statistics for NNI (<strong>Table 3; section 3.3 Mechanism of the effect</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table_S4.sas</strong>:
    <ol type="i">
      <li>Output estimates for secondary Time 2 hypotheses (<strong>Supplementary Table S4; section 3.4 secondary hypotheses</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>Table_S5.sas</strong>:
    <ol type="i">
      <li>Output estimates for heterogeneity of effect(s) (<strong>Supplementary Table S5; section 3.5 Heterogeneity of effects and descriptive trends</strong>)</li>
    </ol>
  </li>


  <li>
    <strong>antibody_levels.sas</strong>:
    <ol type="i">
      <li>Output descriptive statistics for antibody trends (<strong>Supplementary Table 6 and Table 7; section 3.5 Heterogeneity of effects and descriptive trends</strong>)</li>
    </ol>
  </li>
</ol>

2. analytic_file.sas
    1. Edit and recode survey variables
    2. Convert data from wide to long format for models (**savepath.analytic**)

3. consort.sas:
    1. Output values for consort diagram (**Fig. 1; section 3.1 Sample**)

4. check_decline.sas:
    1. Output rates of decline and chi-square statistic (**Fig. 1; section 3.1 Sample**)

5. Table1.sas:
    1. Calculate numbers (%) for sample characteristics (**Table 1; section 3.1 Sample**)

6. Table2.sas:
    1. Execute model for primary analysis and get bootstrapped distribution of predicted probabilities,
	     differences in predicted probabilities, and the treatment-by-time interaction
	     effects (**Table 2; section 3.2 Primary hypothesis**)
    2. 95% confidence intervals are based on the 2.5% and 97.5% cut-offs of bootstrapped distribution

7. Table_S2a.sas:
    1. Output estimates for primary hypothesis 1 and secondary Time 1 hypotheses (**Supplementary Table S2a; section 3.2 Primary hypothesis**)

8. 3wayinteraction.sas:
    1. Output estimates for three-way interaction model testing for additive effects (**section 3.2 Primary hypothesis**)

9. Table_S2b.do:
    1. Output estimates for linear probability model (**Supplementary Table S2b; section 3.2 Primary hypothesis**)

10. mechanism_of_effect.sas:
    1. Output estimates for mechanism of effect model (**section 3.3 Mechanism of the effect**)

11. Table3.sas:
    1. Output statistics for NNI (**Table 3; section 3.3 Mechanism of the effect**)

12. Table_S4.sas:
    1. Output estimates for secondary Time 2 hypotheses (**Supplementary Table S4; section 3.4 secondary hypotheses**)

13. Table_S5.sas:
    1. Output estimates for heterogeneity of effect(s) (**Supplementary Table S5; section 3.5 Heterogeneity of effects and descriptive trends**)

14. antibody_levels.sas:
    1. Output descriptive statistics for antibody trends (**Supplementary Table 6 and Table 7; section 3.5 Heterogeneity of effects and descriptive trends**)






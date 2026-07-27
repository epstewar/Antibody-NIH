**PURPOSE**

The NIH-Antibody repository contains code for manuscript "Financial incentives and social messaging for repeat SARS-CoV-2 antibody testing among the underserved: A randomized trial"
published in Social Science & Medicine in July 2026

**DOI:** 
https://doi.org/10.1016/j.socscimed.2026.119622

**DATA**

Data collected on 2,164 individuals from 625 households from AltaMed Medical Group from June 2021 to June 2023

**ANALYSES**

<ol>
  <li>
    <em>Primary</em>
    <ol>
      <li>Multi-level (mixed effects) logistic regression testing change in attendance (yes vs. no) from Time 1 to Time 2 for Messaging and Financial Incentives</li>
      <li>Table 2 values are estimated percentage points (PP) and change in estimated percentage points (treatment-by-time interaction effects)</li>
      <li>Multi-level linear probability model testing change in mean attendance from Time 1 to Time 2 for Messaging and Financial Incentives</li>
      <li>
        Testing for additive effects with a mixed effects logistic regression with a three-way time-by-treatment(s) interaction effect (time x messaging x financial incentives)
        <ol type="i">
          <li>Wald Test</li>
        </ol>
      </li>
      <li>Number Needed to Incentivize (NNI): The reciprocal of the probability of attending Time 2, given Time 1</li>
    </ol>
  </li>
    </ol>
<ol start="2">
  <li>
    <em>Secondary</em>
    <ol>
      <li>Time 1: logistic regression testing change in attendance for each head of household reported characteristic</li>
      <li>
        Time 2:
        <ol type="i">
          <li>Logistic regression testing difference (treatment-by-time interaction) in the change in Time 2 attendance, conditional on Time 1 attendance, by financial incentive study arm and each head of household reported characteristic</li>
          <li>Mixed effects logistic regression testing difference in Time 2 attendance by seropositivity status (yes vs. no)</li>
        </ol>
      </li>
    </ol>
  </li>
    </ol>
<ol start="3">
  <li>
    <em>Mechanism of effect</em>
    <ol>
      <li>Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1, between financial incentives and messaging study arms (treatment-by-treatment interaction)</li>
    </ol>
  </li>
    </ol>
<ol start="4">
  <li>
    <em>Heterogeneity of effects and descriptive trends</em>
    <ol>
      <li>Mixed effects logistic regression testing difference in Time 2 attendance, conditional on attending Time 1, between study arm and each significant (at p &lt; 0.05) head of household reported characteristic (reference group = personal/lottery)</li>
      <li>
        Antibody trends
        <ol type="i">
          <li>Chi-square testing whether inconclusive antibody test rates differed by study arm for Time 1 and Time 2</li>
          <li>Percentage of seropositive individuals at Time 1 vs. Time 2</li>
          <li>Mixed effects linear regression testing difference in mean IgG and IgM antibody levels at Time 1 vs. Time 2</li>
        </ol>
      </li>
    </ol>
  </li>
</ol>

**SOFTWARE**

SAS version 9.4 and STATA software version 16

**LICENSE**

Schaeffer Center for Health Policy and Economics, University Southern California

**FILES**

<ol>
  <li>
    <em>Import_redcap.sas</em>
    <ol type="i">
      <li>import REDCap data, and create revised antibody level variables</li>
    </ol>
  </li>
    </ol>
<ol start="2">
  <li>
    <em>analytic_file.sas</em>
    <ol type="i">
      <li>Edit and recode survey variables</li>
      <li>Convert data from wide to long format for models (<strong>savepath.analytic</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="3">
  <li>
    <em>consort.sas</em>
    <ol type="i">
      <li>Output values for consort diagram (<strong>Fig. 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="4">
  <li>
    <em>check_decline.sas</em>
    <ol type="i">
      <li>Output rates of decline and chi-square statistic (<strong>Fig. 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="5">
  <li>
    <em>Table1.sas</em>
    <ol type="i">
      <li>Calculate numbers (%) for sample characteristics (<strong>Table 1; section 3.1 Sample</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="6">
  <li>
    <em>Table2.sas</em>
    <ol type="i">
      <li>Execute model for primary analysis and get bootstrapped distribution of predicted probabilities, differences in predicted probabilities, and the treatment-by-time interaction effects (<strong>Table 2; section 3.2 Primary hypothesis</strong>)</li>
      <li>95% confidence intervals are based on the 2.5% and 97.5% cut-offs of bootstrapped distribution</li>
    </ol>
  </li>
    </ol>
<ol start="7">
  <li>
    <em>Table_S2a.sas</em>
    <ol type="i">
      <li>Output estimates for primary hypothesis 1 and secondary Time 1 hypotheses (<strong>Supplementary Table S2a; section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="8">
  <li>
    <em>3wayinteraction.sas</em>
    <ol type="i">
      <li>Output estimates for three-way interaction model testing for additive effects (<strong>section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="9">
  <li>
    <em>Table_S2b.do</em>
    <ol type="i">
      <li>Output estimates for linear probability model (<strong>Supplementary Table S2b; section 3.2 Primary hypothesis</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="10">
  <li>
    <em>mechanism_of_effect.sas</em>
    <ol type="i">
      <li>Output estimates for mechanism of effect model (<strong>section 3.3 Mechanism of the effect</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="11">
  <li>
    <em>Table3.sas</em>
    <ol type="i">
      <li>Output statistics for NNI (<strong>Table 3; section 3.3 Mechanism of the effect</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="12">
  <li>
    <em>Table_S4.sas</em>
    <ol type="i">
      <li>Output estimates for secondary Time 2 hypotheses (<strong>Supplementary Table S4; section 3.4 secondary hypotheses</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="13">
  <li>
    <em>Table_S5.sas</em>
    <ol type="i">
      <li>Output estimates for heterogeneity of effect(s) (<strong>Supplementary Table S5; section 3.5 Heterogeneity of effects and descriptive trends</strong>)</li>
    </ol>
  </li>
    </ol>
<ol start="14">
  <li>
    <em>antibody_levels.sas</em>
    <ol type="i">
      <li>Output descriptive statistics for antibody trends (<strong>Supplementary Table 6 and Table 7; section 3.5 Heterogeneity of effects and descriptive trends</strong>)</li>
    </ol>
  </li>
</ol>


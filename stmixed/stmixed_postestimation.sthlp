{smcl}
{* *! version 2.0.0 ?????2012}{...}
{cmd:help stmixed postestimation}{right: ({browse "https://doi.org/10.1177/1536867X19893639":SJ19-4: st0584})}
{hline}

{title:Title}

{p2colset 5 31 30 2}{...}
{p2col :{cmd:stmixed postestimation} {hline 2}}Postestimation tools for stmixed{p_end}
{p2colreset}{...}


{title:Description}

{pstd}
The following standard postestimation commands are available after {cmd:stmixed}:

{synoptset 13}{...}
{p2coldent :Command}Description{p_end}
{synoptline}
INCLUDE help post_estimates
INCLUDE help post_lincom
INCLUDE help post_lrtest
INCLUDE help post_nlcom
{p2col :{helpb stmixed postestimation##predict:predict}}predictions,
residuals, etc.{p_end}
INCLUDE help post_predictnl
INCLUDE help post_test
INCLUDE help post_testnl
{synoptline}
{p2colreset}{...}


{marker predict}{...}
{title:Syntax for predict}

{phang}Syntax for obtaining predictions{p_end}

{p 8 16 2}
{cmd:predict} {newvar} {ifin} [{cmd:,} {it:statistic} {it:options}]


{synoptset 20}{...}
{synopthdr :statistic}
{synoptline}
{synopt :{opt eta}}linear predictor{p_end}
{synopt :{opt h:azard}}hazard{p_end}
{synopt :{opt s:urvival}}survival S(t){p_end}
{synopt :{opt ch:azard}}cumulative hazard{p_end}
{synopt :{opt cif}}cumulative incidence function{p_end}
{synopt :{opt rmst}}restricted mean survival time (integral of {cmd:survival}){p_end}
{synopt :{opt timelost}}time lost due to event (integral of {cmd:cif}){p_end}
{synoptline}

{synoptset 31}{...}
{synopthdr :options}
{synoptline}
{synopt :{opt fixedonly}}specify predictions based on the fixed portion of the model{p_end}
{synopt :{opt marginal}}compute prediction marginally with respect to the latent variables{p_end}
{synopt :{opt at(varname # [varname # ...])}}predict at values of specified covariates{p_end}
{synopt :{opt ci}}calculate confidence intervals{p_end}
{synopt :{opt time:var(varname)}}time variable used for predictions (default
is {cmd:timevar(_t0)} for longitudinal submodel and {cmd:timevar(_t)} for survival submodel){p_end}
{synopt :{opt lev:el(#)}}set confidence level; default is {cmd:level(95)}{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2} 
Statistics are available both in and out of sample; type
{cmd:predict} ... {cmd:if e(sample)} ... if wanted only for the
estimation sample.{p_end}


{title:Options for predict}

{pstd}
Note that if a relative survival model has been fit using the {cmd:bhazard()}
option, then "survival" refers to relative survival and "hazard" refers to
excess hazard.

{phang}
{opt eta} calculates the expected value of the linear predictor.

{phang}
{opt hazard} calculates the predicted hazard.

{phang}
{opt survival} calculates each observation's predicted survival probability.

{phang}
{opt chazard} calculates the predicted cumulative hazard.

{phang}
{opt cif} calculates the predicted cumulative incidence function.

{phang}
{opt rmst} calculates the restricted mean survival time, that is, the integral
of the survival function up to time t.

{phang}
{opt timelost} calculates the time lost due to the event occurring, that is,
the integral of the cumulative incidence function up to time t.

{phang}
{opt fixedonly} specifies predictions based on the fixed portion of the model.

{phang}
{opt marginal} specifies predictions calculated marginally with respect to the
random effects, that is, population-averaged predictions.

{phang}
{opt at(varname # [ varname # ...])} requests that the covariates specified by
the listed variable name or names be set to the listed {it:#} values.  For
example, {cmd:at(x1 1 x3 50)} would evaluate predictions at {cmd:x1} = 1 and
{cmd:x3} = 50.  This is a useful way to obtain out-of-sample predictions.

{phang}
{opt ci} calculates a confidence interval for the requested statistic and
stores the lower and upper limits in {it:newvar}{cmd:_lci} and
{it:newvar}{cmd:_uci}, respectively.  The delta method is used in all
calculations using {cmd:predictnl}.

{phang}
{opt timevar(varname)} defines the variable used as time in the predictions.
This is useful, for example, for large datasets where, for plotting purposes,
predictions are needed only for 200 observations.  Use this option with care
because predictions may be made at whatever covariate values are in the first
200 rows of data.  This can be avoided by using the {opt at()} option to
define the covariate patterns for which you require the predictions.  The
default is {cmd:timevar(_t)}.

{phang}
{opt level(#)} specifies the confidence level, as a percentage, for confidence
intervals.  The default is {cmd:level(95)} or as set by {helpb set level}.


{title:Example}

{pstd}
This is a simulated example dataset representing a multicenter trial scenario,
with 100 centers and each center recruiting 60 patients, resulting in 6,000
observations.  Two covariates were collected: a binary covariate {bf:x1}
(coded 0/1) and a continuous covariate {bf:x2} within the range [0,1].{p_end}

{pstd}Load dataset:{p_end}
{phang2}{bf:{stata "use http://fmwww.bc.edu/repec/bocode/s/stmixed_example1":. use http://fmwww.bc.edu/repec/bocode/s/stmixed_example1}}{p_end}

{pstd}{cmd:stset} the data:{p_end}
{phang2}{bf:{stata "stset stime, failure(event=1)":. stset stime, failure(event=1)}}{p_end}

{pstd}
Fit a mixed-effects survival model with a random intercept and Weibull
distribution, adjusting for fixed effects of {bf:x1} and {bf:x2}:{p_end}
{phang2}{bf:{stata "stmixed x1 x2 || centre:, distribution(weibull)":. stmixed x1 x2 || centre:, distribution(weibull)}}{p_end}

{pstd}
Predict survival based only on the fixed effects:{p_end}
{phang2}
{bf:{stata "predict s1, survival":. predict s1, survival}}{p_end}


{title:Author}

{pstd}Michael J. Crowther{p_end}
{pstd}Biostatistics Research Group{p_end}
{pstd}Department of Health Sciences{p_end}
{pstd}University of Leicester{p_end}
{pstd}Leicester, UK{p_end}
{pstd}{browse "mailto:michael.crowther@le.ac.uk":michael.crowther@le.ac.uk}{p_end}

{phang}
Please report any errors you may find.{p_end}


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 19, number 4: {browse "https://doi.org/10.1177/1536867X19893639":st0584}{p_end}

{p 7 14 2}
Help:  {helpb stmixed}, {help merlin postestimation}, {helpb stpm2} (if installed), {manhelp streg ST}{p_end}

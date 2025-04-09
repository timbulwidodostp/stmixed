{smcl}
{* *! version 1.0.0 2012}{...}
{viewerjumpto "Title" "stmixed##title"}{...}
{viewerjumpto "Syntax" "stmixed##syntax"}{...}
{viewerjumpto "Description" "stmixed##description"}{...}
{viewerjumpto "Options" "stmixed##options"}{...}
{viewerjumpto "Examples" "stmixed##examples"}{...}
{viewerjumpto "Author" "stmixed##author"}{...}
{viewerjumpto "Also see" "stmixed##alsosee"}{...}
{cmd:help stmixed}{right: ({browse "https://doi.org/10.1177/1536867X19893639":SJ19-4: st0584})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 16 17 2}{...}
{synopt :{cmd:stmixed} {hline 2}}Multilevel mixed-effects survival analysis{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 18 2}
{cmd:stmixed} [{varlist}] {ifin} {cmd:||} {it:re_equation} [{cmd:||} {it:re_equation} ...]
[{cmd:,} {it:{help stmixed##options_table:options}}]

{p 4 4 2}
and the syntax of {it:re_equation} for random coefficients and a random intercept is

{p 12 24 2}
{it:{help varname:levelvar}}{cmd::} [{varlist}]
[{cmd:,} {opt noc:onstant}]

{p 4 4 2}
{it:levelvar} is a variable identifying the group structure for the random
effects at that level.{p_end}


{synoptset 35 tabbed}{...}
{marker options_table}{...}
{synopthdr :options}
{synoptline}
{syntab:Model}
{synopt :{opt noc:onstant}}suppress constant term from the fixed-effects equation{p_end}
{synopt:{cmdab:d:istribution(}{cmdab:e:xponential)}}exponential survival distribution{p_end}
{synopt:{cmdab:d:istribution(}{cmdab:gom:pertz)}}Gompertz survival distribution{p_end}
{synopt:{cmdab:d:istribution(}{cmdab:w:eibull)}}Weibull survival distribution{p_end}
{synopt:{cmdab:d:istribution(}{cmdab:rp)}}Royston-Parmar survival model{p_end}
{synopt:{cmdab:d:istribution(}{cmdab:rcs)}}restricted cubic splines on the
log-hazard scale{p_end}
{synopt:{cmdab:d:istribution(}{cmd:user,} {it:{help stmixed##user:user_functions}}{cmd:)}}user-defined survival model{p_end}
{synopt:{opt df(#)}}degrees of freedom for baseline hazard function with
{bf:distribution(rp)} or {bf:distribution(rcs)}{p_end}
{synopt:{opt knots(numlist)}}knot locations for baseline hazard with
{bf:distribution(rp)} or {bf:distribution(rcs)}{p_end}
{synopt:{opt tvc(varlist)}}{it:varlist} of time-dependent effects{p_end}
{synopt:{opt dft:vc(numlist)}}degrees of freedom for each time-dependent
effect in {cmd:tvc()}, in matching order{p_end}
{synopt:{opt knotst:vc(numlist)}}knot locations for time-dependent effects'
spline functions{p_end}
{synopt :{opt bh:azard(varname)}}expected mortality rate; invokes a relative survival model{p_end}
{synopt :{opth cov:ariance(stmixed##vartype:vartype)}}variance-covariance structure of the random effects at each level{p_end}

{syntab:Integration}
{synopt :{cmdab:intm:ethod(}{it:{help stmixed##intmethod:intmethod}}{cmd:)}}integration method{p_end}
{synopt :{opt intp:oints(#)}}set the number of integration points{p_end}
{synopt :{cmdab:adapt:opts(}{it:{help stmixed##adaptopts:adaptopts}}{cmd:)}}options for adaptive quadrature{p_end}

{syntab:Estimation}
{synopt :{cmd:from(}{it:{help merlin_estimation##matname:matname}}{cmd:)}}specify starting values{p_end}
{synopt :{cmdab:restartval:ues(}{it:{help merlin_estimation##svlist:sv_list}}{cmd:)}}specify starting values for
specific random-effects variances{p_end}
{synopt :{opt apstartv:alues(#)}}specify the starting value for all ancillary parameters{p_end}
{synopt :{cmd:zeros}}specify all initial values set to 0{p_end}
{synopt:{it:{help stmixed##maximize_options:maximize_options}}}control maximization process; seldom used{p_end}

{syntab:Reporting}
{synopt:{opt showmerlin}}display {helpb merlin} syntax used to fit the
model{p_end}
{synopt:{opt l:evel(#)}}set confidence level; default is
{cmd:level(95)}{p_end}
{synoptline}


{synoptset 29}{...}
{marker user}{...}
{synopthdr:user_functions}
{synoptline}
{synopt :{opt llfunction(fnc_name)}}Mata function name that returns the observation-level log likelihood contribution{p_end}
{synopt :{opt loghfunction(fnc_name)}}Mata function name that returns the observation-level log hazard function{p_end}
{synopt :{opt hfunction(fnc_name)}}Mata function name that returns the observation-level hazard function{p_end}
{synopt :{opt chfunction(fnc_name)}}Mata function name that returns the observation-level cumulative hazard function{p_end}
{synopt :{opt nap(#)}}number of ancillary parameters to estimate{p_end}
{synoptline}
{p2colreset}{...}
{pstd}See {helpb merlin_user:merlin user-defined functions}.


{synoptset 20}{...}
{marker vartype}{...}
{synopthdr :vartype}
{synoptline}
{synopt :{opt diag:onal}}one variance parameter per random effect, 
all covariances 0; the default unless a factor variable is specified{p_end}
{synopt :{opt ex:changeable}}equal variances for random effects and one common pairwise covariance{p_end}
{synopt :{opt id:entity}}equal variances for random effects, all 
covariances 0; the default for factor variables{p_end}
{synopt :{opt un:structured}}all variances and covariances distinctly 
estimated{p_end}
{synoptline}
{p2colreset}{...}


{synoptset 20}{...}
{marker intmethod}{...}
{synopthdr :intmethod}
{synoptline}
{synopt :{opt mv:aghermite}}mean-variance adaptive Gauss-Hermite quadrature;
the default{p_end}
{synopt :{opt gh:ermite}}nonadaptive Gauss-Hermite quadrature{p_end}
{synopt :{opt mc:arlo}}Monte Carlo integration using Halton sequences or antithetic sampling{p_end}
{synoptline}
{p2colreset}{...}


{synoptset 20}{...}
{marker adaptopts}{...}
{synopthdr :adaptopts}
{synoptline}
{synopt: [{cmd:{ul:no}}]{opt lo:g}}whether to display the iteration log
for each numerical integral calculation{p_end}
{synopt: {opt iterate(#)}}number of iterations to update integration points;
default is {cmd:iterate(1001)}{p_end}
{synoptline}
{p2colreset}{...}

{p 4 6 2}
You must {cmd:stset} your data before using {cmd:stmixed}; see {manhelp stset ST}.{p_end}
{p 4 6 2}
Weights are not currently supported.{p_end}
{p 4 6 2}
Factor variables are not currently supported.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:stmixed} fits multilevel survival models, including standard parametric
distributions and flexible spline-based approaches (such as Royston-Parmar and
the log-hazard equivalent), and allows users to specify their own hazard
function.  Simple or complex time-dependent effects can be included, with the
addition of expected mortality for a relative survival model and allowing for
left-truncation and delayed entry.  t-distributed random effects can also be
used instead of the default Gaussian.

{pstd}
See {help stmixed postestimation} for a variety of predictions and residuals
that can be calculated following a model fit.

{phang}
{cmd:stmixed} is part of the {helpb merlin} family.


{marker options}{...}
{title:Options}

{dlgtab:Model}

{phang}
{opt noconstant} suppresses the constant (intercept) term and may be specified
for the fixed-effects equation and random-effects equations.

{phang}
{opt distribution(string)} specifies the survival distribution.

{phang2}
{cmd:distribution(exponential)} fits an exponential survival model.

{phang2}
{cmd:distribution(weibull)} fits a Weibull survival model.

{phang2}
{cmd:distribution(gompertz)} fits a Gompertz survival model.

{phang2}
{cmd:distribution(rp)} fits a Royston-Parmar survival model.  This is a highly
flexible, fully parametric alternative to the Cox model, modeled on the log
cumulative-hazard scale using restricted cubic splines.

{phang2}
{cmd:distribution(rcs)} fits a log-hazard scale flexible parametric survival
model.  This is a highly flexible, fully parametric alternative to the Cox
model, modeled on the log-hazard scale using restricted cubic splines.

{phang2}
{cmd:distribution(user,} {it:user_functions}{cmd:)} specifies a user-defined
survival model; see {it:{help stmixed##user:user_functions}} above and
{helpb merlin_user:merlin} user-defined functions.

{phang}
{opt df(#)} specifies the degrees of freedom for the restricted cubic spline
function used for the baseline function under an {cmd:rp} or {cmd:rcs}
survival model.  {it:#} must be between 1 and 10, but a value between 1 and 5
is usually sufficient.  The {cmd:knots()} option is not applicable if
{cmd:df()} is specified.  The knots are placed at the following centiles of
the distribution of the uncensored log survival times:

        {hline 60}
        df  knots        centile positions
        {hline 60}
         1    0    (no knots)
         2    1    50
         3    2    33 67
         4    3    25 50 75
         5    4    20 40 60 80
         6    5    17 33 50 67 83
         7    6    14 29 43 57 71 86
         8    7    12.5 25 37.5 50 62.5 75 87.5
         9    8    11.1 22.2 33.3 44.4 55.6 66.7 77.8 88.9
        10    9    10 20 30 40 50 60 70 80 90     
        {hline 60}
        
{pmore}
Note that these are interior knots, and there are also boundary knots placed
at the minimum and maximum of the distribution of uncensored survival times.

{phang}
{opt knots(numlist)} specifies knot locations for the baseline distribution
function under an {cmd:rp} or {cmd:rcs} survival model as opposed to the
default locations set by {cmd:df()}.  The locations of the knots are on the
standard time scale.  However, the scale used by the restricted cubic spline
function is always log time.  Default knot positions are determined by the
{cmd:df()} option.

{phang}
{opt tvc(varlist)} gives the name of the variables that have time-varying
coefficients.  Time-dependent effects are fit using restricted cubic splines.
The degrees of freedom is specified using the {opt dftvc()} option.

{phang}
{opt dftvc(numlist)} gives the degrees of freedom for each time-dependent
effect in {cmd:tvc()}, in matching order.

{phang}
{opt knotstvc(numlist)} defines {it:numlist} as the location of the interior
knots for time-dependent effects.

{phang}
{opt bhazard(varname)} specifies the variable that contains the expected
mortality rate, which invokes a relative survival model.

{phang}
{opt covariance(vartype)} specifies the structure of the covariance matrix for
the random effects.  {it:vartype} may be {cmd:diagonal}, {cmd:exchangeable},
{cmd:identity}, or {cmd:unstructured}.
The default is {cmd:covariance(diagonal)}.

{phang2}
{cmd:covariance(diagonal)} allows a distinct variance for each random effect
within a random-effects equation and assumes that all covariances are 0.

{phang2}
{cmd:covariance(exchangeable)} allows common variances and one common pairwise
covariance.

{phang2}
{cmd:covariance(identity)} is short for "multiple of the identity"; that is,
all variances are equal and all covariances are 0.

{phang2}
{cmd:covariance(unstructured)} allows for all variances and covariances to be
distinct.  If an equation consists of p random-effects terms, the
{cmd:unstructured} covariance matrix will have p(p+1)/2 unique parameters.


{dlgtab:Integration}

{pstd}
{opt intmethod(intmethod)}, {opt intpoints(#)}, and {opt adaptopts(adaptopts)}
affect how integration for the latent variables is numerically
calculated.{p_end}

{phang}
{opt intmethod(intmethod)} specifies the method and defaults to
{cmd:intmethod(mvaghermite)}.  The current implementation uses mean-variance
adaptive quadrature at the highest level and nonadaptive quadrature at lower
levels.  Sometimes, it is useful to fall back on the less computationally
intensive and less accurate {cmd:intmethod(ghermite)} and then perhaps use one
of the other more accurate methods.  {cmd:intmethod(mcarlo)} tells
{cmd:stmixed} to use Monte Carlo integration, which uses either Halton
sequences with normally distributed random effects or antithetic random draws
with t-distributed random effects.

{phang}
{opt intpoints(#)} specifies the number of integration points to use.  This
method defaults to {cmd:intpoints(7)} with {cmd:intmethod(mvaghermite)} and
{cmd:intmethod(ghermite)}; it defaults to {cmd:intpoints(150)} with
{cmd:intmethod(mcarlo)}.  Increasing the number increases accuracy but also
increases computational time.  Computational time is roughly proportional to
the number specified.

{phang}
{opt adaptopts(adaptopts)} affects the adaptive part of adaptive quadrature
(another term for numerical integration) and thus is relevant only for
{cmd:intmethod(mvaghermite)}.  The default is
{cmd:adaptopts(nolog iterate(1001))}.  {it:adaptopts} are the following:

{phang2}
[{cmd:no}]{cmd:log} specifies whether iteration logs are shown each time a
numerical integral is calculated.

{phang2}
{opt iterate(#)} specifies the number of iterations to update the integration
points, which will include updating prior to iteration {cmd:0} in the
maximization process.


{dlgtab:Estimation}

{phang}
{opt from(matname)} allows you to specify starting values.

{phang}
{opt restartvalues(sv_list)} allows you to specify starting values for
specific random-effects variances.  See 
{helpb merlin_estimation:merlin} estimation for further details.

{phang}
{opt apstartvalues(#)} allows you to specify a starting value for all
ancillary parameters, that is, those defined using the {cmd:nap()} option.
See {helpb merlin estimation} for further details about the
{cmd:nap()} option.

{phang}
{opt zeros} tells {cmd:stmixed} to use 0 for all parameters' starting values
rather than fit the fixed-effects model.  Both {cmd:restartvalues()} and
{cmd:apstartvalues()} may be used with {cmd:zeros}.

{marker maximize_options}{...}
{phang}
{it:maximize_options}: {opt dif:ficult}, {opt tech:nique(algorithm_spec)}, 
{opt iter:ate(#)}, [{cmdab:no:}]{opt lo:g}, {opt tr:ace}, {opt grad:ient}, 
{opt showstep}, {opt hess:ian}, {opt shownr:tolerance}, {opt tol:erance(#)}, 
{opt ltol:erance(#)} {opt gtol:erance(#)}, {opt nrtol:erance(#)}, 
{opt nonrtol:erance}, {opt from(init_specs)}; see {manhelp Maximize R}.  These 
options are seldom used, but the {opt difficult} option may be useful if there
are convergence problems.


{dlgtab:Reporting}

{phang}
{opt showmerlin} displays the {cmd:merlin} syntax used to fit the model.

{phang}
{opt level(#)} specifies the confidence level, as a percentage, for confidence
intervals.  The default is {cmd:level(95)} or as set by {helpb set level}.


{marker examples}{...}
{title:Examples}
     
    {title:Example 1}

{pstd}
This is a simulated example dataset representing a multicenter trial scenario,
with 100 centers and each center recruiting 60 patients, resulting in 6,000
observations.  Two covariates were collected: a binary covariate {bf:x1}
(coded 0/1) and a continuous covariate {bf:x2} within the range [0,1].{p_end}

{pstd}Load dataset:{p_end}
{phang2}
{bf:{stata "use http://fmwww.bc.edu/repec/bocode/s/stmixed_example1":. use http://fmwww.bc.edu/repec/bocode/s/stmixed_example1}}{p_end}

{pstd}
{cmd:stset} the data:{p_end}
{phang2}
{bf:{stata "stset stime, failure(event=1)":. stset stime, failure(event=1)}}{p_end}

{pstd}
Fit a mixed-effects survival model, with a random intercept and Weibull
distribution, adjusting for fixed effects of {bf:x1} and {bf:x2}:{p_end}
{phang2}
{bf:{stata "stmixed x1 x2 || centre:, distribution(weibull)":. stmixed x1 x2 || centre:, distribution(weibull)}}{p_end}


    {title:Example 2}

{pstd}
This is a simulated example dataset representing an individual patient data
meta-analysis, with 15 trials and each trial recruiting 200 patients,
resulting in 3,000 observations.  We are interested in the pooled treatment
effect, accounting for heterogeneity between trials.{p_end}

{pstd}
Load dataset:{p_end}
{phang2}
{bf:{stata "use http://fmwww.bc.edu/repec/bocode/s/stmixed_example2":. use http://fmwww.bc.edu/repec/bocode/s/stmixed_example2}}{p_end}

{pstd}
{cmd:stset} the data:{p_end}
{phang2}
{bf:{stata "stset stime, failure(event=1)":. stset stime, failure(event=1)}}{p_end}

{pstd}Create dummy variables for trial membership:{p_end}
{phang2}
{bf:{stata "tabulate trial, generate(trialvar)":. tabulate trial, generate(trialvar)}}{p_end}

{pstd}
Fit a flexible parametric model with 3 degrees of freedom for the baseline,
proportional trial effects with trial = 1 as the reference, and a random
treatment effect:{p_end}
{phang2}
{bf:{stata "stmixed treat trialvar2-trialvar15 || trial: treat, noconstant distribution(rp) df(3)":. stmixed treat trialvar2-trialvar15 || trial: treat, noconstant distribution(rp) df(3)}}{p_end}


{marker author}{...}
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
Help:  {help stmixed postestimation}, {helpb merlin}, {helpb stpm2},
{helpb strcs} (if installed), {manhelp streg ST}{p_end}

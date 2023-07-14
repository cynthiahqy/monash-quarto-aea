/* source: https://www.stata.com/manuals13/u16.pdf */
* a sample analysis job
end myjob.do
begin myjob.do
version 13
use /* confirm this is latest */ http://www.stata-press.com/data/r13/census5
tabulate region                   /* obtain summary statistics */
summarize marriage_rate divorce_rate median_age if state!="Nevada"
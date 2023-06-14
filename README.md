![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/f1b77636-528f-495e-8d63-4b2bc1d086f9)

# Analysing the 2022 Australian federal election result
###### KEYWORDS: linear regression; relational algebra; psephology; r

After three terms in office, Australia's conservative Liberal-National Coalition  (LNP) suffered a humiliating defeat at the May 2022 poll, and one that may be terminal for the major Coalition partner.
Yet the return to office of Labor (ALP) was not on the back of uniform swings around the country.

This analysis - carried out as part of a report for a major national think-tank - looks at correlating factors that explain why Labor won and lost votes where it did.

The results are intriguing.

When looking at the swing for/against the LNP, markers of disadvantage were correlated with a move to the right; those of advantage with a left-wards shift.

It is too early to say if this is part of a flipping of the political poles or simply a return to the centre under a centre-left ALP, but it does run counter to long-established narratives of which social groups support which parties.   

### Preparing the data

This voting system remains the dominant and most effective measure for analyses like this. 

It serves as a legitimate proxy for left/right splits, even in the face of the increased diversity of first-preference voting and where a non-major party candidate has won. 

Therefore, it is the primary electoral metric used in this analysis. 

Swings (based on the TPP vote) are analysed against a range of social and other factors in an effort to try to determine the reasons for the non-uniformity of swings. 

This data was compiled from Census data found on the Australian Bureau of Statistics Census website.

The site provides detailed demographic data on a seat-by-seat basis, and a script was created in Python to scrape the data for each  of these. 

This was compiled into a wide table, with each seat given a row. 

Seat-by-seat data is also available for state electorates.

Seat-by-seat social-geographic and demographic data was also found in an Excel spreadsheet on the ABS site.

This data divides the country in geographic nuggets containing a few hundred people (such as local neighbourhoods) and allocates each a socio-economic ranking (based on wages, ages, working status and the like). 

These rankings go from 1 to 10, with the poorest/most disadvantaged at the bottom of the scale. The number of nuggets of each ranking type contained within a seat is then tallied together.

This data gives the research extra depth, allowing for direct socio analysis.

Using relational algebra, all data sets were then outer-joined to create a large and wide data frame.  

Given the well-compiled state of the various data sets, only basic cleaning was required. For example, where a column was missing values, these were removed.

New electorates were not included either, given the lack of previous data. 

To assist with regression analysis, dummy variables were added for categorical columns.

The final data frame has 149 rows and 286 columns.

### Exploratory data analysis

One of the most notable trends from the TPP data is that most seats that changed hands (TPP) were outside of the country's two biggest states, New South Wales and Victoria.

A number of seats in those two states swung to the right: this occurred much less frequently in the rest of the country. 

However, because these swings happened in some of Labor's safest seats, the party did not lose these seats, and many of them remain safe for the party.

The swings to the left were also generally stronger in the smaller states and territories.

![Screenshot 2023-06-08 114745](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/40642ea4-32d3-4a53-a9d1-faa14177e242)

The demographic data also gives a snapshot of the average Australian voter that might have been obvious to anyone following politics in this country in recent years. 

On the hustings, tradies are lionised and inner-city residents are derided as ‘latte sippers’. Yet it is professionals who are the dominant voting block, and it is in the inner city where voters swung hardest to Labor, indictating they are group not to be ignored, as the heatmap below shows. 

![AusVotes_4](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/54c9eb40-51a6-4f28-9965-2b37aa5908e4)

The data also shows the mistake politicians make in treating young people as an afterthought in political discussion. Think, for example, of how little attention is taken to addressing the housing crisis that's meaning younger generations can't buy a house while baby boomers stock on multiple properties. In more than half of all electorates, people under 40 are the dominant voting block, representing a powerful political group.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/231a073d-0012-4e34-a68c-580936682277)

From the socio-economic data, the advantage of playing to the middle-class of Australia is clear. While boxplots reveal a disparity in the frequency of high and low socio-economic neighbourhoods between electorates, they also reveal the ubiquity of the middle class, which can be found in pretty consistent numbers in nearly every seat.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/0cdb99f8-31df-4b00-8743-fc83f2d87927)


### Correlations and social status

So what - if any - relationships are there between the swing in each electorate and its corresponding demographic/socio-geographic data? 

Of the 200 variables  from the Census data to be explored, 1 in 6 displayed some kind of relationship. 

But one really stood out: the swing’s strongest relationship by far was with a seat’s level of voters who finished school at Year 9.  This correlation rate was 0.632.

It highlighted a larger trend: the more disadvantaged a seat was, the more likely it was to swing to the right.

Be it poor health, a broken family, or unemployment, every factor correlated with a swing to the right was also a marker of disadvantage. 

At the other end of the spectrum, swings to Labor were correlated to markers of advantage, even if some of these were not immediately obvious. 

The strongest of these markers, at 0.503, was having one parent, the mother, born overseas. When that parent was the father, the correlation was 0.39. 

Given that migrant groups are often socially and economically disadvantaged, these factors may look out of place beside the other advantage-marking factors correlating to a Labor swing, such as high income, access to public transport and being employed in a professional occupation. 

However, their correlations to socio-economic group status shows the opposite. Having one - and just one - of your parents born overseas is correlated to having higher socio-economic status.

(Correlations for having both parents born overseas also pointed in this direction, while having two Australian-born parents went the other way. However, these correlations were too weak to put any emphasis on.)

This is even more clearly demonstrated when looking simply at the relationship between a seat's socio-economic status and its swing: ordered numerically by socio-economic category, it creates an almost prefect spectrum. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/78620601-6769-42fb-affe-81f392230d5b)

This is mirrored when looking at types of work. A higher level of professional and managerial classes in a seat correlated to wings away from the LNP. The opposite was true for seats with higher levels of manual and technical workers.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/fe457206-1b52-4d05-8a3c-91bf526e0a13)

This mirroring was also seen when looking at state and seat types. Perth's outer suburbs are as closely corralted to swings against the LNP as Melbourne's are for swings towards it. Likewise with the states' rural areas. In fact, at 0.54, a seat being in WA was the strongest correlation there was to a swing to the ALP. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/aa2f6256-4bbd-4113-b3c9-3419f1b6ed46)

### Predicting the Victorian electorate

The next step is to take weights from this research and see if it is predictive of the result for the Victorian state election which cam just a few months later.

                                                                             c          r       slope         pval        rsq
                                  Highest.educational.level..Year.9.or.below..  0.6320066  1.08363681 5.455635e-18 0.39943234
                                                                            WA -0.5423790 -7.61886567 9.031010e-13 0.29417500
                      Country.of.birth.of.parents..Mother.only.born.overseas.. -0.5032340 -1.79065918 6.111931e-11 0.25324444
                                                                   poorSA1s_pc  0.5002700  0.10527728 8.232090e-11 0.25027003
                    Unpaid.domestic.work..number.of.hours..Less.than.5.hours.. -0.4667638 -0.84450991 1.970629e-09 0.21786848
                                       Family.composition..One.parent.family..  0.4563208  0.73913201 4.953333e-09 0.20822863
                      Participation.in.the.labour.force..In.the.labour.force.. -0.4523052 -0.33978628 7.002776e-09 0.20458004
                                                                 Decile.8.SA1s -0.4521301 -0.10167682 7.108606e-09 0.20442164
                                Type.of.long.term.health.condition..Diabetes..  0.4517898  1.85048144 7.318675e-09 0.20411402
                                                                      richSA1s -0.4506907 -0.02241145 8.038734e-09 0.20312207

When combined, the following factors produced an r.squared value of over 0.41:
- 'Highest.educational.level..Year.9.or.below..';
- 'Country.of.birth.of.parents..Mother.only.born.overseas..'
- 'Family.composition..One.parent.family..'
- 'Unpaid.domestic.work..number.of.hours..Less.than.5.hours..'

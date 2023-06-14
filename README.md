![Rplot](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/cf101368-f74d-46ac-802e-484fb0bc88cf)

# Analysing the 2022 Australian federal election result
###### KEYWORDS: linear regression; relational algebra; psephology; r

After three terms in office, Australia's conservative Liberal-National Coalition suffered a humiliating defeat at the May 2022 poll, and one that may yet be terminal for the major Coalition partner.

Yet Labor was returned to the office was not on the back of uniform swings around the country. 

This analysis looks at correlating factors that demonstrate where it won and lost votes. 

Where it lost votes is particularly intriguing, as this not only went against the trend but could potentially reveal something deeper: such as the flipping of the political poles, or a reaction to the pandemic.  

The two-party-prefered voting system remains the dominant and most effective measure for analyses like this, even in the face of the increased diversity of first-preference voting in 2022, and is the primary metric on which this analysis is carried out.

This serves as a legitimate proxy for left/right splits, even where a non-major party candidate has won.

Swings per seat are analyses against a range of social and other factors in an effort to try to determine why there was not a national trend. 

This research was undertaken during the research of a major report into the election for a high-profile political think-tank and campaign group.


### Preparing the data
This research relied four key datasets: the seat-by-seat results of the 2022 election and its 2019 predecessor; plus seat-by-seat social-geographic and demographic data (outling wages, ages, working status and the like) from the ABS.

Data was cleaned and updating with minor analyses before merging all datasets into one. 

To assist with regression analysis, dummy variables were added for categorical columns.

### Exploratory data analysis
One of the most notable trends from the TPP data is that most seats that changed hands (TPP) were outside of the country's two biggest states, New South Wales and Victoria. 

While a number of seats in those two states swung to the right, barely any did in the rest of the country. However, because these swings happened in some of Labor's safest seats, it did not see them lose any seats, and most remain safe for them.

![Screenshot 2023-06-08 114745](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/40642ea4-32d3-4a53-a9d1-faa14177e242)

The heatmap at the top of this page highlights this trend in a different way. It shows that richer/more advantaged electorates - traditionally Coalition territory - moved to the left, while poorer/less advantaged ones moved right. Future results will show if this was part of a switching of the political poles or simply a case of seats returning to the mean as a result of the appeal of centre-left/centrist party.

While tradies are a political obsession during campaigns, the demographic data shows it is professionals that are the dominant group. 
![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/3e9533b3-6333-47bc-a1ca-5d496162978c)

They are also easily the most dominant group in the seat type that switched hardest to the left: inner metropolitan seats.
![AusVotes_4](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/54c9eb40-51a6-4f28-9965-2b37aa5908e4)

Likewise, boxplots for ABS SA1 social-geographic data shows how distinctly sperated advantaged and disadvantaged voting cohorts are, while also revealing the ubiquity of the middle class.
![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/0cdb99f8-31df-4b00-8743-fc83f2d87927)

The data also shows that while young people are something of an afterthought in political discussion (think of how little attention is taken to addressing the housing crisis, for example). In roughly three of every electorates, people under 35 make up the dominant voting block. This is a situation that is ripe for a political party to make more of.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/dae595ac-2cd8-4f29-800e-35b03704133f)

### Correlations and social status

Further divergence can be found when looking at relationship/correlation between the 2022 swing and various available demographic factors. 

The next step is to check the 250 or so available variables (inc. dummies) for a relationship to the swing in the 2022 election.

The strongest relationship by far was with the level of voters who finished school at Year 9. The higher the school early completition rate, the more likely it was associated with a swing TO the LNP. This correlation rate was 0.632.

At the other end of the spectrum, a seat's level of voters whose mother was born overseas had a -0.503 correlation to the swing.

Around 1 in 8 variables produced a noteworthy correlation, and while most were at low level, they demonstrated that the swing for/against the government was related to levels of advantage or disadvantage. 

![Rplot](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/72aab128-18f0-40a7-861c-b6782039c18b)

Indeed, while migration is often assuemed to be a marker of disadvantage, the corraltions show that having a parent born overseas is actually correlated to higher social status. 

By comparision, coming from a single parent household has the opposite effect. 

A seat's level of unemployment and poor health was correlated to both social disadvantage (not surprising) AND  to swings to the conservatives (quite surprising).

Variables that correlated to advanatage - such as high income, employed in professional work and public transport usage - were related to swings towards Labor. 





Rarely is this as strong as when looking at relative social advantage. Ordered numerically by socio-economic category, it creates an almost prefect spectrum. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/78620601-6769-42fb-affe-81f392230d5b)

This is mirrored when looking at types of work. A higher level of professional and managerial classes in a seat correlated to wings away from the LNP. The opposite was true for seats with higher levels of manual and technical workers.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/fe457206-1b52-4d05-8a3c-91bf526e0a13)

This mirroring was also seen when looking at state and seat types. Perth's outer suburbs are as closely corralted to swings against the LNP as Melbourne's are for swings towards it. Likewise with the states' rural areas.
![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/aa2f6256-4bbd-4113-b3c9-3419f1b6ed46)

As already mentioned, though, the big swings to the LNP came in the safest of ALP seats, leading to not electoral damage for the new government (at least in the short-term). These were also areas hit hardest by COVID lockdowns.
![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/3d222e79-fa1e-4bc6-ac89-76dcafbd193a)


Supporting what we have already noted, the strongest correltions, in either direction, were observed in areas reflective of advantage and disadvantage: engagement with work or study; single-parent families; and territary level education. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/fa12f855-2d0a-49e5-b977-dc326633354d)

Those that are not engaged includes groups with very different circumstances - retirees and long-term unemployed. Cross-referencing the correlations however shows that it is the latter that is the dominant group. For example, while age correlates very highly with outright home ownership, outright home ownership correlates to only a moderate degree with not being engaged. There is also a negative correlation with education and income.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/00b258df-917c-46f2-a4f2-4107b85c6604)


The dominance of younger voters across most electorates is even more noteworthy when looking correlations. There was a negative correlation between a seats percentage of younger voters and their swing to the LNP. Although mild, it was stronger than any correlation in the other direction for older age groups.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/09fbb33b-eb3e-40e6-ab82-0609ad0c34a4)

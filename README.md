![AusVotes2022_tpp_vs_sa1](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/0bbc1110-0973-4f6f-840b-b82f7c7adc9a)

# Analysing the 2022 Australian federal election result
###### KEYWORDS: linear regression; relational algebra; psephology

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

### Correlations


Further divergence can be found when looking at relationship/correlation between the 2022 swing and various available demographic factors. 

Rarely is this as strong as when looking at relative social advantage. Ordered numerically by category, it creates an almost prefect spectrum. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/78620601-6769-42fb-affe-81f392230d5b)

This is mirrored when looking at types of work. A higher level of professional and managerial classes in a seat correlated to wings away from the LNP. The opposite was true for seats with higher levels of manual and technical workers.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/fe457206-1b52-4d05-8a3c-91bf526e0a13)

This mirroring was also seen when looking at state and seat types. Perth's outer suburbs are as closely corralted to swings against the LNP as Melbourne's are for swings towards it. Likewise with the states' rural areas.
![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/aa2f6256-4bbd-4113-b3c9-3419f1b6ed46)





The dominance of younger voters across most electorates is even more noteworthy when looking correlations. There was a negative correlation between a seats percentage of younger voters and their swing to the LNP. Although mild, it was stronger than any correlation in the other direction for older age groups.

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/ef05f3e0-3c59-4e68-b796-e026bc200a56)




Wealth/advantage was strongly correlated to electorate swings, as already noted, with richer/poorer seats both moving towards the centre. 

![image](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/e552427c-2ff4-4ca0-95e4-72ba3beee46d)

![AusVotes22_19](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/53699e74-857b-441e-a622-14b09cac1365)

This was also reflected in other corraltions: household earnings - and mortgage/rent costs - were negatively correlated with swings to the LNP.

A seat's level of professional workers was as correlated to a leftwards-shift as its percentage of labourers was correlated to a rightsward shift. 

Similarly mirroring was aboserved with inner metropolitian and rural seats.

There was also a strong correlation between a seat's level of single-parent families and a move to the right, although this cohort is relatively small in number.
![AusVotes22_18](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/d8bf37f2-96ad-43ad-8a07-49002a9a541d)


Lastly, it is worth looking at the tradie vote when compared to the laboourer vote. While both postively correlated to LNP swings, the correlation was weaker with tradies. Is this explained by many tradies being small business people with higher wealth? 
![AusVotes22_13](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/cf147a16-e134-466f-912f-61f3aecd7f99)





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
One of the most notable trends from the TPP data is that most seats that changes hands (TPP) were outside of the country's two biggest states, and the within New South Wales and Victoria, the biggest swings against the ALP - which bucked the national trend - came in its safest seats.  
![AusVotes22_7](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/25e48ac8-ff82-4f80-ba61-c471b83e44db)

The heatmap at the top of this page highlights this trend: richer voters moved left, poorer voters moved right. While both moved towards the centre, future results will show if its part of a switching of the political poles.

While tradies are a political obsession during campaigns, the demographic data shows it is professionals that are the dominant group. 
![AusVotes22_8](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/c1680af8-b21a-422c-9486-fa2e405cd764)

They are also easily the most dominant group in the seat type that switched hardest to the left: inner metropolitan seats.
![AusVotes_4](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/54c9eb40-51a6-4f28-9965-2b37aa5908e4)

Likewise, boxplots for ABS SA1 social-geographic data shows how distinctly sperated advantaged and disadvantaged voting cohorts are, while also revealing the ubiquity of the middle class.
![AusVotes22_9](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/5926a4d6-087b-4885-b1da-1ebbd9624646)

### Correlations

Wealth/advantage was strongly correlated to electorate swings, as already noted, with richer/poorer seats both moving towards the centre. 
![AusVotes22_10](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/36310184-fbae-4134-b2d7-cccd1a2aa357)

This was also reflected in other corraltions: household earnings - and mortgage/rent costs - were negatively correlated with swings to the LNP.

A seat's level of professional workers was as correlated to a leftwards-shift as its percentage of labourers was correlated to a rightsward shift. 

Similarly mirroring was aboserved with inner metropolitian and rural seats.

There was also a strong correlation between a seat's level of single-parent families and a move to the right, although this cohort is relatively small in number.

![AusVotes22_11](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/fdf80779-4f74-4244-a608-085ab37fe090)
![AusVotes22_12](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/d80a8011-8a1b-40bb-b996-110e642dbc47)

Lastly, it is worth looking at the tradie vote when compared to the laboourer vote. While both postively correlated to LNP swings, the correlation was weaker with tradies. Is this explained by many tradies being small business people with higher wealth? 
![AusVotes22_13](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/cf147a16-e134-466f-912f-61f3aecd7f99)





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
![ausvotes22_2](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/6199c5a2-d861-4d9b-8121-e4a44f5d4539)

One of the most notable trends is that most seats that changes hands (TPP) were outside of the country's two biggest states. 
![AusVotes22_7](https://github.com/jckkrr/AusVotes2022_TPPanalysis/assets/69304112/25e48ac8-ff82-4f80-ba61-c471b83e44db)

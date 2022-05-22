<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
    <img src="./logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Cyclistic Bike Share Case Study</h3>

</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Data Preparation</a>
      <ul>
        <li><a href="#dataset">Dataset</a></li>
        <li><a href="#info">Information About The Dataset</a></li>
        <li><a href="#data">Data Organization and verification</a></li>
      </ul>
    </li>
    <li><a href="#process">Process</a></li>
    <li><a href="#analyze">Analyze and Share</a></li>
    <li><a href="#conclusion">Conclusion</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Designed marketing strategies aimed at converting casual riders into annual members.

### Built With

This section should list any major frameworks/libraries used to built your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

* [Tableau](https://public.tableau.com/en-us/s/)
* [R](https://www.rstudio.com/)


<!-- GETTING STARTED -->
## Getting Started

### ASK

Design marketing strategies aimed at converting casual riders into annual members.

### Dataset

Used Cyclistic’s historical trip data to analyze and identify trends.
* [Dataset](https://divvy-tripdata.s3.amazonaws.com/index.html)

<a id="info"></a>

### Information About The Dataset

The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate and will enable you to answer the business questions. The data has been made available by Motivate International Inc.

<a id="#data"></a>

### Data Organization and verification

Available to us are various CSV documents. Each document represents different quantitative data tracked by company. The data is considered long since each row is one time point per subject, so each subject will have data in multiple rows.Every user has a unique ID and different rows since data is tracked by day and time.

## Process 

To follow steps, I have provied both the R notebook.


<p align="right">(<a href="#top">back to top</a>)</p>

<a id="analyze"></a>

## Analyze and Share

* [Tableau Workbook](https://public.tableau.com/views/CycleRideCaseStudy/Cyclisticbike-shareanalysis?:language=en-US&:display_count=n&:origin=viz_share_link)

## Conclusion

1. The total trip duration for casual riders and annual members is affected by season. The temperature is very low during the winter season, fewer people are willing to go out and people who need to travel daily for work will choose to take other public transport, this had caused the total trip duration are the lowest among another season. 


2. The annual member display two peak period which is at 7 a.m and 5 p.m indicate they are most likely office workers. The casual rider peak period is 4 p.m and 5 p.m. The top 20 station visit by casual riders mostly are tourist locations, the casual riders most likely are a couple, students, retirees, tourists, and famil


3. Over the year, we see a significant divergence of total trip duration from May to September for two groups of users. This has shown their usage pattern significantly due to their preference and it is more clear when we look into total trip duration on every single hour within the day.


4. Based on the casual rider’s monthly total trips durations, the best odds to launch the new marketing campaign is between April to May. Also, consider different price strategies like seasonal passes to increase the conversion rate.


5. The best would be if the marketing team can run a survey to collect the data from current casual riders, understand what kind of features or benefits they look for when considering subscribe annual members.






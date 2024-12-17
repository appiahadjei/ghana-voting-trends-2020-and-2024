# Ghana regional voting trends- 2020 and 2024
Ghana Election Regional Voting Trends: 2020 vs. 2024
## Overview
This project visualizes regional voting trends for Ghana's two major political parties, the New Patriotic Party (NPP) and the National Democratic Congress (NDC), in the 2020 and 2024 elections. The analysis is based on election data extracted from the Electoral Commission of Ghana Form 12 of the Public Elections Regulations, 2020.
The aim is to highlight voting patterns across regions and provide a comparative analysis of the two elections, focusing on key regions and their contributions to the national results.
![2020 vs 2024 Regional Voting Trends for NPP and NDC](https://github.com/user-attachments/assets/d5837f80-dbc6-4670-bee5-aa94c04788a7)


## Objectives
- Visualize Regional Voting Trends: Compare NPP and NDC percentages for the 2020 and 2024 elections across Ghana's 16 administrative regions and the national average.
- Highlight Key Regions: Emphasize regions such as Ashanti, Volta, Greater Accra, and Northern, which play significant roles in determining national election outcomes.
- Foster Data Transparency: Leverage election data to promote evidence-based insights into regional voting behavior.
- Enable Collaboration: Share the code on GitHub to allow further contributions and refinement.


## Features
- Custom Colors: Highlights pivotal regions like Ashanti and Greater Accra with distinct colors for clarity.
- Dynamic Labels: Displays percentage labels for key regions using ggrepel to avoid overlapping text.
- Comparative Timeline: Visualizes data for both 2020 and 2024 elections on the same chart for direct comparison.
- Annotations: Includes a note explaining excluded constituencies and credits the visualization.
Dataset
The dataset used in this project is real election data sourced from the Electoral Commission of Ghana. It is structured as follows:
![Data structure](https://github.com/user-attachments/assets/749f0804-2449-4b89-9aaa-d64f571cbeb8)


### Columns:
* year: Year of election.
* candidate_name: Names of the political candidates
* political_party: Initials of the political parties
* region: Names of the administrative regions
* vote: The number of votes won by each candidate
* regional_percentage: Percentage of votes won by each candidate in each region
* national_percentage: Total percentage of votes won by each candidate

## Prerequisites
Ensure you have the following R packages installed:

* ggplot2: For creating the plot.
* dplyr: For data manipulation.
* ggrepel: To handle overlapping text labels.
* grid: To add external annotations.

```Install them using the commands below:
install.packages('ggplot2')
install.packages('dplyr')
install.packages('ggrepel')
install.packages('grid')
```
## How to Run the Project
- Clone the Repository:
```
git clone https://github.com/appiahadjei/ghana-voting-trends-2020-and-2024.git
cd ghana-voting-trends-2020-and-2024
```
- Open the R Script:
Load the ghana_election_regional.R file in your preferred R environment (RStudio is recommended).

- Run the Script:
Execute the script line by line to generate the plot. The chart will be displayed in the RStudio plotting window.

- Save the Output: You can export the chart as a PNG or PDF for sharing or embedding in reports.

## Interpretation of the Visualization
The plot provides a comparative view of voting percentages for NPP and NDC across two election years. Key observations include:

Ashanti Region: Even though, NPP pecentage decreases in 2024, it still favors NPP with high percentages, confirming its reputation as a stronghold.
Volta Region: A stronghold for NDC, maintaining dominance across election cycles.
Greater Accra: Often serves as a bellwether region with closely contested percentages.
Northern Region: Displays fluctuating trends, reflecting increasing competitiveness.
National Average: Offers an overall performance summary for both parties across all regions.
The percentage for the NPP only increased in two regions.

## Annotation Details
An annotation is included in the visualization, explaining the context of the data: "The 2024 data excludes results from 9 constituencies that were unavailable at the time of reporting"


## Contributing
Contributions to improve the project are welcome! Here's how you can help:

- Fork the repository.
- Create a new branch for your feature or bugfix.
- Submit a pull request with detailed notes about your changes.

## License
This project is licensed under the [MIT License](https://mit-license.org/).

## Acknowledgments
- Electoral Commission of Ghana for providing election data.
- R Community for providing open-source tools for data analysis and visualization.








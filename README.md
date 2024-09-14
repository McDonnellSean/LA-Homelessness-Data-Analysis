# Los Angeles Homelessness Analysis and Visualization 

This analysis focuses on exploring and analyzing homelessness data for Los Angeles County and City. It uses a combination of SQL for data preparation, Tableau for visualization, and analytical results derived from the data. The objective is to provide a comprehensive understanding of homelessness patterns, shelter availability, and identify key hotspots across the city's council districts.

The analysis is divided into three core parts:

1. [Data Preparation (SQL)](#data-preparation-sql)
2. [Visualization (Tableau)](#visualization-tableau)
3. [Data Analysis (Python)](#data-analysis)

## Data Preparation (SQL)

The data preparation process involved cleansing, transforming, and aggregating the raw homelessness data using SQL. Key steps included:

1. Filtering for Los Angeles Count: Removed rows where LACity = 2 to focus on relevant data for Los Angeles city.
2. Aggregating by Geographic Areas: Summarized homelessness counts by Council Districts (CD) using GROUP BY.
3. Summing Key Metrics: Calculated totals for street, sheltered, and overall homelessness across different districts.

<img width="1080" alt="Screenshot 2024-09-13 at 9 02 56 PM" src="https://github.com/user-attachments/assets/5bd5d9c8-1493-43fb-830b-5bfa9ab27b9f">

The final dataset was structured to provide insights into total street homelessness, sheltered homelessness, and unsheltered homelessness across districts.

## Visualization (Tableau)

The second phase utilized Tableau to visualize key information from the SQL-prepared dataset. The dashboard consists of multiple views to explore homelessness trends across Los Angeles Council Districts:

1. Homelessness Density Across Council Districts
- A heatmap showing the concentration of total homelessness across the city's council districts, with color-coded intensity representing homelessness rates. Users can hover over each district to view homelessness statistics for that area.
2. Street vs. Sheltered Homelessness
- A dumbbell plot visualizing the differences between street homelessness and sheltered homelessness across districts. This highlights districts where shelter demand is greater or where more individuals remain unsheltered.
3. Shelter Resources by District
- A stacked bar chart displaying the number of people in emergency shelters, transitional housing, and safe havens across districts. This visualization helps assess which districts may be underserved in terms of shelter resources.
4. Family vs. Individual Homelessness
- A cluster bar chart comparing individual homelessness with family homelessness across the districts. This allows policymakers to understand where family-specific interventions are most needed.

<img width="1031" alt="Screenshot 2024-09-13 at 9 57 49 PM" src="https://github.com/user-attachments/assets/1b016f20-7c04-45fe-929a-f7c26d4de0c2">

The visualizations not only make the data accessible but also provide a powerful way for to interact with the information.

## Data Analysis

The final phase involved performing detailed data analysis and visualizations. This included conducting statistical analyses and creating geospatial visualizations to illustrate homelessness trends and patterns.

Analyses conducted:

- Merging geospatial data from shapefiles with homelessness data, allowing for geographic mapping of homeless hotspots.

- Hotspot Identification:
    - A key part of the analysis was identifying homelessness hotspots based on the counts of single adults living on the street. The mean and standard deviation was calculated of homelessness counts and defined categories for Low, Medium, and High hotspots using custom thresholds.
    - These hotspots were mapped geographically and color-coded regions according to their hotspot category.

- Top Hotspots:
    - The code identified and sorted the top census tracts with the highest counts of single adult homelessness in "High" hotspot regions. The results included both the tract number and city, providing a more localized view of homelessness.

- Aggregation by City:
    - Homeless counts were aggregated for areas marked as "High" hotspots by city, allowing us to see which cities within Los Angeles had the highest levels of homelessness concentration.

<img width="705" alt="Screenshot 2024-09-13 at 10 00 40 PM" src="https://github.com/user-attachments/assets/89116762-70e5-4580-8575-1334b9739df3">

Through these steps, attention was directed to where resources and interventions may be needed most.

## Conclusion

This project effectively combines various data workflows—data preparation with SQL, visualization with Tableau, and data analysis—to provide a thorough understanding of the homelessness situation in Los Angeles. It highlights geographical hotspots, types of homelessness, and resource distribution to help decision-makers better support the homeless population.

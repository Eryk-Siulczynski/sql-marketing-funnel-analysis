# sql-marketing-funnel-analysis
Analysis of marketing funnel using SQL (Codecademy project)

## Business Question

_Where in the marketing funnel do most users drop off?_

## Project Overview
This project analyzes customer progression through the marketing funnel of an online eyewear store using SQL.

## Dataset

The dataset used in this project comes from the Codecademy SQL course.

Due to licensing and copyright restrictions, the original dataset is not included in this repository.  
The SQL queries provided here can be executed on the dataset available within the Codecademy learning environment.

Screenshots of query results are included to demonstrate the analysis output.

All SQL queries are available in:
`queries.sql`

## Analysis Steps
1. Inspected the structure of source tables.
2. Joined quiz, home_try_on, and purchase tables to create a funnel view.
3. Calculated conversion rates between quiz, try-on, and purchase stages.
4. Compared purchase rates by the number of pairs ordered.

## Results
### Survey table preview
<img width="411" height="114" alt="image" src="https://github.com/user-attachments/assets/a66c224c-ca69-48c8-a086-40f73a1fc62f" />


### Funnel table preview
<img width="609" height="184" alt="image" src="https://github.com/user-attachments/assets/503b1d0f-784d-4470-b3e1-ae78e56c801b" />


### Conversion results
<img width="618" height="54" alt="image" src="https://github.com/user-attachments/assets/7cd2f3c9-429a-4576-9120-d6ed940521d7" />


## Insights
- The largest drop-off occurs between the quiz and home try-on stage, indicating that many users do not proceed after initial engagement.
- Users who complete the home try-on stage show a relatively high likelihood of purchase, suggesting strong intent once they reach this step.
- Offering more pairs in the home try-on stage significantly increases conversion: users selecting 5 pairs have a higher purchase rate (~70%) compared to those selecting 3 pairs (~53%).
- The number of pairs selected is a key driver of conversion, indicating that broader product exposure improves purchase probability.

## Conclusion
- The main bottleneck in the funnel is the transition from quiz completion to home try-on. Improving engagement at this stage could increase overall conversions.
- Encouraging users to select more pairs during the home try-on stage may further improve purchase rates.
- Optimizing the early funnel stage and leveraging product exposure are the most impactful opportunities for increasing revenue.


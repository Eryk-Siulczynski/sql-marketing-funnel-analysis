
## survey
- `question` – survey question asked to the user
- `user_id` – unique user identifier
- `response` – answer to the survey question

## quiz
- `user_id` – unique user identifier
- other columns related to quiz answers and preferences

## home_try_on
- `user_id` – unique user identifier
- `number_of_pairs` – number of glasses pairs selected for home try-on

## purchase
- `user_id` – unique user identifier
- purchase-related information

## funnel_conversion

To analyze where users drop off in the marketing funnel, a funnel table was created by joining the quiz, home_try_on, and purchase tables using user_id.

The funnel represents three main stages of the customer journey:
- User completes the style quiz.
- User orders a home try-on kit.
- User purchases a pair of glasses.

Using this joined dataset, the following metrics were calculated:
- Total users who completed the quiz: 1000
- Users who ordered a home try-on: 750
- Users who made a purchase: 495

Conversion rates:
Quiz → Home Try-On:
750 / 1000 = 75%
Home Try-On → Purchase:
495 / 750 = 66%

This indicates that the largest drop-off occurs after the quiz stage, where 25% of users do not proceed to order a home try-on kit.

## purchase rate by number_of_pairs

To better understand purchasing behavior, the data was segmented by the number of pairs included in the home try-on order.

Results:

number_of_pairs |	number_of_clients |	purchases |	purchase_rate
3 pairs	        | 379	              | 201	      | 53%
5 pairs	        | 371	              | 294	      | 79%

Key insight:

Users who received 5 pairs in their home try-on kit had a much higher purchase rate (79%) compared to users who received 3 pairs (53%).

This suggests that offering more frame options during the home try-on stage significantly increases the likelihood of conversion. I suggest testing the offer with 4 pairs.

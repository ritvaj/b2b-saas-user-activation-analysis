-- Step 1: App Open (user-level)
-- This query captures the first `session_start` event per user as the funnel entry point.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step1_app_open` AS
SELECT
  user_pseudo_id,
  MIN(event_timestamp) AS session_start_ts
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'session_start'
GROUP BY user_pseudo_id;

-- A total of 2339 users started a session on the selected day.

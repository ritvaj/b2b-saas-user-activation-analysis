Out of all users who opened the app, 603 users proceeded to view an onboarding screen during their first session.

-- Step 2: Onboarding Screen Viewed (user-level)

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` AS
SELECT
  s.user_pseudo_id,
  MIN(e.event_timestamp) AS onboarding_ts
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step1_app_open` s
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e
  ON s.user_pseudo_id = e.user_pseudo_id
JOIN UNNEST(e.event_params) ep
WHERE e.event_name = 'page_view'
  AND ep.key = 'page_title'
  AND ep.value.string_value IN (
    'Home',
    'Google Online Store',
    'The Google Merchandise Store - Log In'
  )
  AND e.event_timestamp > s.session_start_ts
GROUP BY s.user_pseudo_id;

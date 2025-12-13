Out of all users who opened the app, 603 users proceeded to view an onboarding screen during their first session.

  -- Step 2: Onboarding Screen Viewed (user-level)

WITH step1_app_open AS (
  SELECT
    user_pseudo_id,
    MIN(event_timestamp) AS session_start_ts
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
  WHERE event_name = 'session_start'
  GROUP BY user_pseudo_id
),

onboarding_events AS (
  SELECT
    e.user_pseudo_id,
    e.event_timestamp AS onboarding_ts
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e,
       UNNEST(e.event_params) AS ep
  WHERE e.event_name = 'page_view'
    AND ep.key = 'page_title'
    AND ep.value.string_value IN (
      'Home',
      'Google Online Store',
      'The Google Merchandise Store - Log In'
    )
)

SELECT
  s.user_pseudo_id,
  MIN(o.onboarding_ts) AS onboarding_ts
FROM step1_app_open s
JOIN onboarding_events o
  ON s.user_pseudo_id = o.user_pseudo_id
 AND o.onboarding_ts > s.session_start_ts
GROUP BY s.user_pseudo_id;

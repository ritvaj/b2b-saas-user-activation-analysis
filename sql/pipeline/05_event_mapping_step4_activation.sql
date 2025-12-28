-- Step 4: Activation (user-level)
-- This query captures the first `purchase` event per discovered user, occurring after feature discovery.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` AS
SELECT
  s.user_pseudo_id,
  MIN(e.event_timestamp) AS activation_ts
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` s
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e
  ON s.user_pseudo_id = e.user_pseudo_id
WHERE e.event_name = 'purchase'
  AND e.event_timestamp > s.feature_discovery_ts
GROUP BY s.user_pseudo_id;

-- Out of 201 users who reached feature discovery, 9 successfully activated.

-- Step 4: Start Core Action — first core action initiated after feature discovery

-- Despite 201 users exploring features, no users proceeded to initiate the core action, indicating a complete drop-off at this stage.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step4_core_action_users` AS
SELECT
  s.user_pseudo_id,
  MIN(e.event_timestamp) AS core_action_ts
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` s
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e
  ON s.user_pseudo_id = e.user_pseudo_id
WHERE e.event_name = 'add_to_cart'
  AND e.event_timestamp > s.feature_discovery_ts
GROUP BY s.user_pseudo_id;

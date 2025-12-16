-- Step: Segmentation — Activation Speed
-- Objective:
-- Segment activated users into Fast and Slow Activators
-- based on time taken to move from onboarding to activation.
--
-- Output:
-- user_pseudo_id
-- seconds_to_activation
-- activation_speed_segment (Fast Activator / Slow Activator)
--
-- Purpose:
-- Identify pacing friction among users who successfully activate.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.activation_speed_segments` AS
SELECT
  f.user_pseudo_id,
  (a.activation_ts - f.feature_discovery_ts) / 1e6 AS seconds_to_activate,
  CASE
    WHEN (a.activation_ts - f.feature_discovery_ts) / 1e6 <= 727
      THEN 'Fast Activator'
    ELSE 'Slow Activator'                -- Users activating below the median time are labeled Fast Activators,
                                         -- while those above the median are labeled Slow Activators.
  END AS activation_speed_segment
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` f
JOIN `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` a
  ON f.user_pseudo_id = a.user_pseudo_id
WHERE a.activation_ts > f.feature_discovery_ts;

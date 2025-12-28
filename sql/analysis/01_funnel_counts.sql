-- Step: Funnel Summary (user-level)
-- This query aggregates user counts across all funnel steps using UNION ALL.
-- It consolidates the number of users who reached each step of the funnel to provide a clear view of drop-off from App Open to Activation.

SELECT
  'Step 1: App Open' AS step,
  COUNT(DISTINCT user_pseudo_id) AS users
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step1_app_open`

UNION ALL
SELECT
  'Step 2: Onboarding',
  COUNT(DISTINCT user_pseudo_id)
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users`

UNION ALL
SELECT
  'Step 3: Feature Discovery',
  COUNT(DISTINCT user_pseudo_id)
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users`

UNION ALL
SELECT
  'Step 5: Activation',
  COUNT(DISTINCT user_pseudo_id)
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users`;

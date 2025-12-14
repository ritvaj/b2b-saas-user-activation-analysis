# taskflowhq-onboarding-activation-funnel-analysis

```
taskflowhq-onboarding-activation-funnel-analysis/
│
├── sql/
│   ├── 01_event_validation.sql
│   ├── 02_event_mapping_step2_onboarding.sql
│   ├── 03_event_mapping_step3_feature_discovery.sql
│   ├── 04_user_funnel_construction.sql
│   ├── 05_retention_cohort.sql
│   └── 06_ab_test.sql
│
├── README.md
└── notes/
    └── funnel_notes.md 
```


🔹 Funnel Summary & Drop-off Analysis

User Funnel Overview

Funnel Step	Users
App Open	2339
Onboarding Screen Viewed	603
Feature Discovery	201
Core Action Started	0
Activation	9

Key Observations

Significant drop-off occurs immediately after app open, indicating onboarding friction.

Only ~33% of onboarded users proceed to feature discovery.

No users initiate the core action despite feature exploration.

A small number of users reach activation without recorded core-action events, highlighting instrumentation gaps in the dataset.

That’s enough. Clean and professional.

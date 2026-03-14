# Job Search Analytics

A data engineering project that tracks and analyzes my job search activity using **dbt** and **PostgreSQL**.

## Project Structure

```
seeds/          → Raw job application data (CSV)
models/
  staging/      → Cleaned and standardized data
  marts/        → Analytics-ready models
```

## Tech Stack
- **dbt** — data transformation
- **PostgreSQL** — data warehouse
- **WSL** — development environment
- **Git/GitHub** — version control

## Key Insights
- 30 job applications tracked
- 74% no response rate
- 93% of applications via LinkedIn
- 0 interviews — diversifying sources!

## Models
| Model | Type | Description |
|---|---|---|
| `stg_job_applications` | View | Cleaned raw data |
| `fct_job_applications` | View | Analytics-ready with derived columns |
| `agg_applications_by_status` | View | Applications grouped by status |
| `agg_applications_by_source` | View | Applications grouped by source |
| `agg_weekly_applications` | View | Weekly application activity |

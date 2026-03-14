with base as (
    select * from {{ ref('fct_job_applications') }}
)

select
    date_trunc('week', application_date) as week_start,
    count(*) as total_applications,
    sum(case when status = 'rejected' then 1 else 0 end) as rejected,
    sum(case when status = 'no_response' then 1 else 0 end) as no_response,
    sum(case when status = 'interview' then 1 else 0 end) as interviews
from base
group by week_start
order by week_start

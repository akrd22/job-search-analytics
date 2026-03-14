with base as (
    select * from {{ ref('fct_job_applications') }}
)

select
    source,
    count(*) as total_applications,
    round(count(*) * 100.0 / sum(count(*)) over (), 1) as percentage
from base
group by source
order by total_applications desc

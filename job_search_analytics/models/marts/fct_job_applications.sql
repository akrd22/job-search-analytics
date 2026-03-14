with stg as (
    select * from {{ ref('stg_job_applications') }}
),

final as (
    select
        application_id,
        company_name,
        job_title,
        application_date,
        status,
        source,
        location,
        work_type,
        salary_min,
        salary_max,

        -- derived columns
        round((salary_min + salary_max) / 2.0, 0) as salary_midpoint,
        case
            when status = 'rejected' then false
            when status = 'no_response' then false
            else true
        end as is_active,
        case
            when salary_max >= 120000 then 'high'
            when salary_max >= 90000 then 'mid'
            else 'low'
        end as salary_band

    from stg
)

select * from final

with stg_users as (
    select
        id,
        firstname,
        lastname,
        username,
        profile_medium

    from {{ source('strava', 'users_raw') }}
)

select * from stg_users
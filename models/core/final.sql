with activities as (
    select *
    from {{ ref('stg_activities') }}
),

users as (
    select * 
    from {{ ref('stg_users') }}
),

final as (
    select 
        firstname,
        lastname,
        username,
        activity_name,
        sport_type,
        start_date_utc,
        distance_meters,
        distance_feet,
        total_time_hrs,
        moving_time_hrs,
        avg_speed_mph,
        avg_speed_kph,
        max_speed_mph,
        max_speed_kph,
        elev_high_meters,
        elev_high_feet,
        elev_low_meters,
        elev_low_feet,
        total_elevation_gain_meters,
        total_elevation_gain_feet,
        avg_temp_c,
        avg_temp_f,
        timezone,
        pr_count,
        achievement_count,
        map,
        profile_medium

    from activities
    inner join users
    on activities.athlete:id = users.id
)

select * from final
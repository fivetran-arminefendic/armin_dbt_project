with stg_activities as (
    select
        athlete,
        name as activity_name,
        sport_type,
        start_date as start_date_utc,
        ROUND(distance / 1000, 1) as total_distance_km,
        ROUND(distance  * 0.000621371, 1) as total_distance_mi,
        ROUND(elapsed_time / 3600, 1) as total_time_hrs,
        ROUND(moving_time / 3600, 1) as moving_time_hrs,
        ROUND(average_speed * 2.23694, 1) as avg_speed_mph,
        ROUND(average_speed * 3.6, 1) as avg_speed_kph,
        ROUND(max_speed * 2.23694, 1) as max_speed_mph,
        ROUND(max_speed * 3.6, 2) as max_speed_kph,
        elev_high as elev_high_meters,
        ROUND(elev_high * 3.28084, 1) as elev_high_feet,
        elev_low as elev_low_meters,
        ROUND(elev_low * 3.28084, 1) as elev_low_feet,
        total_elevation_gain as total_elevation_gain_meters,
        ROUND(total_elevation_gain * 3.28084, 2) as total_elevation_gain_feet,
        average_temp as avg_temp_c,
        ROUND(average_temp * 9/5 + 32, 1) as avg_temp_f,
        timezone,
        pr_count,
        achievement_count,
        start_latlng[0] as start_lat,
        start_latlng[1] as start_lng,
        map

    from {{ source('strava', 'activities_raw') }}
)

select * from stg_activities
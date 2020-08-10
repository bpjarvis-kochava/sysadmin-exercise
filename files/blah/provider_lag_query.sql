-- PROVIDER LAG


drop table if exists #us;
create table #us as
select processed_date,
       date_trunc('day', activity_datetime)::date as activity_date,
       provider_id,
       datediff(day, date_trunc('day', activity_datetime)::date, processed_date) as diff_date,
       count(distinct device_id) as device_count,
       count(1) as row_count
from universe.geo_activity_transaction as g
where processed_date >= '2020-04-01'
and date_trunc('day', activity_datetime)::date > dateadd(d, -20, processed_date)
-- and provider_id = 1279
and provider_id not in (select blocked_provider_id from common.data_license_blacklist) -- mobilewalla is in this
and device_id not in (select device_id from common.kochava_fraud_blacklist_device)
and country_code = 'US'
group by 1,2,3,4
;

select * from #us;
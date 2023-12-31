
{% set cols = ["col3", "col4", "col5", "col6", "col7", "col8", "col9","col10", "col11", "col12", "col13", "col14", "col15", "col16", "col17", "col18", "col19", "col20", "col21", "col22", "col23", "col24", "col25"] %}

with source_observation as (

  select * from
  analytics.raw_observations

)


select date, time, station_id,
  {% for col in cols %}
  case
    when isnull({{col}}) then 0 else {{col}}
  end as {{col}},
  {% endfor %}
  case
    when isnull(col15) then 0 else col15
  end as col26
from source_observation


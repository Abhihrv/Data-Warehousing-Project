SELECT player_name, event_type, count(event_type)
from fact_event f
join dim_team d on f.team_key=d.team_key
join dim_event e on f.event_key = e.event_key
join dim_period p on f.period_key = p.period_key
join dim_player py on py.player_key=f.player_key
where f.is_offensive='Offensive' AND player_1_team_gen='team16'
group by player_name, event_type
order by player_name;
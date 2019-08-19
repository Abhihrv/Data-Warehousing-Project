SELECT player_1_team_gen, count(event_type), period_desc
from fact_event f
join dim_team d on f.team_key=d.team_key
join dim_event e on f.event_key = e.event_key
join dim_period p on f.period_key = p.period_key
where f.is_offensive='Offensive'
group by player_1_team_gen, period_desc
order by player_1_team_gen;
with 
d_1960s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 1960 and 1969
    group by year
),
d_1979s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 1970 and 1979
    group by year
),
d_1980s as(
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 1980 and 1989
    group by year
),
d_1990s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 1990 and 1999
    group by year
),
d_2000s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 2000 and 2009
    group by year
),
d_2010s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 2010 and 2019
    group by year
),
d_2020s as (
    select year, count(cnt) cnt from {{ ref('fct_yearly_incidents') }}
    where year between 2020 and 2029
    group by year
)
select * from d_1980s
union all
select * from d_1990s
union all
select * from d_2000s
union all
select * from d_2010s
union all
select * from d_2020s
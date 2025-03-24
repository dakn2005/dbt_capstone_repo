with 
d_1920s as (
    select '1920s' decade, sum(cnt) incidents_cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1920 and 1929
),d_1930s as (
    select '1930s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1930 and 1939
),d_1940s as (
    select '1940s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1940 and 1949
),d_1950s as (
    select '1950s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1950 and 1959
),
d_1960s as (
    select '1960s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1960 and 1969
),
d_1970s as (
    select '1970s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1970 and 1979
),
d_1980s as(
    select '1980s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1980 and 1989
),
d_1990s as (
    select '1990s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 1990 and 1999
),
d_2000s as (
    select '2000s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 2000 and 2009
),
d_2010s as (
    select '2010s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 2010 and 2019
),
d_2020s as (
    select '2020s', sum(cnt) cnt from {{ ref('vw_yearly_incidents') }}
    where year between 2020 and 2029
)
select * from d_1920s
union all
select * from d_1930s
union all
select * from d_1940s
union all
select * from d_1950s
union all
select * from d_1960s
union all
select * from d_1970s
union all
select * from d_1980s
union all
select * from d_1990s
union all
select * from d_2000s
union all
select * from d_2010s
union all
select * from d_2020s
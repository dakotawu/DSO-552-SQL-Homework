select * from flights;

-- Question 1

select uniquecarrier, origin
from flights
where origin in ('IAH','HOU');

-- Questions 2

select * 
from flights
where uniquecarrier in ('AA','DL');

-- Question 3

select *
from flights 
where origin = 'IAH' and distance >= 3000;

-- Question 4

select origin, dest, distance
from flights
where origin = 'IAH' 
order by distance desc
limit 5;

-- Question 5

select tailnum, taxiin + taxiout as taxiing, airtime
from flights 
where taxiin + taxiout > airtime;

-- Question 6

select *
from flights
where dest = 'DFW' and deptime < 800 and airtime is not null
order by airtime desc;

-- Question 7

select uniquecarrier, dayofweek, cancelled
from flights 
where cancelled = 1 and dayofweek in (7,1);

-- Question 8

select count(*)
from flights 
where uniquecarrier = 'AA' and arrdelay > 0;
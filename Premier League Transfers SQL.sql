--extracting data for analysis
--Getting the total spending of each team and their average finish
select transfers.club_name,
sum(transfer_fee_millions) as total_spent,
avg(standings.position) as average_finish 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season 
group by transfers.club_name
order by total_spent desc;

--Selecting the total signing for each position 
select transfers.position, 
count(*) as total_signed 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season 
group by transfers.position 
order by total_signed desc;

--Finding out the average spending for each team and their average finish
select t.club_name, 
avg(transfer_fee_millions) as average_spending,
avg(s.position) as highest_finish
from transfers t join standings s
on t.club_name = s.club_name 
and t.season = s.season 
group by t.club_name
order by highest_finish asc;

--Selecting the average fee for each position for top 4 teams
select transfers.position, 
avg(transfer_fee_millions) as average_spent 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season 
where standings.position <= 4
group by transfers.position 
order by average_spent desc;

--Selecting the average fee for each position for non-top 4 teams
select transfers.position, 
avg(transfer_fee_millions) as average_spent 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season 
where standings.position > 4
group by transfers.position 
order by average_spent desc;


--Selecting the total signing for each position for top 4 teams
select transfers.position, 
count(*) as total_signed 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season 
where standings.position <= 4
group by transfers.position 
order by total_signed desc;

--Selecting the average age of players signed for top4 teams
select transfers.position,
avg(age) as average_age 
from transfers join standings
on transfers.club_name = standings.club_name 
and transfers.season = standings.season
where standings.position <= 4
group by transfers.position
order by average_age asc;

--Selecting the age of players signed and the frequency 
select age, 
count(player_name) as frequency 
from transfers 
group by age 
order by age asc;

--Finding out the average age for each position (for only positions with more than 5 signings)
select position, avg(age) as average_age 
from transfers
group by position 
order by average_age asc; 


--Selecting the average spending of teams that average a top 4 finish
select club_name, avg(transfer_fee_millions) as average_spending 
from transfers 
group by club_name 
having avg(transfer_fee_millions) > 20;




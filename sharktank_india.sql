select * from sharktank

-- Total no. of eposodes telecaste.

select count(distinct epno) as Total_number_of_episodes from sharktank  -- So there are total 30 episodes in total.

--Pitches
select count(distinct brand) as Total_pitches from sharktank  -- There are 98 Brands pitched in the show.

-- Find the brands who got fundings in lakhs.
select brand,Amount_Invested_lakhs from sharktank
where Amount_Invested_lakhs > 0
order by Amount_Invested_lakhs desc

-- Total no of male participants participated in sharktank.
select sum(Male) as total_male_participants from sharktank

-- Total no of female participants participated in sharktank.
select sum(Female) as total_female_participants from sharktank

-- Total invested Amount by sharks.
select sum(Amount_Invested_lakhs) as Amount_Invested from sharktank

-- Avg equity taken.
select avg(Equity_Taken) as Avg_equity from sharktank 
where Equity_Taken>0

-- Highest deal done on the show.
select brand, max(Amount_Invested_lakhs) as Highest_deal from sharktank

-- Highest equity taken by the sharks.
select brand,sector,max(Equity_Taken) as Highest_Equity_Taken from sharktank

-- Find the pitches that has atleast one women into them.
select brand,female from sharktank 
where female > 0

-- Average no. of contestent team members participated into sharktank.
select round(avg(Team_members)) as Avg_team_members from sharktank

-- Average amount invested per deal.
select avg(a.Amount_Invested_lakhs) as avg_amount_invested_per_deal from 
(select * from sharktank 
where deal!='No Deal') a

-- Find most age group in which most entrepreneur came from.
select Avg_age,count(Avg_age) as number_of_participents from sharktank group by Avg_age order by number_of_participents desc

-- which is the most famous location from pitches had came from.
with a as (select location,count(location) as location_count from sharktank
group by location order by location_count desc)
select location,max(a.location_count) as popular_location from a

-- From which sectors most numbers of deals are coming.
with a as (select sector,count(sector) as sector_count from sharktank
group by sector order by sector_count desc)
select sector,max(a.sector_count) as popular_sector from a

-- Which shark has done most numbers of deals in sharktank.
select partners,count(partners) as no_of_deals from sharktank
where partners!='-' 
group by partners 
order by no_of_deals desc 
limit 1

-- Making the matrix

-- Ashneer--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_ashneer,y.Avg_amount_invested_by_ashneer
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Ashneer' as Name, count(Ashneer_Amount_Invested) as Total_deals_present from sharktank where Ashneer_Amount_Invested is not null) a
join (select 'Ashneer' as Name, count(Ashneer_Equity_Taken) as Total_Equity_Taken from sharktank where Ashneer_Amount_Invested != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Ashneer_Amount_Invested,Ashneer_Equity_Taken from sharktank where Ashneer_Amount_Invested != 0 and Ashneer_Equity_Taken !=0)
select 'Ashneer' as Name, sum(Ashneer_Amount_Invested) as Total_amount_invested_by_ashneer, avg(Ashneer_Equity_Taken) as Avg_amount_invested_by_ashneer from a) y

on x.Name = y.Name

--Namita--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Namita,y.Avg_amount_invested_by_Namita
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Namita' as Name, count(Namita_Amount_Invested) as Total_deals_present from sharktank where Namita_Amount_Invested is not null) a
join (select 'Namita' as Name, count(Namita_Equity_Taken) as Total_Equity_Taken from sharktank where Namita_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Namita_Amount_Invested,Namita_Equity_Taken from sharktank where Namita_Amount_Invested != 0 and Namita_Equity_Taken !=0)
select 'Namita' as Name, sum(Namita_Amount_Invested) as Total_amount_invested_by_Namita, avg(Namita_Equity_Taken) as Avg_amount_invested_by_Namita from a) y

on x.Name = y.Name

--Anupam--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Anupam,y.Avg_amount_invested_by_Anupam
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Anupam' as Name, count(Anupam_Amount_Invested) as Total_deals_present from sharktank where Anupam_Amount_Invested is not null) a
join (select 'Anupam' as Name, count(Anupam_Equity_Taken) as Total_Equity_Taken from sharktank where Anupam_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Anupam_Amount_Invested,Anupam_Equity_Taken from sharktank where Anupam_Amount_Invested != 0 and Anupam_Equity_Taken !=0)
select 'Anupam' as Name, sum(Anupam_Amount_Invested) as Total_amount_invested_by_Anupam, avg(Anupam_Equity_Taken) as Avg_amount_invested_by_Anupam from a) y

on x.Name = y.Name


--Vineeta--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Vineeta,y.Avg_amount_invested_by_Vineeta
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Vineeta' as Name, count(Vineeta_Amount_Invested) as Total_deals_present from sharktank where Vineeta_Amount_Invested is not null) a
join (select 'Vineeta' as Name, count(Vineeta_Equity_Taken) as Total_Equity_Taken from sharktank where Vineeta_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Vineeta_Amount_Invested,Vineeta_Equity_Taken from sharktank where Vineeta_Amount_Invested != 0 and Vineeta_Equity_Taken !=0)
select 'Vineeta' as Name, sum(Vineeta_Amount_Invested) as Total_amount_invested_by_Vineeta, avg(Vineeta_Equity_Taken) as Avg_amount_invested_by_Vineeta from a) y

on x.Name = y.Name

--Aman--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Aman,y.Avg_amount_invested_by_Aman
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Aman' as Name, count(Aman_Amount_Invested) as Total_deals_present from sharktank where Aman_Amount_Invested is not null) a
join (select 'Aman' as Name, count(Aman_Equity_Taken) as Total_Equity_Taken from sharktank where Aman_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Aman_Amount_Invested,Aman_Equity_Taken from sharktank where Aman_Amount_Invested != 0 and Aman_Equity_Taken !=0)
select 'Aman' as Name, sum(Aman_Amount_Invested) as Total_amount_invested_by_Aman, avg(Aman_Equity_Taken) as Avg_amount_invested_by_Aman from a) y

on x.Name = y.Name

--Peyush--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Peyush,y.Avg_amount_invested_by_Peyush
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Peyush' as Name, count(Peyush_Amount_Invested) as Total_deals_present from sharktank where Peyush_Amount_Invested is not null) a
join (select 'Peyush' as Name, count(Peyush_Equity_Taken) as Total_Equity_Taken from sharktank where Peyush_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Peyush_Amount_Invested,Peyush_Equity_Taken from sharktank where Peyush_Amount_Invested != 0 and Peyush_Equity_Taken !=0)
select 'Peyush' as Name, sum(Peyush_Amount_Invested) as Total_amount_invested_by_Peyush, avg(Peyush_Equity_Taken) as Avg_amount_invested_by_Peyush from a) y

on x.Name = y.Name

--Ghazal--

select x.Name,x.Total_deals_present,x.Total_Equity_Taken,y.Total_amount_invested_by_Ghazal,y.Avg_amount_invested_by_Ghazal
from
(select a.Name,a.Total_deals_present,b.Total_Equity_Taken
from (select 'Ghazal' as Name, count(Ghazal_Amount_Invested) as Total_deals_present from sharktank where Ghazal_Amount_Invested is not null) a
join (select 'Ghazal' as Name, count(Ghazal_Equity_Taken) as Total_Equity_Taken from sharktank where Ghazal_Equity_Taken != 0) b
on a.Name = b.Name) x

inner join 

(with a as (select Ghazal_Amount_Invested,Ghazal_Equity_Taken from sharktank where Ghazal_Amount_Invested != 0 and Ghazal_Equity_Taken !=0)
select 'Ghazal' as Name, sum(Ghazal_Amount_Invested) as Total_amount_invested_by_Ghazal, avg(Ghazal_Equity_Taken) as Avg_amount_invested_by_Ghazal from a) y

on x.Name = y.Name


--joining all sharks records we get--








-- which are the startups that had got highest investments by sharks--
select a.* from
(select brand,sector,Amount_Invested_lakhs, rank() over(partition by sector order by Amount_Invested_lakhs desc) as Highest_investment
from sharktank where Amount_Invested_lakhs !=0) a
where a.Highest_investment = 1







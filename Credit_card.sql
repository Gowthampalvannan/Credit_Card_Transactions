SELECT * FROM `credit card`.credit_card;

-- Q1) Count of Records?
-- A1) 26052

select count(`card type`)
from credit_card;

-- Q2) find out from how many card types are given?
-- A2) 4 (Gold,platinum,silver,signature)

select distinct(`card type`)
from credit_card;

-- Q3) find out from how many exp types are given?
-- A3)6

select distinct(`exp type`) as cnt
from credit_card;

-- Q4) Maximum Amount,Minimum amount,Average amount?
-- A4) 998077,1005,156441.5

select max(amount),min(Amount), round(avg(Amount),1)
from credit_card;

-- Q5) Which Type Card use Max Amount,Gender?
-- A5) Platinum,Female

select * from credit_card
where amount='998077';

-- Q6) Which Type Card use Min Amount,Gender,bill type?
-- A6) platinum,Female,Grocery

select * from credit_card
where amount='1005';

-- Q7) use the where clause  to pick a Particular  type of card and usage and gender?

select `index`,city,`card type`,`exp type`,gender,amount from credit_card
where `card type`='Signature' and `exp type`='Bills' and gender='M'
order by amount
limit 10;

-- Q8)use the where clause  to pick a Particular  type of card and usage and gender?

select `index`,city,`card type`,`exp type`,gender,amount from credit_card
where `card type`='Signature' and `exp type`='Bills' and gender='F'
order by amount desc
limit 10;

-- Q9)use the where clause  to pick a Particular  type of card and usage and gender?

select `index`,city,`card type`,`exp type`,gender,amount from credit_card
where `card type`='Gold' and `exp type`='Food' and gender='F'
order by amount desc
limit 10;

-- Q10)use the where clause  to pick a Particular  type of card and usage and gender?

select `index`,city,`card type`,`exp type`,gender,amount from credit_card
where `card type`='platinum' and `exp type`='Fuel' and gender='M'
order by amount desc
limit 10;

select `index`,city,`card type`,`exp type`,gender,amount from credit_card
where `card type`='silver' and `exp type`='grocery' and gender='f'
order by amount desc
limit 10;

-- Q11) use wlid card stings like pick a particular city in the alphabet?

select *from credit_card
where city like 'j%' ;

-- Q12) How Many Card Types available in the table and its counts?

select `card type`,count(*) as cnt from credit_card
group by `card type`
order by cnt desc;

-- Q13) How Many exp Types available in the table and its counts?

select `exp type`,count(*) as cnt from credit_card
group by `exp type`
order by cnt desc;

-- Q14) How Many Card Types,exp types available in the table and its counts?

select `card type`,`exp type`,count(*) as cnt from credit_card
group by `card type`,`exp type`
order by cnt desc;

-- Q15) How Many cities use the credit card?

select `city`,count(*) as cnt from credit_card
group by `city`
order by cnt desc;

-- Q16)  Avg Amount of Card Types and count of the cards?

select `card type`,count(`card type`) as cnt ,round(avg(amount),1) as avg_amount from credit_card
group by `card type`
order by cnt desc;

-- Q17) which type of card is  maximum amount and in the table?

select `card type`,max(amount)as max_amount from credit_card
group by `card type`;

-- Q18) which type of card is  minimum amount and in the table?

select `card type`,min(amount)as min_amount from credit_card
group by `card type`;

-- Q19) select only Grocery in the table and finds its amount?

select `city`,`card type`,`exp type`,`amount`
from credit_card
where `exp type`='grocery'
order by amount desc;

-- Q20) find the average amount of usages and types of card?

select `exp type`,`card type`,avg(amount)
from credit_card
group by `exp type`,`card type`;

-- Q21) Find the usage of fuel and counts city and card types?

select `city`,count(City) as cnt,`card type`,count(`Card Type`) as cnte,`exp type`
from credit_card
where `Exp Type`='fuel'
group by `city`,`card type`
having cnte>1
order by cnt desc;

-- Q22) Create a new Coloumn of  amount category and seperated 3 types?

select*,
		case when amount between 1 and 300000 then 'under 300k'
			 when amount between 300000 and 500000 then 'under 500k'
             when amount between 500000 and 1000000 then 'under 1000k'
		end as 'amount cateogry'
from credit_card;

select*,year(curdate())-`date` as now
from credit_card;

-- Q23) remove the country name from after the city?
update credit_card
Set city = replace(city, ', India', '')
where city like '%, India'; 

-- Q24) Find a particular city and its usage?

select `index`,city,`date`,`card type`,`exp type`,gender,amount
from credit_card
where city='delhi'
order by amount desc;

select city,`card type`,amount
from credit_card
where city='bengaluru'
order by amount desc;

select city,`card type`,amount
from credit_card
where city='greater mumbai'
order by amount desc;

select city,count(city) cnt
from credit_card
where `card type`='Gold'
group by city
order by cnt desc;

-- Q25) Find the count of how many cities greater than fivelakhs rupees used in silver card?

select city,count(city) cnt
from credit_card
where `card type`='silver' and amount>500000
group by city
order by cnt desc;

-- Q26) Find the count of how many cities less than or equal fivelakhs rupees used in platinum card?

select city,count(city) cnt
from credit_card
where `card type`='platinum' and amount<=200000
group by city
order by cnt desc;

-- Q27) Find the count of banglore city less than or equal twolakhs rupee amount uses gold card in bills paying?

select city,count(city) cnt
from credit_card
where `Exp Type`='bills' and amount<=200000 and city='bengaluru' and `card type`='gold'
group by city
order by cnt desc;

-- Q28) Find the count of Chennai city less than or equal fivelakhs rupee amount uses platinum card in bills paying?

select city,count(city) cnt
from credit_card
where `Exp Type`='bills' and `card type`='platinum' and amount<=50000 and city='chennai'
group by city
order by cnt desc;

-- Q29) Find the count of Delhi city less than or equal fivelakhs rupee amount uses gold card in bills paying?

select city,count(city) cnt
from credit_card
where `Exp Type`='bills' and `card type`='Gold' and amount<=50000 and city='Delhi'
group by city
order by cnt desc;

-- Q30) Find the count of mubai city less than or equal fivelakhs rupee amount uses silver card in bills paying?

select city,count(city) cnt
from credit_card
where `Exp Type`='bills' and `card type`='silver' and amount<=50000 and city='Mumbai'
group by city
order by cnt desc;




































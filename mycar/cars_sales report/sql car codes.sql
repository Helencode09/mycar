select*
from sales_data;

select*
from sales_team;

select*
from cars_data;

select distinct (first_name||'  '|| last_name) as full_name
from sales_team
order by full_name


	  
select*
from cars_data cd
join  sales_data  sd
      on  sd.customer_car_code =cd.car_code
join  sales_team st
      on st.sales_manager_id = sd.sales_manager_id;
 
select*
from cars_data cd
join  sales_data  sd
      on  sd.customer_car_code =cd.car_code
join  sales_team st
      on st.sales_manager_id = sd.sales_manager_id;
	  


-----QUESTION ONE
select   distinct(st."first_name" ||' '|| "last_name") as full_name, sum(cd.car_price) as total_sales,
round((sum(st.monthly_target) - sum(cd.car_price))/sum(st.monthly_target)*100, 2)as percentage_target_left 
from cars_data cd
join  sales_data  sd
      on  sd.customer_car_code =cd.car_code
join  sales_team st
      on st.sales_manager_id = sd.sales_manager_id
group by full_name
order by total_sales, percentage_target_left;

	  	  
	  
-----Question two

select  st.first_name, st.sales_manager_id, cd.car_code, cd.car_name,
round((cd.car_price - sd.deposit_paid_for_booking)/ cd.car_price * 100, 2) as "percentage_target"
from  sales_team st
join  sales_data  sd
       on st.sales_manager_id = sd.sales_manager_id
join cars_data cd
       on  sd.customer_car_code =cd.car_code
where sd.sales_manager_id ='12134'
group by st.first_name, st.sales_manager_id, cd.car_code, cd.car_name,cd.car_price,sd.deposit_paid_for_booking
order by "percentage_target";



------Question three

select st.first_name, 
    sum(sd.deposit_paid_for_booking)/sum(cd.car_price) *100 as "percentage_total_price"
from  sales_team st
join  sales_data  sd
       on st.sales_manager_id = sd.sales_manager_id
join cars_data cd
       on  sd.customer_car_code =cd.car_code
group by st.first_name
order by "percentage_total_price";




------Question four
select  st.first_name, cd.car_name, sum(sd.deposit_paid_for_booking) as car_sales, 
       sum(cd.car_price) as total_amt
from  sales_team st
join  sales_data  sd
       on st.sales_manager_id = sd.sales_manager_id
join cars_data cd
       on  sd.customer_car_code =cd.car_code
group by st.first_name, cd.car_name     
order by "car_sales","total_amt";


-----Question five
select round(avg(sd2.sold_on - sd1.sold_on), 2) as "avg_diff"
from "sales_data" sd1
join "sales_data" sd2
     on sd1.customer_car_code =sd2.customer_car_code
and sd1.sold_on < sd2.sold_on;











------Question five(b)
select "month", avg(average number of days from one sale to the next) as "average_numbers_of_days"
from
(select *,
case 
	 when "month" = 1 then 'april'
	 when "month" = 2 then 'may'
	 when "month" = 3 then 'june'
	 when "month" = 4 then 'july'
	 when "month" = 5 then 'august'
	 when "month" = 6 then 'september'
	 when "month" = 7 then 'october'
else 'december' end as "year"
from
(select*, extract (dow from "sold_on") as "month" 
from "sales_data") as "table_one") as "table_two"
group by "month"
order by "average_numbers_of_days"desc;

select sd.sales_manager_id, sd.sold_on, avg(datediff(08/04/2022, 16/09/2022 )) as "days"
from sales_data sd
group by sd.sales_manager_id, sd.sold_on
order by "days";



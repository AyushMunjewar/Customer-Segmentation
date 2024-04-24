use project_customer_segmentation;

select * from customer ;

#__________ Total count of gender ______________#
select count(*) from customer group by 'gender';

# 1 ________  How is the shopping distribution according to gender?____#
select gender, shopping_mall, SUM(quantity) as total_quantity_purchased
from customer
group by gender, shopping_mall;

# 2 _________ we sell more products to female________#
select gender, sum(quantity) 
from customer 
where gender ='Male';

select gender, sum(quantity) 
from customer 
where gender ='Female';

# 3 _____ Which gender generated more revenue_______#
select gender, sum(quantity * price) as total_revenue from customer where gender ='Male';

select gender, sum(quantity * price) as total_revenue from customer where gender ='Female';

# 4 __________ Distribution of purchase categories relative to gender _____#
select category, gender, count(*) as purchase_count from customer group by category, gender;


select min(age) from customer;
select max(age) from customer;

# 5 ______________ shopping distribution according to age_group ____#
select 
    case
        when age < 18 then 'Under 18'
        when age between 18 and 24 then '18-24'
        when age BETWEEN 25 AND 34 then '25-34'
        when age BETWEEN 35 AND 44 then '35-44'
        when age BETWEEN 45 AND 54 then '45-54'
        when age BETWEEN 55 AND 64 then '55-64'
        else '65+'
    end as age_group,
    SUM(quantity) as total_quantity_purchased
from customer
where age between 18 and 69
group by age_group
order by age_group;


# 6 
select customer_id,age,category from customer where age between 18 and 20;
select customer_id,age,category from customer where age between 20 and 50;
select customer_id,age,category from customer where age > 50;

# 6 my query
select
 case when age between 18 and 20 then '18-20'
when age between 20 and 50 then '20-50'
else '50+'
end as age_group,customer_id,category from customer 
where age between 18 and 69 ;

# 7
select sum(quantity*price) as renevue from customer where age between 18 and 20;
select sum(quantity*price) as renevue from customer where age between 20 and 30;
select sum(quantity*price) as renevue from customer where age > 50;

#8 
select category,sum(quantity) as quantities_purchased from customer group by category order by quantities_purchased;

#9

# 10 _______10.	distribution of the payment method
select payment_method, count(*) from customer group by payment_method;


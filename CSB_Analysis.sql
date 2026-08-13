select*from customers limit 100;
select gender,sum(purchase_amount) as revenue from customers
group by gender;

select customer_id,purchase_amount from customers 
where discount_applied = 'Yes' and purchase_amount >= (select avg(purchase_amount) from customers);

select item_purchased,round(avg(review_rating),2) as average_review_rating from customers
group by item_purchased
order by avg(review_rating)  desc
limit 5;

select shipping_type,round(avg(purchase_amount),2 )as avg_purchase_amount from customers
where shipping_type in ('Express','Standard')
group by shipping_type;

select count(customer_id) as total_customer,subscription_status,round(avg(purchase_amount),2) as avg_spent,
round(sum(purchase_amount),2) as total_revenue from customers
group by subscription_status
order by avg_spent,total_revenue desc;


select item_purchased,
round(100 * sum(case when discount_applied = 'Yes' then 1 else 0 end)/count(*),2) as discount_rate from customers
group by  item_purchased
order by discount_rate desc
limit 5;


with cte as(select customer_id, case when previous_purchases = 1 then 'New Customer'
when previous_purchases between 2 and 10 then 'Returning customer'
when previous_purchases > 10 then 'Loyal customer'
else 'No order History' end as Relationship_status
 from customers)
 select relationship_status,count(*) as Relationship_count from cte
 group by relationship_status;
 
 
with cte as(select item_purchased,category,count(*) as item_count,
row_number() over (partition by category order by count(*) desc,item_purchased desc) as Product_rank  from customers
group by item_purchased,category)
select *
from cte where product_rank <=3;


select count(customer_id) as repeat_buyer,subscription_status from customers
where previous_purchases > 5
group by subscription_status;


select sum(purchase_amount) as Revenue,age_group from customers
group by age_group
order by revenue desc;








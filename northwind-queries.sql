-- Task 1

select product_name as Product, company_name as Company 
from products 
left join suppliers on products.supplier_id = suppliers.supplier_id
order by product, company;

--Task 2

select suppliers.company_name as Company, count (*) as NumberOfProducts
from suppliers  
right join products on products.supplier_id = suppliers.supplier_id
group by suppliers.supplier_id
order by count(*);

--Task 3

select suppliers.company_name, count (*) as NumberOfProducts
from suppliers  
right join products on products.supplier_id = suppliers.supplier_id
group by suppliers.supplier_id
having count (*) >= 5
order by count(*);

--Task 4

select company_name as CompanyName,
array_to_string(array_agg(orders.order_id), ',') as Orders
from customers
left join orders on customers.customer_id = orders.customer_id 
group by customers.company_name
order by companyname;

--Task 5

select company_name as Company, product_name as Product, unit_price as Price
from products
left join suppliers on products.supplier_id = suppliers.supplier_id
where unit_price = (select max(unit_price) from products);


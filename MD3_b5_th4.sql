create view customer_view as
select customerNumber, customerName, phone
from customers;
select * from customer_view;
create or replace view view_name as 
select customerNumber, customerName, contactFirstName,contactLastName,phone
from customers
where city = 'Nantes';
drop view view_name;
drop view customer_view;
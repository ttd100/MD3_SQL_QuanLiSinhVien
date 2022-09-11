SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

alter table customers add index idx_customerName(customerName);
alter table customers add index idx_full_name(contactFirstName, contactLastName);
explain select * from  customers where contactFirstName = 'Jean' or contactLastName = 'king';
alter table customers drop index idx_full_name
create database if not exists Sales;
use sales;

create table sales
(
	purchase_num int not null auto_increment,
    date_of_purchase date not null,
    customer_id int,
    item_code varchar(10) not null,
primary key (purchase_num),
foreign key (customer_id) references customers(customer_id) on delete cascade
);

-- or we can do this: alter table sales
-- foreign key (customer_id) references customers(customer_id) on delete cascade;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

alter table customers
add column gender enum('M', 'F') after last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

create table items
(
	item_code varchar(255),
    item varchar(255),
    unit_price numeric (10,2),
    ocmpany_id varchar(255),
primary key (item_code)
);

create table companies
(
	company_id varchar(255),
    company_name varchar(255) not null,
    headquarters_phone_number varchar(255) default "X",
primary key (company_id),
unique key (headquarters_phone_number)
);

alter table companies
modify company_name varchar(255) null;

alter table companies
change column headquarters_phone_number
headquarters_phone_number varchar(255) not null;

select * from sales.sales;
select * from sales;

drop table sales;
drop table customers;
drop table items;
drop table companies;
Create Database if not exists `order-directory` ;
use `order-directory`;

create table if not exists SUPPLIER(
supp_ID int primary key, supp_Name varchar(50) not null, supp_City varchar (50), supp_Phone varchar(10) not null
);
create table if not exists CUSTOMER(
cust_ID int not null, cust_Name varchar(20) not null, cust_Phone varchar(10) not null, cust_City varchar (30), cust_Gender char,
primary key(cust_ID));
create table if not exists CATEGORY(
cate_ID int not null, cate_Name varchar(20) not null, primary key (cate_ID)
);
create table if not exists PRODUCT(
prod_ID int not null, prod_Name varchar(20) not null default"Dummy", prod_Desc varchar(60), cate_ID int not null, primary key (prod_ID),
foreign key (cate_ID) references category(cate_ID)
);
create table if not exists SUPPLIER_PRICING (
pricing_ID int not null,prod_ID int not null,supp_ID int not null,supp_Price int default 0,primary key (pricing_ID),foreign key (prod_ID) references product (prod_ID),
foreign key (supp_ID) references supplier(supp_ID)
);
create table if not exists  `ORDER` (
ord_ID int not null, ord_Amount int not null, ord_Date date, cust_ID int not null, pricing_ID int not null, primary key (ord_ID), 
foreign key (cust_ID) references Customer(cust_ID),
foreign key (pricing_ID) references supplier_pricing (pricing_ID)
);
create table if not exists RATING (
rat_ID int not null, ord_ID int not null, rat_Ratstars int not null, primary key (rat_ID), 
foreign key (ord_ID) references `order`(ord_ID)
);

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-0-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

select count(t2.cust_Gender) as NoOfCustomers, t2.cust_Gender from
(select t1.cust_ID, t1.cust_Gender, t1.ord_Amount, t1.cust_Name from
(select `order`.*, customer.cust_Gender, customer.cust_Name from `order` inner join customer where `order`.cust_ID=customer.cust_ID having`order`.ord_Amount>=3000)
as t1 group by t1.cust_ID) as t2 group by t2.cust_Gender;
select * from customer;
select * from `order`;
select product.prod_name, `order`.* from `order`, supplier_Pricing, product
where `order`.cust_ID=2 and
`order`.pricing_ID=supplier_Pricing.pricing_ID and supplier_Pricing.prod_ID=product.prod_ID;
select supplier.* from supplier where supplier.supp_ID in
(select supp_ID from supplier_Pricing group by supp_ID having
count(supp_ID)>1)
group by supplier.supp_ID;
select category.cate_ID,category.cate_Name, min(t3.min_price) as Min_Price from category inner join
(select product.cate_ID, product.prod_Name, t2.* from product inner join
(select prod_ID, min(supp_price) as Min_Price from supplier_Pricing group by prod_ID)
as t2 where t2.prod_ID = product.prod_ID)
as t3 where t3.cate_ID = category.cate_ID group by t3.cate_ID;
select product.prod_ID,product.prod_Name from `order` inner join supplier_pricing on supplier_pricing.Pricing_ID=`order`.pricing_ID inner join product
on product.prod_ID=supplier_Pricing.prod_ID where `order`.ord_date>"2021-10-05";
select customer.cust_Name,customer.cust_Gender from customer where customer.cust_Name like 'A%' or customer.cust_Name like '%A';

DELIMITER &&
CREATE PROCEDURE PROC()
select report.supp_ID,report.supp_Name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supp_ID, supplier.supp_Name, final.Average from
(select test2.supp_ID, sum(test2.rat_Ratstars)/count(test2.rat_Ratstars) as Average from
(select supplier_pricing.supp_ID, test.ord_ID, test.rat_Ratstars from supplier_pricing inner join
(select `order`.pricing_ID, rating.ord_ID, rating.rat_Ratstars from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_ID = supplier_pricing.Pricing_ID)
as test2 group by supplier_pricing.supp_ID)
as final inner join supplier where final.supp_ID = supplier.supp_ID) as report ;
 &&
DELIMITER ;


call PROC();
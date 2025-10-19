# This script performs extraction of the 2017, 2018, and 2019 product order data sets
# Note: This script will require the following files:
#		2017_product_data_students-final.csv
#		2018_product_data_students-final.csv
#		2019_product_data_students-final.csv
# where the filepaths used in lines 166, 190, and 216, should be changed to match the location of these files.
# This script will create the database and tables require as well populate the tables with the data necessary for the final query as requested.

-- -----------------------------------------------------
-- Schema candy
-- -----------------------------------------------------
Drop database if exists candy;
Create Database candy;
use candy;
DROP TABLE if exists business_unit ; 
DROP TABLE if exists product_BU ; 

-- A business unit is division of the company

CREATE TABLE Business_Unit (
BU_ID INTEGER PRIMARY KEY auto_increment,
BU_Name VARCHAR(25),
BU_Designation VARCHAR(25)
);

-- Each product is assigned to one business unit for a given year

CREATE TABLE Product_BU (
Prod_BU_ID INTEGER PRIMARY KEY auto_increment,
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Prod_BU_Year INT(4)
);


-- Adding records to the Business Unit table
INSERT INTO Business_Unit (BU_Name, BU_Designation)
VALUES
('Snack', 'Growth'),
('On the go', 'Growth'),
('Energy', 'Growth'),
('Health', 'Mature'),
('Lunchtime', 'Mature'),
('Sugar', 'Decline'),
('GMO', 'Decline'),
('Vegan', 'Rising Star'),
('Non-GMO','Rising Star'),
('MSG','Discontinued'),
('Breakfast','Staples'),
('Performance','Staples')
;


-- Adding records to the Product/Business Unit table
INSERT INTO Product_BU (BU_Name, Product_Name, Prod_BU_Year)
VALUES
('On the go', 'Blue Rock Candy', '2017'),
('On the go', 'Blue Rock Candy', '2018'),
('On the go', 'Blue Rock Candy', '2019'),
('Snack', 'Crocodile Tears', '2017'),
('Snack', 'Crocodile Tears', '2018'),
('Snack', 'Crocodile Tears', '2019'),
('Sugar', 'Giant Gummies', '2017'),
('Sugar', 'Giant Gummies', '2018'),
('Sugar', 'Giant Gummies', '2019'),
('Sugar', 'Green Lightning', '2017'),
('Lunchtime', 'Green Lightning', '2018'),
('Lunchtime', 'Green Lightning', '2019'),
('GMO', 'Grey Gummies', '2017'),
('GMO', 'Grey Gummies', '2018'),
('GMO', 'Grey Gummies', '2019'),
('Sugar', 'Nap Be Gone', '2017'),
('Sugar', 'Nap Be Gone', '2018'),
('Sugar', 'Nap Be Gone', '2019'),
('GMO', 'Orange Creepies', '2017'),
('GMO', 'Orange Creepies', '2018'),
('Lunchtime', 'Orange Creepies', '2019'),
('Health', 'Panda Gummies', '2017'),
('Health', 'Panda Gummies', '2018'),
('Health', 'Panda Gummies', '2019'),
('On the go', 'Pink Bubble Gum', '2017'),
('On the go', 'Pink Bubble Gum', '2018'),
('On the go', 'Pink Bubble Gum', '2019'),
('Energy', 'Purple Pain', '2017'),
('Energy', 'Purple Pain', '2018'),
('Energy', 'Purple Pain', '2019'),
('Energy', 'Red Hot Chili Peppers', '2017'),
('Energy', 'Red Hot Chili Peppers', '2018'),
('Energy', 'Red Hot Chili Peppers', '2019'),
('Lunchtime', 'Yellow Zonkers', '2017'),
('Lunchtime', 'Yellow Zonkers', '2018'),
('Lunchtime', 'Yellow Zonkers', '2019'),
('Vegan','Mr Greens','2017'),
('Vegan','Mr Greens','2018'),
('Vegan','Mr Greens','2019'),
('Vegan','PearApple','2017'),
('Vegan','PearApple','2018'),
('Vegan','PearApple','2019'),
('Vegan','Just The Fruit','2017'),
('Vegan','Just The Fruit','2018'),
('Vegan','Just The Fruit','2019'),
('Non-GMO','Farm Fresh','2017'),
('Non-GMO','Farm Fresh','2018'),
('Non-GMO','Farm Fresh','2019'),
('Non-GMO','Organiks','2017'),
('Non-GMO','Organiks','2018'),
('Non-GMO','Organiks','2019'),
('Non-GMO','GMO Guardian','2017'),
('Non-GMO','GMO Guardian','2018'),
('Non-GMO','GMO Guardian','2019'),
('MSG','Ultra-Salty Chips','2017'),
('MSG','Ultra-Salty Chips','2018'),
('MSG','Ultra-Salty Chips','2019'),
('MSG','Cheezos','2017'),
('MSG','Cheezos','2018'),
('MSG','Cheezos','2019'),
('MSG','Funky Pops','2017'),
('MSG','Funky Pops','2018'),
('MSG','Funky Pops','2019'),
('Breakfast','Only Pancakes','2017'),
('Breakfast','Only Pancakes','2018'),
('Breakfast','Only Pancakes','2019'),
('Breakfast','Future Toast','2017'),
('Breakfast','Future Toast','2018'),
('Breakfast','Future Toast','2019'),
('Breakfast','Big Waffle','2017'),
('Breakfast','Big Waffle','2018'),
('Breakfast','Big Waffle','2019'),
('Performance','Rotpunkt','2017'),
('Performance','Rotpunkt','2018'),
('Performance','Rotpunkt','2019'),
('Performance','Power Gels','2017'),
('Performance','Power Gels','2018'),
('Performance','Power Gels','2019'),
('Performance','Meat B Gone','2017'),
('Performance','Meat B Gone','2018'),
('Performance','Meat B Gone','2019')
;

-- -----------------------------------------------------
-- Table `candy`.`2017_product_data_students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candy`.`ProdData2017` ;
CREATE TABLE IF NOT EXISTS `candy`.`ProdData2017` (
  `ID` INT(11) NULL DEFAULT NULL, -- record ID number
  `Month` INT(11) NULL DEFAULT NULL, -- month of the sale
  `Country` TEXT NULL DEFAULT NULL, -- USA
  `Region` TEXT NULL DEFAULT NULL, -- regions within the country
  `State` TEXT NULL DEFAULT NULL, -- two characters, each state is within one region
  `Product` TEXT NULL DEFAULT NULL, -- name of a package food product
  `Per_Unit_Price` INT(11) NULL DEFAULT NULL, -- in cents
  `Quantity` INT(11) NULL DEFAULT NULL, -- how many items were in that particular order
  `Order_Total` INT(11) NULL DEFAULT NULL) -- per-unit price x the quantity
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
-- Import 2017 Data from csv file
-- The filepath for .csv file must be changed to reflect its location on your local machine
Load Data Local Infile 'C:/Users/tnguyen/2017_product_data_students-final.csv'
Into Table ProdData2017
Fields Terminated By ','
Lines Terminated By '\r\n'
Ignore 1 rows;

-- -----------------------------------------------------
-- Table `candy`.`2018_product_data_students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candy`.`ProdData2018` ;

CREATE TABLE IF NOT EXISTS `candy`.`ProdData2018` (
  `ID` INT(11) NULL DEFAULT NULL, -- record ID number
  `Month` INT(11) NULL DEFAULT NULL, -- month of the sale
  `Region` TEXT NULL DEFAULT NULL, -- regions within the country
  `Customer_ID` INT(11) NULL DEFAULT NULL, -- customer ID number
  `Product` TEXT NULL DEFAULT NULL, -- The product name is consistent between 2017, 2018, and 2019
  `Per_Unit_Price` INT(11) NULL DEFAULT NULL, -- in cents
  `Quantity_1` INT(11) NULL DEFAULT NULL, -- how many items were in the first shipment of that particular order
  `Quantity_2` INT(11) NULL DEFAULT NULL) -- how many items were in the first shipment of that particular order
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
-- Import 2018 Data from csv file
-- The filepath for .csv file must be changed to reflect its location on your local machine
Load Data Local Infile 'C:/Users/tnguyen/2018_product_data_students-final.csv'
Into Table ProdData2018
Fields Terminated By ','
Lines Terminated By '\r\n'
Ignore 1 rows;

-- -----------------------------------------------------
-- Table `candy`.`2019_product_data_students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candy`.`ProdData2019` ;

CREATE TABLE IF NOT EXISTS `candy`.`ProdData2019` (
  `ID` INT(11) NULL DEFAULT NULL, -- record ID number
  `Month` INT(11) NULL DEFAULT NULL, -- month of the sale
  `Country` TEXT NULL DEFAULT NULL, -- USA
  `Region` TEXT NULL DEFAULT NULL, -- regions within the country
  `State` TEXT NULL DEFAULT NULL, -- two characters, each state is within one region 
  `Product` TEXT NULL DEFAULT NULL, -- Same as in 2017 and 2018 data
  `Per_Unit_Price` INT(11) NULL DEFAULT NULL, -- in cents
  `Quantity` INT(11) NULL DEFAULT NULL, -- how many items were in that particular order
  `Order_Subtotal` INT(11) NULL DEFAULT NULL, -- per-unit price x quantity
  `Quantity_Discount` INT(11) NULL DEFAULT NULL) -- 10% discount on all orders 91 units and up
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
-- Import 2019 Data from csv file
-- The filepath for .csv file must be changed to reflect its location on your local machine
Load Data Local Infile 'C:/Users/tnguyen/2019_product_data_students-final.csv'
Into Table ProdData2019
Fields Terminated By ','
Lines Terminated By '\r\n'
Ignore 1 rows;

-- -----------------------------------------------------
-- Create a table named combinedOrders to join table data from 
-- the 201x_product_data_students tables with standardized columns
-- such as Product name, region, Year, Month, Quantity 
-- and true Order Total based on the conditions of each data set
-- -----------------------------------------------------

DROP TABLE IF EXISTS `combinedOrders`;
CREATE TABLE IF NOT EXISTS `combinedOrders` (
  `Product` VARCHAR(25) NULL DEFAULT NULL, -- product name
  `Region` VARCHAR(25) NULL DEFAULT NULL, -- regions within the country
  `Year` INT(4) NULL DEFAULT NULL, -- product year
  `Month` INT(2) NULL DEFAULT NULL, -- month of the sale
  `Quantity` INT NULL DEFAULT NULL, -- Normal for 2017, Quantity 1 and 2 for 2018, Normal for 2019
  `Order_Total` INT NULL DEFAULT NULL -- Order total for 2017, Quantity x PerUnitPrice for 2018, =2019 requires final order total for orders > 90
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Transformation
-- Data is entered from the 2017-2019 data tables into temporary table "combinedOrders"
-- -----------------------------------------------------
-- No changes are made to the 2017 data to fit criteria
INSERT INTO combinedOrders (`Product`,`Region`,`Year`,`Month`,`Quantity`,`Order_Total`)
SELECT Product, Region, '2017', Month, Quantity, Order_Total
FROM ProdData2017;

-- 2018 Data requires restructuring due to the shipping problems splitting the quantity
-- Quantities are added together, and Order Total is calculated based on total quantity and provided Unit Price of product
INSERT INTO combinedOrders (`Product`,`Region`,`Year`,`Month`,`Quantity`,`Order_Total`)
SELECT Product, Region, '2018', Month, (Quantity_1+Quantity_2), Per_Unit_Price*(Quantity_1+Quantity_2)
FROM ProdData2018;

-- 2019 data required changes for Order_Total due to newly implemented discount policy, which is calculated based on quantity size
-- and provided into the data. Order_total calculated by subtracting discount from Order_Subtotal.
-- Discount takes into account if quantity meets discount policy criteria
INSERT INTO combinedOrders (`Product`,`Region`,`Year`,`Month`,`Quantity`,`Order_Total`)
SELECT Product, Region, '2019', Month, Quantity, (Order_SubTotal-Quantity_Discount)
from ProdData2019;

-- -----------------------------------------------------
-- Output Query to be exported into CSV
-- -----------------------------------------------------
select 
	business_unit.BU_Designation, ',',
	product_bu.BU_Name, ',',
    combinedOrders.Product, ',',
	combinedOrders.Region,  ',',
	combinedOrders.Year, ',',
    combinedOrders.Month, ',',
    sum(combinedOrders.Quantity) as 'Quantity_Sum', ',',
    sum(combinedOrders.Order_Total) as 'Order_Total_Sum'
from combinedOrders
left join product_bu on combinedOrders.Product = product_bu.Product_Name and combinedOrders.Year = product_bu.Prod_BU_Year
left join business_unit on business_unit.BU_Name = product_bu.BU_Name
	# Left join to ensure the query returns values that match with the values from product_bu and business_unit
    # Because product_bu assigns different BU_IDs to the same products based on the year, the join statement with product_bu
    # specifies both the product name AND year in joining product_bu and combinedOrders
where business_unit.BU_Designation in ('Growth', 'Mature') 
group by 
	business_unit.BU_Designation, 
	product_bu.BU_Name,
    combinedOrders.Product,
	combinedOrders.Region, 
	combinedOrders.Year,
    combinedOrders.Month
order by
	business_unit.BU_Designation asc, 
	product_bu.BU_Name asc,
    combinedOrders.Product asc,
	combinedOrders.Region asc, 
	combinedOrders.Year asc,
    combinedOrders.Month asc,
    Quantity_Sum asc,
    Order_Total_Sum asc
;
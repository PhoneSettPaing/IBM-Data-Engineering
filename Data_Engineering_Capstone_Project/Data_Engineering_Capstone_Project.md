# IBM Data Engineering Capstone Project

## Project Overview
As part of the Capstone project, you will assume the role of an Associate Data Engineer who has recently joined an e-commerce organization. You will be presented with a business challenge that requires building a data platform for retailer data analytics.

In this Capstone project, you will:
* Design a data platform that uses MySQL as an OLTP database and MongoDB as a NoSQL database.
* Design and implement a data warehouse and generate reports from the data.
* Design a reporting dashboard that reflects the key metrics of the business.
* Extract data from OLTP and NoSQL databases, transform it and load it into the data warehouse, and then create an ETL pipeline.
* And finally, create a Spark connection to the data warehouse, and then deploy a machine learning model.

The Capstone project is divided into 6 Modules:
* In Module 1, you will design the OLTP database for an E-Commerce website, populate the OLTP Database with the data provided and automate the export of the daily incremental data into the data warehouse.
* In Module 2, you will set up a NoSQL database to store the catalogue data for an E-Commerce website, load the E-Commerce catalogue data into the NoSQL database, and query the E-Commerce catalogue data in the NoSQL database.
* In Module 3, you will design the schema for a data warehouse based on the schema of the OLTP and NoSQL databases. You’ll then create the schema and load the data into fact and dimension tables, automate the daily incremental data insertion into the data warehouse, and create Cubes and Rollups to make the reporting easier.
* In Module 4, you will create a Cognos data source that points to a data warehouse table, create a bar chart of Quarterly sales of cell phones, create a pie chart of sales of electronic goods by category, and create a line chart of total sales per month for the year 2020.
* In Module 5, you will extract data from OLTP, NoSQL, and MongoDB databases into CSV format. You will then transform the OLTP data to suit the data warehouse schema and then load the transformed data into the data warehouse. Finally, you will verify that the data is loaded properly.
* In the 6 and final Module, you will use your skills in Big Data Analytics to create a Spark connection to the data warehouse, and then deploy a machine learning model on SparkML for making sales projections.

### Data Platform Architecture
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/597bd156489f2ad7f60fec471ff007a6671244e2/Data_Engineering_Capstone_Project/data_platform_architecture.png)
This is the data platform architecture of an ecommerce company named SoftCart. SoftCart uses a hybrid architecture, with some of its databases on premises and some on cloud.

### Tools and Technologies:
* OLTP database - MySQL
* NoSQL database - MongoDB
* Production Data warehouse – DB2 on Cloud
* Staging - Data warehouse – PostgreSQL
* Big data platform - Hadoop
* Big data analytics platform – Spark
* Business Intelligence Dashboard - IBM Cognos Analytics
* Data Pipelines - Apache Airflow

### Process:
SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets. All the catalogue data of the products is stored in the MongoDB NoSQL server. All the transactional data like inventory and sales are stored in the MySQL database server. SoftCart's webserver is driven entirely by these two databases. Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL. Production data warehouse is on the cloud instance of IBM DB2 server. BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards. SoftCart uses Hadoop cluster as its big data platform where all the data collected for analytics purposes. Spark is used to analyse the data on the Hadoop cluster. To move data between OLTP, NoSQL and the data warehouse, ETL pipelines are used and these run on Apache Airflow.

## [Module 1: Data Platform Architecture and OLTP Database](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database)

### OLTP database requirements and design

#### OLTP database:
OLTP database is generally used to handle everyday business transactions of an organization like a bank or a super market chain. OLTP databases can be write heavy or may have a balanced read/write load.

#### OLTP database requirements:
An OLTP database is expected to handle a huge number of transactions per second. Each transaction usually involves accessing (read/write) a small portion of the database, in other words the payload per transaction is small. The time taken to execute a transaction usually called latency needs to be very less.

#### OLTP database design:
The schema of an OLTP database is highly normalized so as to achieve a very low latency. To further improve the latency an OLTP database stores only the recent data like the last few week's data. They are usually run on storage that is very fast like SSD.

### Scenario
You are a data engineer at an e-commerce company. Your company needs you to design a data platform that uses MySQL as an OLTP database. You will be using MySQL to store the OLTP data.

### Design the OLTP Database
Creating sales database and sales_data table in sales database.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/createtable.PNG)

### Load the given data(oltpdata.csv) into sales_data table
Importing data from oltpdata.csv file into sales_data table using phpMyAdmin GUI.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/importdata.PNG)

List the tables in the sales database and query the count of records in the sales_data table to make sure the data are imported correctly and successfully.<br />
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/listtables.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/salesrows.PNG)

### Set up Admin tasks
Creating index on the timestamp field to speed up queries.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/listindexes.PNG)

Writing a bash script(datadump.sh) that exports all the rows in the sales_data table to a file named sales_data.sql to automate the export of the daily incremental data into the data warehouse.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/aa9d734b245eb08ef3d1fdf17939080bb4025dd7/Data_Engineering_Capstone_Project/1_Data_Platform_Architecture_and_OLTP_Database/Image_for_peer_graded_assignment/exportdata.PNG)

## [Module 2: Querying Data in NoSQL Databases](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases)

### Scenario
You are a data engineer at an e-commerce company. Your company needs you to design a data platform that uses MongoDB as a NoSQL database. You will be using MongoDB to store the e-commerce catalogue data.

### Importing data into MongoDB database
Installing mongoimport and mongoexport. Importing given data(catalog.json) into a database named ‘catalog’ and a collection named ‘electronics’ on mongodb server.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0e3e9c816b04837746774a0e262579d36d69c790/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/mongoimport.PNG)

List out all databases and collections on mongodb server to check if catalog database and electronics collection are created successfully or not.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/list-dbs.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/list-collections.PNG)

Creating index on the field ‘type’ for faster queries.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/create-index.PNG)

### Trying out a few queries to check the imported data:
Finding the count of laptops.<br />
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/mongo-query-laptops.PNG)

Finding the number of smart phones with screen size of 6 inches.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/mongo-query-mobiles1.PNG)

Finding the average screen size of smart phones.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/0569f01ad0d247d8c87ffe95252109c19b5dc661/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/mongo-query-mobiles2.PNG)

### Export data from MongoDB database as csv file
Exporting the fields _id, “type”, “model”, from the ‘electronics’ collection into a file named electronics.csv.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/2593ee5538736ad3755cc130ea3993647e2100e3/Data_Engineering_Capstone_Project/2_Querying_Data_in_NoSQL_Databases/Image_for_peer_graded_assignment/mongoexport.PNG)

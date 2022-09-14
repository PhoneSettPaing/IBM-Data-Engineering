# [IBM Data Engineering Capstone Project](https://www.coursera.org/learn/data-enginering-capstone-project?specialization=ibm-data-engineer)

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

## [Module 3.1: Data Warehousing](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_%26_Reporting)

### Scenario
You are a data engineer hired by an ecommerce company named SoftCart.com. The company retails download only items like E-Books, Movies, Songs etc. The company has international presence and customers from all over the world. The company would like to create a data warehouse so that it can create reports like:
* Total sales per year per country
* Total sales per month per category
* Total sales per quarter per country
* Total sales per category per country
You will use your data warehousing skills to design and implement a data warehouse for the company.

### Designing a Data Warehouse
The ecommerce company has provided you the sample data.<br />
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/ecom-sample-data.png)<br />
You will start your project by designing a Star Schema for the warehouse by identifying the columns for the various dimension and fact tables in the schema. Name your database as softcart.

Creating tables and relationships amongst created tables, using the ERD design Tool of pgAdmin.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_1/softcartRelationships.PNG)

### Create the schema
After creating tables and relationships using ERD design tool, generate the schema sql using the tool. Then use the created schema sql to create the schema in a database named staging.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_1/createschema.PNG)

## [Module 3.2: Data Warehouse Reporting](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_%26_Reporting)

### Scenario
You are a data engineer hired by an ecommerce company named SoftCart.com. The company retails download only items like E-Books, Movies, Songs etc. The company has international presence and customers from all over the world. You have designed the schema for the data warehouse in the previous assignment. Data engineering is a team game. Your senior data engineer reviewed your design. Your schema design was improvised to suit the production needs of the company. In this assignment you will generate reports out of the data in the data warehouse.

### Load data into the Data Warehouse (IBM DB2)
Loading the data provided by the company in csv format into the tables (DimDate, DimCategory, DimCountry, FactSales).
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/DimDate.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/DimCategory.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/DimCountry.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/FactSales.PNG)

### Queries for data analytics
Creating and running queries to check if the created data warehouse can create reports.

Grouping sets query using the columns country, category, totalsales. (Total sales per country and Total sales per category)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/groupingsets.PNG)

Rollup query using the columns year, country, and totalsales. (Total sales per year per country and Total sales per year)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/rollup.PNG)

Cube query using the columns year, country, and average sales. (Average sales per year per country, Average sales per year, Average sales per country)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/cube.PNG)

Creating a materialized query table (MQT) named total_sales_per_country that has the columns country and total_sales to improve the performance of complex queries that operate on very large amounts of data.<br />
Db2 uses a materialized query table to precompute the results of data that is derived from one or more tables. When you submit a query, Db2 can use the results that are stored in a materialized query table rather than compute the results from the underlying source tables on which the materialized query table is defined.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e7708b4f3b027771459ed00a859467a210da001c/Data_Engineering_Capstone_Project/3_Build_a_Data_Warehouse_&_Reporting/Image_for_peer_graded_assignment/Part_2/mqt.PNG)

## [Module 4: Data Analytics & Dashboard Creation](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/4_Data_Analytics_%26_Dashboard_Creation)

### Scenario
You are a data engineer at an e-commerce company. Your company has finished setting up a data warehouse. Now you are assigned the responsibility to design a reporting dashboard that reflects the key metrics of the business.

### Load data into the data warehouse (IBM DB2)
Importing the data in the given file “ecommerce.csv” into a table named sales_history.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/dataimport.PNG)

Listing the first 10 rows in the sales_history table to check the loaded data.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/top10rows.PNG)

### Create data source in IBM Cognos
Creating connection between sales_history table in IBM DB2 and Watson Studio with added Cognos Dashboard Embedded (CDE) service to use it as a data source.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/extra_images/datasource_connecting_Db2.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/extra_images/datasource_connecting_IBMDb2.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/extra_images/datasource_fromDb2_addtable.PNG)
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/datasource.PNG)

### Create dashboard using IBM Cognos
Creating a line chart of month wise total sales for the year 2020.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/linechart.PNG)

Creating a pie chart of category wise total sales.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/piechart.PNG)

Creating a bar chart of Quarterly sales of mobile phones.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/da0f3bdb4df5943c21186a08fc0ae7586abfffad/Data_Engineering_Capstone_Project/4_Data_Analytics_&_Dashboard_Creation/Image_for_peer_graded_assignment/barchart.PNG)

## [Module 5.1: ETL](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/5_ETL_%26_Data_Pipelines_using_Apache_Airflow)

### Assignment Overview
The Data Warehouse gets information from several sources including the transactional (OLTP) database. Transactional data from the OLTP database (in this case MySQL) needs to be propagated to the Warehouse on frequent basis. This data movement can be updated using ETL processes.

In this first part of the assignment, you will setup an ETL process using Python to extract new transactional data for each day from the MySQL database, transform it and then load it into the data warehouse in DB2.

You will begin by preparing the lab environment by starting the MySQL server. You will then create a sales database in MySQL and import the sales.sql into the sales database. Next, you will verify your access to the cloud instance of the IBM DB2 server. You will then be uploading the sales.csv to a table in DB2. To do so you will download the python files that have the template code to connect to MySQL and DB2 databases.

The final task requires you to automate the extraction of daily incremental data and load yesterday's data into the data warehouse. You will download the python script from this link and use it as a template to write a python script that automatically loads yesterday's data from the production database into the data warehouse. After performing each task, take a screenshot of the command you used and its output, and name the screenshot.

### Scenario
You are a data engineer at an e-commerce company. You need to keep data synchronized between different databases/data warehouses as a part of your daily routine. One task that is routinely performed is the sync up of staging data warehouse and production data warehouse. Automating this sync up will save you a lot of time and standardize your process. You will be given a set of python scripts to start with. You will use/modify them to perform the incremental data load from MySQL server which acts as a staging warehouse to the IBM DB2 which is a production data warehouse. This script will be scheduled by the data engineers to sync up the data between the staging and production data warehouse.

### Automate loading of incremental data into the data warehouse
Creating the function get_last_rowid() that connect to the DB2 data warehouse and return the last rowid of the table sales_data.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/22a1fe90af5f710aaf9f2dfab457b96351a9d362/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_1/get_last_rowid.PNG)

Creating the function get_latest_records() that connect to MySQL database and return all records later than the given last_rowid from DB2 data warehouse.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/22a1fe90af5f710aaf9f2dfab457b96351a9d362/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_1/get_latest_records.PNG)

Creating the function insert_records() that connect to the DB2 data warehouse and insert all the given records (latest records from MySQL database).
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/22a1fe90af5f710aaf9f2dfab457b96351a9d362/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_1/insert_records.PNG)

### Testing the data synchronization
Cleaned Data in DB2 data warehouse before synchronization.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/579ffe1302f2709758e69794d8b53f8a5b295c51/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Extra_image/last_row_record_b4_automation.PNG)

Running automation.py for data synchronization.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/579ffe1302f2709758e69794d8b53f8a5b295c51/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_1/synchronization.PNG)

Data in DB2 data warehouse after synchronization.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/579ffe1302f2709758e69794d8b53f8a5b295c51/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Extra_image/last_row_record_after_automation.PNG)
Data have been successfully synchronized.

## [Module 5.2: Data Pipelines using Apache Airflow](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/5_ETL_%26_Data_Pipelines_using_Apache_Airflow)

### Assignment Overview
Our data platform includes a Big Data repository that is used for analytics using Machine Learning with Apache Spark. This Big Data repository gets data from several sources including the Data Warehouse and the Web Server log. As data from the web server log is logged, it needs to be added to the Big Data system on a frequent basis - making it an ideal process to automate using a data pipeline.

In this second part of the assignment, you will create and run a DAG using Apache Airflow to extract daily data from the web server log, process it, and store it in a format to prepare it for loading into the Big Data platform.

To complete this part of the assignment, you will perform a couple of exercises, but before proceeding with the assignment, you will prepare the lab environment by starting the Apache Airflow and then downloading the dataset from the source (link provided) to the mentioned destination. In the first exercise, you will perform a series of tasks to create a DAG that runs daily. You will create a task that extracts the IP address field from the webserver log file and then saves it into a text file. The next task creation requires you to This task should filter out all the occurrences of ipaddress "198.46.149.143" from text file and save the output to a new text file. In the final task creation, you will load the data by archiving the transformed text file into a TAR file. Before moving on to the next exercise, you will define the task pipeline as per the given details.

In the second exercise, you will get the DAG operational by saving the defined DAG into a PY file. Further, you will submit, unpause and then monitor the DAG runs for the Airflow console. After performing each task, take a screenshot of the command you used and its output, and name the screenshot.

### Scenario
Write a pipeline that analyses the web server log file, extracts the required fields, transforms and load.

### Creating Data Pipelines using Apache Airflow
Defining the DAG arguments.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/dag_args.PNG)

Defining the DAG.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/dag_definition.PNG)

Creating a task to extract the ip address field from the web server log file into extracted_data.txt file.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/extract_data.PNG)

Creating a task to filter out all the occurrences of ip address “198.46.149.143” from extracted_data.txt file into transformed_data.txt file.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/transform_data.PNG)

Creating a task to archive the file transformed_data.txt file into weblog.tar file.
![alt txt](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/load_data.PNG)

Defining the task pipeline.
![alt txt](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/pipeline.PNG)

### Getting the DAG operational
Submitting the DAG.
![alt txt](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/submit_dag.PNG)

Unpausing the DAG.
![alt txt](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/unpause_dag.PNG)

Monitoring the DAG.
![alt txt](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/9c5d0dd7c5b07e3bb4b9c2609cbf567a67a9d447/Data_Engineering_Capstone_Project/5_ETL_&_Data_Pipelines_using_Apache_Airflow/Image_for_peer_graded_assignment/Part_2/dag_runs.PNG)

## [Module 6: Big Data Analytics with Spark](https://github.com/PhoneSettPaing/IBM-Data-Engineering/tree/main/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark)

### Assignment Overview
In this assignment, you will perform a number of tasks to analyze search terms on the e-commerce web server. You will work in Watson Studio within a Jupyter notebook to run your analysis against a CSV file containing the webserver data. You will load this file into a Spark data frame and print the results of your queries against this data set. You will then load a pre-trained sales forecasting model and use this to predict the sales for next year.

### Analyse search terms on the e-commerce web server

Installing and starting spark session. Downloading the search term data set for the e-commerce web server.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/Starting_spark_session.PNG)

Printing the number of rows and columns in the data set.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/shape.PNG)

Printing the top 5 rows in the data set.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/top5rows.PNG)

Finding the data type of the column “searchterm”.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/datatype.PNG)

Finding the number of times, the term “gaming laptop” was searched.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/gaminglaptop.PNG)

Printing the top 5 frequently used search terms.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/top5terms.PNG)

Loading the sales forecast model.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/loadmodel.PNG)

Predicting the sales for the year 2023, using the sales forecast model.
![alt text](https://github.com/PhoneSettPaing/IBM-Data-Engineering/blob/e33d922e49c6e3c5038b218eb3f3bd0c334e091f/Data_Engineering_Capstone_Project/6_Big_Data_Analytics_with_Spark/Image_for_peer_graded_assignment/forecast.PNG)

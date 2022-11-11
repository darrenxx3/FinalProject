USE mobapp;
DROP DATABASE IF EXISTS mobapp;
CREATE DATABASE mobapp;
USE mobapp;

CREATE TABLE IF NOT EXISTS Roles (
    role_id CHAR(10) NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (role_id)
);
CREATE TABLE IF NOT EXISTS Status (
    status_id CHAR(10) NOT NULL,
    status_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (status_id)
);
CREATE TABLE IF NOT EXISTS PaymentCategory (
    category_id CHAR(10) NOT NULL,
    payment_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (category_id)
);
CREATE TABLE IF NOT EXISTS Food (
    food_id CHAR(10) NOT NULL,
    food_name VARCHAR(50) NOT NULL,
    food_price INT NOT NULL,
    PRIMARY KEY (food_id)
);
CREATE TABLE IF NOT EXISTS OrderDetail (
    orderDetail_id CHAR(10) NOT NULL,
    food_id CHAR(10) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (orderDetail_id),
    FOREIGN KEY (food_id) REFERENCES Food(food_id)
);
CREATE TABLE IF NOT EXISTS Payment (
    payment_id CHAR(10) NOT NULL,
    category_id CHAR(10) NOT NULL,
    totalPayment INT NOT NULL,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (category_id) REFERENCES PaymentCategory(category_id)
);

CREATE TABLE IF NOT EXISTS Users (
    user_id CHAR(10) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id CHAR(10) NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id),
    UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id CHAR(10) NOT NULL,
    user_id CHAR(10) NOT NULL,
    status_id CHAR(10) NOT NULL,
    payment_id CHAR(10) NOT NULL,
    orderDate DATETIME NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (status_id) REFERENCES Status(status_id),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);


INSERT INTO Roles VALUES ("ROLES00001", "Customer");
INSERT INTO Roles VALUES ("ROLES00002", "Merchant");
INSERT INTO Roles VALUES ("ROLES00003", "Admin");

INSERT INTO Users VALUES ("C000000001","Customer1", "pass", "email@a.com", "ROLES00001");
INSERT INTO Users VALUES ("C000000002","Customer2", "pass", "email@a1.com", "ROLES00001");
INSERT INTO Users VALUES ("C000000003","Customer3", "pass", "email@a2.com", "ROLES00001");
INSERT INTO Users VALUES ("M000000001","Merchant1", "pass", "email@merchant.com", "ROLES00002");
INSERT INTO Users VALUES ("A000000001","Admin1", "pass", "email@admin.com", "ROLES00003");
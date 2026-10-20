
CREATE DATABASE IF NOT EXISTS WasteWise;
USE WasteWise;

CREATE TABLE Food_Items (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    food_id INT NOT NULL,
    supplier_id INT NOT NULL,
    quantity INT NOT NULL,
    expiry_date DATE,
    FOREIGN KEY (food_id) REFERENCES Food_Items(food_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    food_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (food_id) REFERENCES Food_Items(food_id)
);

CREATE TABLE Waste_Records (
    waste_id INT PRIMARY KEY AUTO_INCREMENT,
    food_id INT NOT NULL,
    quantity_wasted INT NOT NULL,
    waste_reason VARCHAR(100),
    waste_date DATE NOT NULL,
    FOREIGN KEY (food_id) REFERENCES Food_Items(food_id)
);


USE WasteWise;

INSERT INTO Food_Items (food_name, category, price)
VALUES
('Veg Biryani', 'Main Course', 120.00),
('Paneer Curry', 'Main Course', 150.00),
('Samosa', 'Snacks', 20.00),
('Dosa', 'Breakfast', 60.00),
('Gulab Jamun', 'Dessert', 40.00);

INSERT INTO Suppliers (supplier_name, phone)
VALUES
('Fresh Farms', '9876543210'),
('Daily Foods', '9876501234'),
('Green Market', '9123456780');

INSERT INTO Inventory
(food_id, supplier_id, quantity, expiry_date)
VALUES
(1, 1, 30, '2026-10-25'),
(2, 2, 20, '2026-10-23'),
(3, 3, 100, '2026-10-22'),
(4, 1, 40, '2026-10-24'),
(5, 2, 50, '2026-10-21');

INSERT INTO Sales (food_id, quantity_sold, sale_date)
VALUES
(1, 20, '2026-10-19'),
(2, 12, '2026-10-19'),
(3, 70, '2026-10-19'),
(4, 25, '2026-10-19'),
(5, 30, '2026-10-19'),
(1, 15, '2026-10-20'),
(3, 20, '2026-10-20');

INSERT INTO Waste_Records
(food_id, quantity_wasted, waste_reason, waste_date)
VALUES
(1, 5, 'Overproduction', '2026-10-19'),
(2, 3, 'Expired', '2026-10-19'),
(3, 10, 'Unsold food', '2026-10-19'),
(4, 4, 'Overproduction', '2026-10-20'),
(5, 8, 'Expired', '2026-10-20'),
(1, 2, 'Unsold food', '2026-10-20');


USE WasteWise;

-- View: Shows total waste and estimated money lost
DROP VIEW IF EXISTS Waste_Summary;

CREATE VIEW Waste_Summary AS
SELECT
    f.food_id,
    f.food_name,
    SUM(w.quantity_wasted) AS total_wasted,
    SUM(w.quantity_wasted * f.price) AS money_lost
FROM Food_Items f
JOIN Waste_Records w ON f.food_id = w.food_id
GROUP BY f.food_id, f.food_name;


-- Stored procedure: Generates a waste report
DROP PROCEDURE IF EXISTS GetWasteReport;

DELIMITER //

CREATE PROCEDURE GetWasteReport()
BEGIN
    SELECT food_name, total_wasted
    FROM Waste_Summary
    ORDER BY total_wasted DESC;
END //

DELIMITER ;


-- Trigger: Prevents invalid waste quantities
DROP TRIGGER IF EXISTS CheckWasteQuantity;

DELIMITER //

CREATE TRIGGER CheckWasteQuantity
BEFORE INSERT ON Waste_Records
FOR EACH ROW
BEGIN
    IF NEW.quantity_wasted <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity must be greater than zero';
    END IF;
END //

DELIMITER ;

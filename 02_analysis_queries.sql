
USE WasteWise;

-- 1. Display all food items
SELECT * FROM Food_Items;

-- 2. Total waste for each food item
SELECT f.food_name,
       SUM(w.quantity_wasted) AS total_wasted
FROM Food_Items f
JOIN Waste_Records w ON f.food_id = w.food_id
GROUP BY f.food_id, f.food_name;

-- 3. Estimated financial loss by food item
SELECT f.food_name,
       SUM(w.quantity_wasted) AS total_wasted,
       SUM(w.quantity_wasted * f.price) AS money_lost
FROM Food_Items f
JOIN Waste_Records w ON f.food_id = w.food_id
GROUP BY f.food_id, f.food_name;

-- 4. Most wasted food item
SELECT f.food_name,
       SUM(w.quantity_wasted) AS total_wasted
FROM Food_Items f
JOIN Waste_Records w ON f.food_id = w.food_id
GROUP BY f.food_id, f.food_name
ORDER BY total_wasted DESC
LIMIT 1;

-- 5. Total sales quantity for each food
SELECT f.food_name,
       SUM(s.quantity_sold) AS total_sold
FROM Food_Items f
JOIN Sales s ON f.food_id = s.food_id
GROUP BY f.food_id, f.food_name;

-- 6. Total estimated revenue by food item
SELECT f.food_name,
       SUM(s.quantity_sold * f.price) AS revenue
FROM Food_Items f
JOIN Sales s ON f.food_id = s.food_id
GROUP BY f.food_id, f.food_name;

-- 7. Inventory expiring by a specified date
SELECT f.food_name, i.quantity, i.expiry_date
FROM Food_Items f
JOIN Inventory i ON f.food_id = i.food_id
WHERE i.expiry_date <= '2026-10-23';

-- 8. Waste by reason
SELECT waste_reason,
       SUM(quantity_wasted) AS total_wasted
FROM Waste_Records
GROUP BY waste_reason
ORDER BY total_wasted DESC;

-- 9. Daily waste and estimated loss
SELECT w.waste_date,
       SUM(w.quantity_wasted) AS total_wasted,
       SUM(w.quantity_wasted * f.price) AS money_lost
FROM Waste_Records w
JOIN Food_Items f ON w.food_id = f.food_id
GROUP BY w.waste_date
ORDER BY w.waste_date;

-- 10. Rank foods by total waste
SELECT food_name, total_wasted,
       DENSE_RANK() OVER (
           ORDER BY total_wasted DESC
       ) AS waste_rank
FROM (
    SELECT f.food_id, f.food_name,
           SUM(w.quantity_wasted) AS total_wasted
    FROM Food_Items f
    JOIN Waste_Records w ON f.food_id = w.food_id
    GROUP BY f.food_id, f.food_name
) AS waste_totals;

-- 11. Find foods never recorded as wasted
SELECT f.food_name
FROM Food_Items f
LEFT JOIN Waste_Records w ON f.food_id = w.food_id
WHERE w.waste_id IS NULL;

-- 12. Waste percentage (sales and waste aggregated separately)
SELECT f.food_name,
       COALESCE(s.total_sold, 0) AS total_sold,
       COALESCE(w.total_wasted, 0) AS total_wasted,
       ROUND(
           100.0 * COALESCE(w.total_wasted, 0) /
           NULLIF(
               COALESCE(s.total_sold, 0) +
               COALESCE(w.total_wasted, 0), 0
           ), 2
       ) AS waste_percentage
FROM Food_Items f
LEFT JOIN (
    SELECT food_id, SUM(quantity_sold) AS total_sold
    FROM Sales GROUP BY food_id
) s ON f.food_id = s.food_id
LEFT JOIN (
    SELECT food_id, SUM(quantity_wasted) AS total_wasted
    FROM Waste_Records GROUP BY food_id
) w ON f.food_id = w.food_id;

-- 13. Foods priced above average
SELECT food_name, price
FROM Food_Items
WHERE price > (SELECT AVG(price) FROM Food_Items);

-- 14. Overall project statistics
SELECT
    (SELECT SUM(quantity_sold) FROM Sales) AS total_sold,
    (SELECT SUM(quantity_wasted) FROM Waste_Records) AS total_wasted,
    (SELECT SUM(w.quantity_wasted * f.price)
     FROM Waste_Records w
     JOIN Food_Items f ON w.food_id = f.food_id)
     AS total_money_lost;

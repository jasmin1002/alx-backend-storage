-- Define trigger for every insertion of new
-- entry on table orders
DELIMITER //

CREATE TRIGGER after_orders_insert
AFTER INSERT
ON orders FOR EACH ROW
BEGIN
    -- DECLARE quantityPurcharsed INT;
    UPDATE items
    SET quantity = quantity - NEW.number;
    -- WHERE orders.item_name = items.name;
END //

DELIMITER ;
# hotel-management-system
Complete database schema, automation scripts, and analytical workflows for a hotel management system built with MySQL and visualized via Power BI dashboards.

**Hotel Management System (SQL & Power BI Dashboard)**
***Project Overview***
This repository contains the database implementation and analytical backend for a multi-location Hotel Management System. The project models a hotel operations database tailored for top hospitality properties in Ghana—such as Fiesta Royale Hotel, La Palm Royal Beach Hotel, and Lancaster Accra—enforcing strict data integrity, automated revenue calculation, and real-time transaction tracking.  
The backend automates financial updates using database triggers, logs guest activity, tracks employee roles, and structures hotel performance data for integration into Power BI operational dashboards.

**Schema Architecture & Entity Relationship & Data Model** 
<img width="1714" height="730" alt="image" src="https://github.com/user-attachments/assets/8f5d30f1-2e6a-42e8-8db9-dc1ecb61d10f" />

The relational schema is built on 8 normalized core entities:  
***(i) hotel:*** Stores distinct property locations and addresses.  
***(ii) role:*** Defines organizational job positions across properties.  
***(iii) employee:*** Maps staff to their assigned hotel and operational role.  
***(iv) room_type:*** Defines room classifications, descriptions, and standard base prices.  
***(v) room:*** Contains individual room listings, availability status, and physical room numbers.  
***(vi) guest:*** Maintains detailed guest contact information.  
***(vii) booking:*** Captures reservation details, check-in/out schedules, booking status, and calculated costs.          
***(viii) bill:*** Tracks invoicing records and real-time payment states (paid, pending, canceled).  

**Automation & Business Logic**
To eliminate manual calculations and prevent financial mismatches, the database features automatic pricing and auto-invoicing triggers:

 ### 1. Automatic Stay Cost Calculation
 A `BEFORE INSERT` trigger automatically fetches the base price from room_type for the corresponding room_id, calculates the duration of stay using DATEDIFF, and sets the total booking cost dynamically.  

```SQL

DELIMITER //
CREATE TRIGGER BEFORE_booking_insert_total_cost
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE room_price DECIMAL(10,2);
    
    -- Fetch the base price based on room category
    SELECT rt.base_price INTO room_price
    FROM room r
    JOIN room_type rt ON r.room_type_id = rt.room_type_id
    WHERE r.room_id = NEW.room_id;
    
    -- Compute total cost based on duration (minimum 1 day)
    SET NEW.total_cost = GREATEST(DATEDIFF(NEW.check_out_date, NEW.check_in_date), 1) * room_price;
END //
DELIMITER ;
```

### 2. Auto-Invoicing & Billing Generation
An `AFTER INSERT` trigger automatically generates a billing statement in the `bill` table whenever a new booking is registered, mapping the reservation status directly to payment states.

```SQL
DELIMITER //
CREATE TRIGGER into_bill_after_booking_insert
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
    INSERT INTO bill (booking_id, bill_date, amount, payment_status)
    VALUES (
        NEW.booking_id, 
        NEW.check_out_date, 
        NEW.total_cost, 
        CASE 
            WHEN NEW.status = 'checked_out' THEN 'paid'
            WHEN NEW.status = 'canceled' THEN 'canceled'
            ELSE 'pending'
        END
    );
END //
DELIMITER ;
```

## Core Business Intelligence Queries
<img width="1576" height="745" alt="image" src="https://github.com/user-attachments/assets/e2a08716-1dad-45f6-9858-3a800dd7366e" />


### Calculates total booking performance and demand across each hotel property, sorted from highest to lowest volume.

```SQL
SELECT 
    H.hotel_name AS HOTEL,
    COUNT(B.booking_id) AS "TOTAL BOOKINGS", 
    H.hotel_id 
FROM hotel AS H
JOIN room AS R ON H.hotel_id = R.hotel_id
JOIN room_type AS RT ON R.room_type_id = RT.room_type_id
JOIN booking AS B ON R.room_id = B.room_id 
GROUP BY H.hotel_id, H.hotel_name
ORDER BY "TOTAL BOOKINGS" DESC;
```

### Comprehensive Employee Roster Procedure
A stored procedure to pull structured staff distribution across hotel branches and departments:

```SQL
DELIMITER $$
CREATE PROCEDURE GetEmployeeRoster()
BEGIN
   SELECT 
       E.first_name,
       E.last_name,
       E.email,
       R.role_name,
       H.hotel_name
   FROM employee E
   JOIN role AS R ON E.role_id = R.role_id
   JOIN hotel AS H ON E.hotel_id = H.hotel_id;
END $$
DELIMITER ;
```

##  Tech Stack
* **Database Management System:** MySQL
* **Querying & Modeling:** MySQL Workbench
* **Business Intelligence:** Power BI Dashboard



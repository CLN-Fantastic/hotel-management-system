-- HOTEL MANAGEMENT SYSTEM 

-- creating of the database schema
CREATE DATABASE HOTEL_MANAGEMENT_SYSTEM;

-- DATABASE TO READ ONLY


-- this statement is use to Lock the database into Read-Only mode.
ALTER DATABASE  HOTEL_MANAGEMENT_SYSTEM READ ONLY=1;


-- this statement is use to Disables Read-Only mode, sets the database back to Read-Write.
ALTER DATABASE  HOTEL_MANAGEMENT_SYSTEM READ ONLY=0;


-- creating table for the entity Hotel
CREATE TABLE IF NOT EXISTS hotel (
 hotel_id INT AUTO_INCREMENT PRIMARY KEY,
hotel_name VARCHAR(100)UNIQUE NOT NULL,
address VARCHAR(255)
);



-- creating table for the entity Role
CREATE TABLE IF NOT EXISTS role(
role_id INT AUTO_INCREMENT PRIMARY KEY,
role_name VARCHAR(50) UNIQUE NOT NULL
);



-- creating table for the entity Employee
CREATE TABLE IF NOT EXISTS employee(
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(20) NOT NULL, 
email VARCHAR(100),
role_id INT,
hotel_id INT,
FOREIGN KEY(role_id) REFERENCES role(role_id),
FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);

-- creating table for the entity Room_Type
CREATE TABLE IF NOT EXISTS room_type(
room_type_id INT AUTO_INCREMENT PRIMARY KEY,
type_name VARCHAR(50) UNIQUE NOT NULL,
description TEXT, 
base_price DEC(10,2) NOT NULL
);


-- creating table for the entity Room
CREATE TABLE IF NOT EXISTS room(
room_id INT AUTO_INCREMENT PRIMARY KEY,
room_number VARCHAR(10),
hotel_id INT,
room_type_id INT,
is_available tinyint,
FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),
FOREIGN KEY(room_type_id) REFERENCES room_type(room_type_id)
);


-- creating table for the entity Guest
CREATE TABLE IF NOT EXISTS guest(
guest_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(20) UNIQUE NOT NULL, 
email VARCHAR(100)
);



-- creating table for the entity Booking
CREATE TABLE IF NOT EXISTS booking(
booking_id INT AUTO_INCREMENT PRIMARY KEY,
guest_id INT,
room_id INT,
check_in_date DATE,
check_out_date DATE,
total_cost DEC(10,2),
status ENUM('confirmed','canceled','checked_out','check_in'),
FOREIGN KEY(guest_id) REFERENCES guest(guest_id),
FOREIGN KEY(room_id) REFERENCES room(room_id)
);



-- creating table for the entity Bill
 CREATE TABLE IF NOT EXISTS bill(
 bill_id INT AUTO_INCREMENT PRIMARY KEY,
 booking_id INT,
 bill_date DATE,
 amount DEC(10,2),
 payment_status ENUM('pending','paid','canceled'),-- Enum helps to create a custom dropdwon menu for a particular column
 FOREIGN KEY(booking_id) REFERENCES booking(booking_id)
 );

-- CREATE TABLE IF NOT EXISTS bill(
-- booking_id INT,
-- Check_out_date DATE,
-- total_cost DEC(10,2),
-- status ENUM('confirmed','canceled','checked_out','check_in'),
-- FOREIGN KEY(booking_id) REFERENCES booking(booking_id)
-- );



-- ALTER help to indicate the table I want to modify
-- set auto_increment with the value i want it to start with,within the hotel table
ALTER TABLE HOTEL
AUTO_INCREMENT = 1;




-- Insertion into hotel Table
INSERT INTO hotel (hotel_name, address) 
VALUES 
('Fiesta Royale Hotel', 'George Walker Bush Hwy, Accra'),
('La Palm Royal Beach Hotel', 'No. 1 Bypass St, Accra'),
('Lancaster Accra', '80 Liberation Road, Accra'),
('Maple Leaf Korean Hotel', 'Achiaba Loop, Accra'),
('Eden Vale Hotel Accra', 'Abelemkpe, Accra'),
('Kempinski Gold Coast City', 'Ministries Police Station Rd, Accra'),
('Movenpick Ambassador', 'Independence Ave, Accra'),
('Labadi Beach Hotel', 'La Rd, Accra'),
('Tang Palace Hotel', 'Borstal Ave, Accra'),
('Golden Tulip Kumasi', 'Rain Tree Rd, Kumasi'),
('Ridge Royal Hotel', 'Cape Coast, Central Region'),
('Royal Senchi Resort', 'Senchi Ferry Road, Akosombo'),
('Zaina Lodge', 'Mole National Park, Damongo'),
('Peduase Valley Resort', 'Ankobea Close, Aburi'),
('Lou Moon Resort', 'Axim, Western Region');





-- ALTER help to indicate the table I want to modify
-- set auto_increment with the value i want it to start with,within the role table
ALTER TABLE role
AUTO_INCREMENT = 1;



-- Insertion into Role Table
INSERT INTO role (role_name) 
VALUES 
('General Manager'),
('Front Desk Agent'),
('Housekeeping Supervisor'),
('Room Attendant'),
('Executive Chef'),
('Sous Chef'),
('Food & Beverage Manager'),
('Server'),
('Guest Relations Manager'),
('Security Officer'),
('Maintenance Technician'),
('IT Support Specialist'),
('Marketing Manager'),
('Accountant'),
('Laundry Attendant');


ALTER TABLE employee
auto_increment = 100;

-- Insertion into employee Table
INSERT INTO employee (first_name, last_name, phone_number, email, role_id, hotel_id) 
VALUES 
('Kwame', 'Mensah', '0244111222', 'k.mensah@gh-hotel.com', 1, 1),
('Abena', 'Osei', '0244333444', 'a.osei@gh-hotel.com', 2, 1),
('Kofi', 'Appiah', '0205111222', 'k.appiah@gh-hotel.com', 3, 2),
('Ama', 'Asante', '0205333444', 'a.asante@gh-hotel.com', 4, 2),
('Yaw', 'Boateng', '0556111222', 'y.boateng@gh-hotel.com', 5, 3),
('Esi', 'Adu', '0556333444', 'e.adu@gh-hotel.com', 6, 3),
('Kwesi', 'Baah', '0277111222', 'k.baah@gh-hotel.com', 7, 4),
('Akua', 'Dapaah', '0277333444', 'a.dapaah@gh-hotel.com', 8, 4),
('Kojo', 'Gyamfi', '0244555666', 'k.gyamfi@gh-hotel.com', 9, 5),
('Afia', 'Kwakye', '0244777888', 'a.kwakye@gh-hotel.com', 10, 5),
('Kwabena', 'Tetteh', '0205555666', 'k.tetteh@gh-hotel.com', 11, 6),
('Adwoa', 'Sarpong', '0205777888', 'a.sarpong@gh-hotel.com', 12, 6),
('Ekow', 'Aggrey', '0556555666', 'e.aggrey@gh-hotel.com', 13, 7),
('Baaba', 'Forson', '0556777888', 'b.forson@gh-hotel.com', 14, 7),
('Paapa', 'Quansah', '0277555666', 'p.quansah@gh-hotel.com', 15, 8),
('Nana', 'Yeboah', '0244999000', 'n.yeboah@gh-hotel.com', 1, 8),
('Mansa', 'Owusu', '0205999000', 'm.owusu@gh-hotel.com', 2, 9),
('Kobby', 'Ansah', '0556999000', 'k.ansah@gh-hotel.com', 3, 9),
('Araba', 'Eshun', '0277999000', 'a.eshun@gh-hotel.com', 4, 10),
('Fiifi', 'Dadzie', '0244123456', 'f.dadzie@gh-hotel.com', 5, 10),
('Efua', 'Bentsil', '0205123456', 'e.bentsil@gh-hotel.com', 6, 11),
('Kweku', 'Turkson', '0556123456', 'k.turkson@gh-hotel.com', 7, 11),
('Awo', 'Dede', '0277123456', 'a.dede@gh-hotel.com', 8, 12),
('Jojo', 'Mills', '0244654321', 'j.mills@gh-hotel.com', 9, 12),
('Dufie', 'Amankwah', '0205654321', 'd.amankwah@gh-hotel.com', 10, 13),
('Panyin', 'Kakra', '0556654321', 'p.kakra@gh-hotel.com', 11, 13),
('Kukua', 'Arthur', '0277654321', 'k.arthur@gh-hotel.com', 12, 14),
('Ato', 'Blankson', '0244112233', 'a.blankson@gh-hotel.com', 13, 14),
('Serwaa', 'Akoto', '0205112233', 's.akoto@gh-hotel.com', 14, 15),
('Okyere', 'Darko', '0556112233', 'o.darko@gh-hotel.com', 15, 15),
('Gifty', 'Lamptey', '0277112233', 'g.lamptey@gh-hotel.com', 2, 1),
('Emmanuel', 'Annan', '0244001122', 'e.annan@gh-hotel.com', 4, 2),
('Mercy', 'Mensah', '0205001122', 'm.mensah@gh-hotel.com', 6, 3),
('Samuel', 'Kyeremeh', '0556001122', 's.kyeremeh@gh-hotel.com', 8, 4),
('Grace', 'Oppong', '0277001122', 'g.oppong@gh-hotel.com', 10, 5),
('Isaac', 'Donkor', '0244998877', 'i.donkor@gh-hotel.com', 12, 6),
('Doreen', 'Antwi', '0205998877', 'd.antwi@gh-hotel.com', 14, 7),
('Patrick', 'Asare', '0556998877', 'p.asare@gh-hotel.com', 1, 8),
('Linda', 'Agyemang', '0277998877', 'l.agyemang@gh-hotel.com', 3, 9),
('Charles', 'Frimpong', '0244776655', 'c.frimpong@gh-hotel.com', 5, 10),
('Rose', 'Gyasi', '0205776655', 'r.gyasi@gh-hotel.com', 7, 11),
('David', 'Bempah', '0556776655', 'd.bempah@gh-hotel.com', 9, 12),
('Comfort', 'Nti', '0277776655', 'c.nti@gh-hotel.com', 11, 13),
('Stephen', 'Kyere', '0244223344', 's.kyere@gh-hotel.com', 13, 14),
('Felicia', 'Amponsah', '0205223344', 'f.amponsah@gh-hotel.com', 15, 15),
('Prince', 'Doku', '0556223344', 'p.doku@gh-hotel.com', 2, 2),
('Rita', 'Sackey', '0277223344', 'r.sackey@gh-hotel.com', 4, 3),
('Daniel', 'Kuma', '0244445566', 'd.kuma@gh-hotel.com', 6, 4),
('Joyce', 'Bortey', '0205445566', 'j.bortey@gh-hotel.com', 8, 5),
('Francis', 'Obeng', '0556445566', 'f.obeng@gh-hotel.com', 10, 6),
('John','Doe','555-123-4567','john.doe@example.com',1,1),
('Jane','Smith','555-987-6543','jane.smith@example.com',1,2),
('Peter','Jones','555-555-1234','peter.jones@example.com',2,3),
('Mary','Williams','555-789-0123','mary.williams@example.com',2,4),
('David','Brown','555-234-5678','david.brown@example.com',3,5),
('Susan','Davis','555-678-9012','susan.davis@example.com',3,6),
('Michael','Wilson','555-012-3456','michael.wilson@example.com',4,7),
('Linda','Miller','555-345-6789','linda.miller@example.com',4,8),
('Robert','Moore','555-456-7890','robert.moore@example.com',5,9),
('Jennifer','Taylor','555-890-1234','jennifer.taylor@example.com',5,10),
('Richard','Anderson','555-123-7890','richard.anderson@example.com',6,11),
('Elizabeth','Thomas','555-234-8901','elizabeth.thomas@example.com',6,12),
('Charles','Jackson','555-345-9012','charles.jackson@example.com',7,13),
('Patricia','White','555-456-0123','patricia.white@example.com',7,14),
('Thomas','Harris','555-567-1234','thomas.harris@example.com',8,15),
('Jessica','Martin','555-678-2345','jessica.martin@example.com',8,10),
('Christopher','Thompson','555-789-3456','christopher.thompson@example.com',9,7),
('Daniel','Martinez','555-901-5678','daniel.martinez@example.com',10,9),
('Karen','Robinson','555-012-6789','karen.robinson@example.com',10,2),
('Matthew','Clark','555-123-9012','matthew.clark@example.com',11,2),
('Sarah','Rodriguez','555-234-0123','sarah.rodriguez@example.com',11,12),
('Donald','Lewis','555-345-1234','donald.lewis@example.com',12,3),
('Betty','Lee','555-456-2345','betty.lee@example.com',12,4),
('Kenneth','Walker','555-567-3456','kenneth.walker@example.com',13,5),
('Sandra','Hall','555-678-4567','sandra.hall@example.com',13,6),
('George','Allen','555-789-5678','george.allen@example.com',14,7),
('Carol','Young','555-890-6789','carol.young@example.com',14,8),
('Timothy','Hernandez','555-901-7890','timothy.hernandez@example.com',15,9),
('Shirley','King','555-012-8901','shirley.king@example.com',15,3),
('Jason','Wright','555-123-0123','jason.wright@example.com',1,1),
('Brenda','Lopez','555-234-1234','brenda.lopez@example.com',6,2),
('Jeffrey','Hill','555-345-2345','jeffrey.hill@example.com',1,3),
('Cynthia','Scott','555-456-3456','cynthia.scott@example.com',7,4),
('Ryan','Green','555-567-4567','ryan.green@example.com',8,5),
('Maria','Adams','555-678-5678','maria.adams@example.com',8,6),
('Gary','Baker','555-789-6789','gary.baker@example.com',9,7),
('Debra','Nelson','555-890-7890','debra.nelson@example.com',1,8),
('Nicholas','Carter','555-901-8901','nicholas.carter@example.com',12,13),
('Pamela','Mitchell','555-012-9012','pamela.mitchell@example.com',2,14),
('Eric','Perez','555-123-0123','eric.perez@example.com',10,11),
('Doris','Roberts','555-234-1234','doris.roberts@example.com',2,14),
('Stephen','Turner','555-345-2345','stephen.turner@example.com',2,13),
('Laura','Phillips','555-456-3456','laura.phillips@example.com',12,4),
('Larry','Campbell','555-567-4567','larry.campbell@example.com',13,15),
('Teresa','Parker','555-678-5678','teresa.parker@example.com',2,6),
('Jose','Evans','555-789-6789','jose.evans@example.com',4,4),
('Sharon','Edwards','555-890-7890','sharon.edwards@example.com',5,8),
('Frank','Collins','555-901-8901','frank.collins@example.com',5,9),
('Helen','Stewart','555-012-9012','helen.stewart@example.com',5,5),
('CLN','FANTASTIC','256-651-059','clnfan@gmail.com',1,2);


ALTER TABLE room_type
AUTO_INCREMENT = 1;


INSERT INTO room_type (type_name, description, base_price) VALUES 
('Standard Single', 'A cozy room with a single bed, perfect for solo travelers or business trips.', 450.00),
('Standard Double', 'Features a comfortable double bed, ideal for couples or friends.', 650.00),
('Deluxe King', 'Spacious room with a King-size bed, premium bedding, and a city view.', 950.00),
('Executive Suite', 'Includes a separate living area, work desk, and mini-bar for professional stays.', 1500.00),
('Family Suite', 'Two interconnected rooms with a small kitchenette, designed for families.', 1800.00),
('Honeymoon Suite', 'Luxury decor, king bed, spa bath, and complimentary champagne on arrival.', 2200.00),
('Penthouse', 'Top-floor luxury with panoramic views, private balcony, and 24/7 butler service.', 5000.00),
('Accessible Room', 'Specially designed with wider doorways and modified bathrooms for mobility.', 600.00),
('Twin Room', 'Contains two separate single beds, popular for tour groups or colleagues.', 700.00),
('Garden Villa', 'Detached unit with private garden access and outdoor seating area.', 2500.00),
('Presidential Suite', 'The ultimate luxury experience with multiple rooms, dining area, and high security.', 8500.00),
('Studio Apartment', 'Long-stay option featuring a compact kitchen and laundry facilities.', 1200.00),
('Ocean View Deluxe', 'Premium room facing the coastline with a private balcony.', 1100.00),
('Economy Room', 'Basic amenities for budget-conscious travelers, located in quieter zones.', 300.00),
('Business Double', 'Equipped with high-speed ergonomic setup and dual-line phones.', 850.00);



ALTER TABLE ROOM
AUTO_INCREMENT = 100;

INSERT INTO room (room_number, hotel_id, room_type_id, is_available) VALUES 
-- Hotel 1 (Fiesta Royale)
 ('101', 1, 1, 1),
 ('102', 1, 2, 0), 
 ('201', 1, 3, 1),
 ('202', 1, 4, 1), 
 ('301', 1, 7, 0), 
 ('302', 1, 11, 1), 
 ('401', 1, 15, 1), 
 ('402', 1, 5, 1),
-- Hotel 2 (La Palm Royal Beach)
('101', 2, 13, 1),
 ('102', 2, 13, 1), 
 ('201', 2, 3, 0),
 ('202', 2, 6, 1), 
 ('301', 2, 7, 1), 
 ('302', 2, 10, 0), 
 ('401', 2, 11, 1), 
 ('402', 2, 5, 1),
-- Hotel 3 (Lancaster Accra)
('101', 3, 1, 1), 
('102', 3, 1, 1), 
('201', 3, 9, 0), 
('202', 3, 15, 1), 
('301', 3, 4, 1), 
('302', 3, 4, 0), 
('401', 3, 7, 1), 
('402', 3, 7, 1),
-- Hotel 4 (Maple Leaf)
('101', 4, 1, 1), 
('102', 4, 2, 1), 
('201', 4, 2, 0), 
('202', 4, 9, 1), 
('301', 4, 12, 1), 
('302', 4, 12, 1), 
('401', 4, 3, 1), 
('402', 4, 14, 0),
-- Hotel 5 (Eden Vale)
('101', 5, 1, 1), 
('102', 5, 2, 1), 
('201', 5, 3, 1), 
('202', 5, 14, 0), 
('301', 5, 8, 1), 
('302', 5, 8, 1), 
('401', 5, 15, 1), 
('402', 5, 4, 1),
-- Hotel 6 (Kempinski)
('101', 6, 3, 1), 
('102', 6, 3, 0),
('201', 6, 6, 1), 
('202', 6, 7, 1), 
('301', 6, 11, 1), 
('302', 6, 11, 1), 
('401', 6, 4, 0), 
('402', 6, 5, 1),
-- Hotel 7 (Movenpick)
('101', 7, 3, 1), 
('102', 7, 15, 1), 
('201', 7, 4, 0), 
('202', 7, 4, 1), 
('301', 7, 7, 1), 
('302', 7, 11, 0), 
('401', 7, 6, 1), 
('402', 7, 5, 1),
-- Hotel 8 (Labadi Beach)
('101', 8, 13, 1), 
('102', 8, 13, 1), 
('201', 8, 3, 0), 
('202', 8, 6, 1), 
('301', 8, 7, 1), 
('302', 8, 10, 1), 
('401', 8, 11, 0), 
('402', 8, 5, 1),
-- Hotel 9 (Tang Palace)
('101', 9, 1, 1), 
('102', 9, 2, 1), 
('201', 9, 3, 0), 
('202', 9, 15, 1), 
('301', 9, 4, 1), 
('302', 9, 4, 1), 
('401', 9, 7, 0), 
('402', 9, 11, 1),
-- Hotel 10 (Golden Tulip)
('101', 10, 1, 1), 
('102', 10, 2, 1), 
('201', 10, 9, 0), 
('202', 10, 9, 1), 
('301', 10, 5, 1), 
('302', 10, 5, 1), 
('401', 10, 3, 1), 
('402', 10, 14, 0),
-- Hotel 11 (Ridge Royal)
('101', 11, 1, 1), 
('102', 11, 2, 1), 
('201', 11, 3, 1), 
('202', 11, 8, 0), 
('301', 11, 14, 1), 
('302', 11, 14, 1), 
('401', 11, 15, 1), 
('402', 11, 4, 1),
-- Hotel 12 (Royal Senchi)
('101', 12, 10, 1), 
('102', 12, 10, 0), 
('201', 12, 13, 1), 
('202', 12, 3, 1), 
('301', 12, 6, 1), 
('302', 12, 7, 1), 
('401', 12, 11, 0), 
('402', 12, 5, 1),
-- Hotel 13 (Zaina Lodge)
('C01', 13, 10, 1), 
('C02', 13, 10, 1), 
('V01', 13, 14, 0), 
('V02', 13, 14, 1), 
('S01', 13, 3, 1), 
('S02', 13, 3, 0), 
('L01', 13, 11, 1), 
('L02', 13, 7, 1),
-- Hotel 14 (Peduase Valley)
('101', 14, 1, 1), 
('102', 14, 2, 1), 
('201', 14, 3, 0), 
('202', 14, 15, 1), 
('301', 14, 10, 1), 
('302', 14, 10, 1), 
('401', 14, 7, 0), 
('402', 14, 11, 1),
-- Hotel 15 (Lou Moon)
('B01', 15, 13, 1), 
('B02', 15, 13, 0), 
('V01', 15, 10, 1), 
('V02', 15, 10, 1), 
('S01', 15, 6, 1), 
('S02', 15, 6, 0), 
('L01', 15, 7, 1), 
('L02', 15, 11, 1);





ALTER TABLE GUEST
AUTO_INCREMENT = 1;


INSERT INTO guest (first_name, last_name, phone_number, email) VALUES 
('Kofi', 'Annan', '0244100200', 'k.annan@yahoo.com'),
('Akosua', 'Mensah', '0205100200', 'akosua.m@gmail.com'),
('John', 'Smith', '+1-555-0199', 'jsmith@outlook.com'),
('Yaa', 'Asantewaa', '0556100200', 'yaa.queen@ghana.com'),
('Kwame', 'Nkrumah', '0277100200', 'founder@gmail.com'),
('Sarah', 'Johnson', '+44-20-7946-0958', 'sarah.j@icloud.com'),
('Ekow', 'Blankson', '0244300400', 'eblankson@hotmail.com'),
('Araba', 'Quansah', '0205300400', 'araba.q@gmail.com'),
('Michael', 'Jordan', '+1-234-567-890', 'mjordan@nike.com'),
('Afia', 'Kyei', '0556300400', 'afia.k@live.com'),
('Kwabena', 'Duffuor', '0277300400', 'k.duffuor@bank.gh'),
('Elena', 'Petrova', '+7-495-123-4567', 'elena.p@yandex.ru'),
('Yaw', 'Poku', '0244500600', 'yawpoku@gmail.com'),
('Efua', 'Sutherland', '0205500600', 'efua.s@arts.org'),
('David', 'Beckham', '+44-7700-900000', 'david.b@gmail.com'),
('Baaba', 'Forson', '0556500600', 'b.forson@gmail.com'),
('Kojo', 'Antwi', '0277500600', 'kojo.music@gh.com'),
('Yuki', 'Tanaka', '+81-3-1234-5678', 'yuki.t@sony.jp'),
('Mansa', 'Musa', '0244700800', 'rich.musa@gold.com'),
('Kweku', 'Baako', '0205700800', 'baako.k@press.gh'),
('Linda', 'Carter', '+1-202-555-0101', 'linda.c@gmail.com'),
('Ato', 'Kwamina', '0556700800', 'ato.k@gmail.com'),
('Serwaa', 'Amihere', '0277700800', 'serwaa.a@ghone.com'),
('Hans', 'Mueller', '+49-30-123456', 'hans.m@berlin.de'),
('Fiifi', 'Banson', '0244900100', 'fiifi.b@radio.gh'),
('Dufie', 'Boateng', '0205900100', 'dufie.b@gmail.com'),
('Robert', 'Chen', '+86-10-12345678', 'r.chen@wechat.com'),
('Paapa', 'Yankson', '0556900100', 'paapa.y@gmail.com'),
('Esi', 'Adu', '0277900100', 'esi.adu@gmail.com'),
('Carlos', 'Sainz', '+34-91-123-4567', 'c.sainz@ferrari.es'),
('Kobby', 'Acheampong', '0244111333', 'kobby.a@gmail.com'),
('Abena', 'Korkor', '0205111333', 'abena.k@gmail.com'),
('James', 'Bond', '+44-00-7007', '007@mi6.gov.uk'),
('Akua', 'Donkor', '0556111333', 'akua.d@politics.gh'),
('Kwesi', 'Arthur', '0277111333', 'grind.day@gh.com'),
('Maria', 'Garcia', '+52-55-1234-5678', 'm.garcia@mexico.mx'),
('Jojo', 'Robbins', '0244222444', 'jojo.r@gmail.com'),
('Kukua', 'Essien', '0205222444', 'k.essien@gmail.com'),
('Ahmed', 'Musa', '+234-803-123-4567', 'a.musa@nigeria.ng'),
('Nana', 'Ama', '0556222444', 'n.ama@mcbrown.com'),
('Okyere', 'Darko', '0277222444', 'okyeame@gh.com'),
('Fatima', 'Zahra', '+212-522-123456', 'f.zahra@casablanca.ma'),
('Gifty', 'Anti', '0244333555', 'gifty.a@standpoint.gh'),
('Panyin', 'Andoh', '0205333555', 'panyin.a@gmail.com'),
('Jean', 'Dupont', '+33-1-42-68-53-00', 'j.dupont@paris.fr'),
('Kakra', 'Andoh', '0556333555', 'kakra.a@gmail.com'),
('Sarkodie', 'Owusu', '0277333555', 'king.sark@gh.com'),
('Lars', 'Svensson', '+46-8-123-456', 'lars.s@stockholm.se'),
('Shatta', 'Wale', '0244444666', 'shatta.m@sm4lyf.com'),
('Adwoa', 'Safo', '0205444666', 'adwoa.s@parliament.gh'),
('Zinedine', 'Zidane', '+33-6-12-34-56-78', 'zizou@real.com'),
('Stonebwoy', 'Satekla', '0556444666', 'bhim@burniton.gh'),
('Efya', 'Nokturnal', '0277444666', 'efya@music.gh'),
('Sofia', 'Loren', '+39-06-1234567', 's.loren@roma.it'),
('Medikal', 'Frimpong', '0244555777', 'mgh@amg.com'),
('Becca', 'Acheampong', '0205555777', 'becca@africa.com'),
('Paulo', 'Coelho', '+55-21-1234-5678', 'alchemist@brazil.br'),
('Strongman', 'Burner', '0556555777', 'strong@gh.com'),
('Sister', 'Derby', '0277555777', 'derby@dolphin.gh'),
('Abeiku', 'Santana', '0244666888', 'abeiku@okayfm.gh');


-- DROP TRIGGER before_booking_insert;






ALTER TABLE BOOKING
AUTO_INCREMENT =1;



INSERT INTO booking (guest_id, room_id, check_in_date, check_out_date, total_cost, status) 
VALUES 
(21, 112, '2024-01-05', '2024-01-10', 3250.00, 'checked_out'),
(22, 114, '2024-01-15', '2024-01-18', 2100.00, 'checked_out'),
(23, 115, '2024-02-12', '2024-02-15', 4500.00, 'checked_out'),
(24, 107, '2024-02-14', '2024-02-17', 5700.00, 'checked_out'),
(25, 110, '2024-03-01', '2024-03-05', 6000.00, 'checked_out'),
(30, 118, '2024-03-28', '2024-04-01', 7200.00, 'checked_out'),
(31, 115, '2024-04-05', '2024-04-10', 3400.00, 'checked_out'),
(32, 113, '2024-04-12', '2024-04-15', 2100.00, 'checked_out'),
(33, 100, '2024-05-10', '2024-05-15', 7500.00, 'checked_out'),
(34, 117, '2024-05-20', '2024-05-25', 12500.00, 'checked_out'),
(35, 109, '2024-06-01', '2024-06-04', 3400.00, 'checked_out'),
(40, 101, '2024-07-10', '2024-07-15', 3500.00, 'checked_out'),
(41, 115, '2024-07-20', '2024-07-27', 7700.00, 'checked_out'),
(42, 111, '2024-08-01', '2024-08-08', 10500.00, 'checked_out'),
(43, 112, '2024-08-12', '2024-08-15', 1050.00, 'checked_out'),
(44, 115, '2024-09-05', '2024-09-10', 4250.00, 'checked_out'),
(45, 116, '2024-09-15', '2024-09-22', 66500.00, 'checked_out'),
(50, 110, '2024-10-05', '2024-10-10', 7500.00, 'checked_out'),
(51, 120, '2024-10-20', '2024-10-23', 3300.00, 'checked_out'),
(52, 103, '2024-11-01', '2024-11-05', 2600.00, 'checked_out'),
(53, 113, '2024-11-15', '2024-11-20', 6000.00, 'checked_out'),
(54, 115, '2024-12-20', '2024-12-27', 10500.00, 'checked_out'),
(55, 107, '2024-12-24', '2024-12-31', 15400.00, 'checked_out'),
(56, 100, '2024-12-28', '2025-01-02', 10625.00, 'checked_out'),
(1, 102, '2024-02-05', '2024-02-07', 3000.00, 'canceled'),
(2, 104, '2024-05-12', '2024-05-15', 4500.00, 'canceled'),
(3, 108, '2024-08-20', '2024-08-25', 1750.00, 'canceled'),
(4, 112, '2024-11-10', '2024-11-14', 3300.00, 'canceled'),
(5, 113, '2024-01-20', '2024-01-22', 1900.00, 'checked_out'),
(6, 118, '2024-02-18', '2024-02-21', 2100.00, 'checked_out'),
(7, 116, '2024-03-10', '2024-03-15', 45000.00, 'checked_out'),
(8, 106, '2024-04-25', '2024-04-28', 2850.00, 'checked_out'),
(9, 118, '2024-05-05', '2024-05-08', 1300.00, 'checked_out'),
(10, 106, '2024-06-15', '2024-06-20', 4400.00, 'checked_out'),
(11, 111, '2024-07-01', '2024-07-05', 4250.00, 'checked_out'),
(12, 113, '2024-08-15', '2024-08-20', 12500.00, 'checked_out'),
(13, 111, '2024-09-10', '2024-09-14', 6000.00, 'checked_out'),
(14, 100, '2024-10-12', '2024-10-15', 2550.00, 'checked_out'),
(15, 102, '2024-11-20', '2024-11-25', 4750.00, 'checked_out'),
(16, 117, '2024-12-05', '2024-12-10', 4250.00, 'checked_out'),
(17, 102, '2024-02-25', '2024-02-28', 2250.00, 'checked_out'),
(18, 103, '2024-04-10', '2024-04-14', 3800.00, 'checked_out'),
(19, 117, '2024-06-20', '2024-06-25', 4250.00, 'checked_out'),
(20, 102, '2024-08-01', '2024-08-05', 3800.00, 'checked_out'),
(26, 114, '2024-10-15', '2024-10-18', 4500.00, 'checked_out'),
(27, 118, '2024-01-12', '2024-01-15', 4500.00, 'checked_out'),
(28, 113, '2024-03-20', '2024-03-24', 3800.00, 'checked_out'),
(29, 118, '2024-05-15', '2024-05-20', 4250.00, 'checked_out'),
(36, 103, '2024-07-25', '2024-07-28', 2850.00, 'checked_out'),
(1, 105, '2025-01-10', '2025-01-15', 7500.00, 'checked_out'),
(2, 110, '2025-01-12', '2025-01-14', 1400.00, 'checked_out'),
(60, 115, '2025-01-20', '2025-01-25', 4250.00, 'checked_out'),
(4, 112, '2025-02-10', '2025-02-14', 3400.00, 'checked_out'),
(5, 100, '2025-02-14', '2025-02-16', 7200.00, 'checked_out'), 
(10, 111, '2025-04-18', '2025-04-21', 2550.00, 'checked_out'),
(57, 110, '2025-04-18', '2025-04-22', 6000.00, 'checked_out'),
(57, 112, '2025-04-20', '2025-04-25', 15000.00, 'checked_out'),
(60, 111, '2025-05-01', '2025-05-03', 3000.00, 'canceled'),
(15, 102, '2025-06-10', '2025-06-15', 3250.00, 'checked_out'),
(16, 103, '2025-06-12', '2025-06-18', 4200.00, 'checked_out'),
(20, 105, '2025-07-01', '2025-07-10', 25000.00, 'checked_out'),
(59, 100, '2025-07-15', '2025-07-20', 4250.00, 'checked_out'),
(59, 110, '2025-08-05', '2025-08-12', 10500.00, 'checked_out'),
(26, 120, '2025-08-20', '2025-08-25', 5500.00, 'checked_out'),
(30, 106, '2025-11-10', '2025-11-12', 1400.00, 'checked_out'),
(31, 120, '2025-11-20', '2025-11-25', 1750.00, 'checked_out'),
(58, 110, '2025-12-20', '2025-12-27', 10500.00, 'checked_out'),
(36, 115, '2025-12-23', '2025-12-26', 15000.00, 'checked_out'),
(37, 110, '2025-12-24', '2025-12-30', 25500.00, 'checked_out'),
(38, 105, '2025-12-28', '2026-01-02', 17500.00, 'checked_out'),
(40, 111, '2025-03-10', '2025-03-12', 900.00, 'canceled'),
(41, 102, '2025-05-15', '2025-05-18', 4500.00, 'canceled'),
(42, 104, '2025-09-10', '2025-09-15', 7500.00, 'canceled'),
(43, 106, '2025-02-01', '2025-02-03', 1900.00, 'checked_out'),
(44, 108, '2025-03-20', '2025-03-22', 1400.00, 'checked_out'),
(45, 103, '2025-04-05', '2025-04-08', 2100.00, 'checked_out'),
(46, 120, '2025-05-10', '2025-05-14', 3800.00, 'checked_out'),
(47, 106, '2025-06-20', '2025-06-25', 47500.00, 'checked_out'),
(48, 108, '2025-07-05', '2025-07-08', 1300.00, 'checked_out'),
(49, 106, '2025-08-15', '2025-08-18', 3300.00, 'checked_out'),
(50, 111, '2025-09-01', '2025-09-05', 4250.00, 'checked_out'),
(1, 115, '2025-10-01', '2025-10-05', 4400.00, 'checked_out'),
(2, 102, '2025-10-10', '2025-10-12', 1300.00, 'checked_out'),
(3, 117, '2025-11-01', '2025-11-04', 2250.00, 'checked_out'),
(4, 112, '2025-11-15', '2025-11-20', 7500.00, 'checked_out'),
(5, 117, '2025-12-01', '2025-12-05', 3800.00, 'checked_out'),
(6, 112, '2025-12-10', '2025-12-14', 3300.00, 'checked_out'),
(7, 118, '2025-01-05', '2025-01-08', 1700.00, 'checked_out'),
(8, 102, '2025-02-20', '2025-02-25', 4750.00, 'checked_out'),
(9, 117, '2025-03-05', '2025-03-10', 4250.00, 'checked_out'),
(60, 113, '2025-04-10', '2025-04-15', 4750.00, 'checked_out'),
(11, 118, '2025-05-20', '2025-05-25', 7500.00, 'checked_out'),
(12, 113, '2025-06-01', '2025-06-05', 3800.00, 'checked_out'),
(13, 117, '2025-07-10', '2025-07-15', 4250.00, 'checked_out'),
(14, 103, '2025-08-01', '2025-08-04', 2850.00, 'checked_out'),
(15, 103, '2025-09-15', '2025-09-20', 12500.00, 'checked_out'),
(16, 108, '2025-10-20', '2025-10-25', 7500.00, 'checked_out'),
(17, 107, '2025-11-05', '2025-11-10', 4250.00, 'checked_out'),
(18, 108, '2025-12-05', '2025-12-10', 4750.00, 'checked_out'),
(1, 100, '2026-03-01', '2026-03-05', 180.00, 'checked_out'),
(2, 103, '2026-03-02', '2026-03-04', 190.00, 'checked_out'),
(3, 109, '2026-03-10', '2026-03-15', 550.00, 'checked_out'),
(4, 112, '2026-03-12', '2026-03-14', 440.00, 'checked_out'),
(5, 115, '2026-03-15', '2026-03-20', 250.00, 'checked_out'),
(6, 120, '2026-03-20', '2026-03-22', 700.00, 'checked_out'),
(7, 120, '2026-03-25', '2026-03-28', 450.00, 'checked_out'),
(8, 113, '2026-03-28', '2026-03-31', 600.00, 'checked_out'),
(9, 115, '2026-04-01', '2026-04-03', 500.00, 'check_in'),
(10, 110, '2026-04-01', '2026-04-05', 800.00, 'check_in'),
(11, 115, '2026-04-02', '2026-04-04', 1700.00, 'check_in'),
(12, 110, '2026-04-02', '2026-04-06', 6000.00, 'check_in'),
(13, 125, '2026-04-05', '2026-04-10', 4750.00, 'confirmed'),
(14, 111, '2026-04-06', '2026-04-08', 3000.00, 'confirmed'),
(15, 116, '2026-04-07', '2026-04-12', 25000.00, 'confirmed'),
(16, 117, '2026-04-10', '2026-04-15', 4250.00, 'confirmed'),
(17, 115, '2026-03-05', '2026-03-07', 1300.00, 'canceled'),
(18, 118, '2026-03-15', '2026-03-18', 2100.00, 'canceled'),
(19, 118, '2026-04-15', '2026-04-20', 3500.00, 'confirmed'),
(20, 119, '2026-04-18', '2026-04-22', 3400.00, 'confirmed'),
(21, 101, '2026-04-20', '2026-04-25', 12500.00, 'confirmed'),
(22, 102, '2026-04-22', '2026-04-24', 1700.00, 'confirmed'),
(23, 105, '2026-05-01', '2026-05-05', 4400.00, 'confirmed'),
(24, 110, '2026-05-02', '2026-05-07', 7500.00, 'confirmed'),
(25, 115, '2026-05-05', '2026-05-10', 5500.00, 'confirmed'),
(26, 120, '2026-05-10', '2026-05-15', 5500.00, 'confirmed'),
(27, 102, '2026-03-01', '2026-03-03', 1300.00, 'checked_out'),
(28, 115, '2026-03-05', '2026-03-08', 15000.00, 'checked_out'),
(29, 118, '2026-03-10', '2026-03-12', 3600.00, 'checked_out'),
(30, 101, '2026-03-15', '2026-03-18', 2850.00, 'checked_out'),
(31, 104, '2026-03-20', '2026-03-23', 2100.00, 'checked_out'),
(32, 109, '2026-03-25', '2026-03-28', 1350.00, 'checked_out'),
(33, 114, '2026-04-01', '2026-04-04', 6600.00, 'check_in'),
(34, 104, '2026-04-01', '2026-04-06', 9000.00, 'check_in'),
(35, 107, '2026-04-02', '2026-04-05', 2250.00, 'check_in'),
(36, 101, '2026-04-02', '2026-04-07', 4750.00, 'check_in'),
(37, 106, '2026-04-03', '2026-04-05', 18000.00, 'confirmed'),
(38, 104, '2026-04-05', '2026-04-10', 7500.00, 'confirmed'),
(39, 106, '2026-04-08', '2026-04-12', 38000.00, 'confirmed'),
(40, 105, '2026-04-10', '2026-04-15', 4750.00, 'confirmed'),
(41, 106, '2026-03-10', '2026-03-12', 1900.00, 'canceled'),
(42, 112, '2026-04-15', '2026-04-20', 7500.00, 'confirmed'),
(43, 116, '2026-04-20', '2026-04-25', 47500.00, 'confirmed'),
(44, 103, '2026-05-01', '2026-05-04', 3300.00, 'confirmed'),
(45, 103, '2026-05-05', '2026-05-10', 42500.00, 'confirmed'),
(46, 103, '2026-03-20', '2026-03-22', 1300.00, 'checked_out'),
(47, 106, '2026-04-01', '2026-04-03', 1700.00, 'check_in'),
(48, 102, '2026-05-10', '2026-05-15', 4250.00, 'confirmed'),
(49, 108, '2026-06-01', '2026-06-05', 4400.00, 'confirmed'),
(50, 101, '2026-06-10', '2026-06-15', 3500.00, 'confirmed');
-- This code was used to rectify the total cost figure in the booking table
UPDATE booking AS b
JOIN room AS r ON b.room_id = r.room_id
JOIN room_type rt ON r.room_type_id = rt.room_type_id
SET b.total_cost = GREATEST(DATEDIFF(b.check_out_date, b.check_in_date), 1) * rt.base_price;

-- this trigger will help auto calculation for the cost of booking a particular room
DELIMITER //
CREATE TRIGGER BEFORE_booking_insert_total_cost
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE room_price DECIMAL(10,2);
    
    -- Fetch the base price based on the room_id being inserted
    SELECT rt.base_price INTO room_price
    FROM room r
    JOIN room_type rt ON r.room_type_id = rt.room_type_id
    WHERE r.room_id = NEW.room_id;
    -- Calculate and set the total_cost automatically
    SET NEW.total_cost = GREATEST(DATEDIFF(NEW.check_out_date, NEW.check_in_date), 1) * room_price;
END //
DELIMITER ;


ALTER TABLE BILL
AUTO_INCREMENT = 1000;

-- this was use to insert the old data from the booking table to bill
INSERT INTO bill (booking_id, bill_date, amount, payment_status)
SELECT 
    booking_id, 
    check_out_date, -- We'll assume the bill is issued on the day they check out
    total_cost, 
    CASE 
        WHEN status = 'checked_out' THEN 'paid'
        WHEN status = 'canceled' THEN 'canceled'
        ELSE 'pending' 
    END
FROM booking;

booking
-- this trigger will help to auto insert into bills table whenever a data is been inserted into the booking table
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

INSERT INTO booking (guest_id, room_id, check_in_date, check_out_date, total_cost, status) 
VALUES 
(60, 110, '2024-01-05', '2026-03-04',77777398.00, 'checked_out');

INSERT INTO booking (guest_id, room_id, check_in_date, check_out_date, total_cost, status) 
VALUES 
(6, 100, '2024-01-05', '2026-01-01',8000000.00, 'checked_out');





-- QUERY TO KNOW THE HOTELS ID AND THEIR ROOM ID
SELECT H.HOTEL_ID,H.HOTEL_NAME ,R.ROOM_ID
FROM HOTEL AS H
JOIN ROOM AS R
ON H.HOTEL_ID=R.HOTEL_ID;



-- QUERY TO DETERMINE THE HOTEL WITH THE HIGEST BOOKING

SELECT H.hotel_name  AS HOTEL,COUNT( H.HOTEL_NAME) AS "TOTAL BOOKINGS", H.hotel_id FROM hotel AS H
JOIN ROOM AS R
ON H.hotel_id=R.HOTEL_ID
JOIN room_type AS RT
ON R.ROOM_TYPE_ID=RT.ROOM_TYPE_ID
JOIN booking AS B
ON R.ROOM_ID=B.room_id 
GROUP BY hotel_name;




-- INDEX HELPS TO RETRIEVE DATA FAST
CREATE INDEX FN_LN_IDX ON EMPLOYEE(FIRST_NAME,LAST_NAME);


-- THIS PROCEDURE IS USE TO HOLD EMPLOYEES_INFO
DELIMITER $$
CREATE PROCEDURE EMPLOYEE()
BEGIN
   SELECT E.FIRST_NAME,E.LAST_NAME,E.EMAIL,R.ROLE_NAME,H.HOTEL_NAME
   FROM EMPLOYEE E
   JOIN  ROLE AS R
   ON
   E.ROLE_ID=R.ROLE_ID
   JOIN HOTEL AS H
   ON
   E.HOTEL_ID=H.HOTEL_ID;
   END $$
DELIMITER ;   
  
  
  -- VIEW TABLE HELP TO KEEP SPECIFIC RECORDS IN SUMMARY FORM
CREATE VIEW EMP_ID_PHONE AS SELECT CONCAT(EMPLOYEE_ID,"  ",PHONE_NUMBER) AS 'EMP_ID & PHONE' FROM employee;
   
SELECT * FROM EMP_ID_PHONE;   
   drop VIEW EMP_ID_PHONE
   

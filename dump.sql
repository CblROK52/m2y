CREATE TABLE Category (
    CategoryId SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Status (
    StatusId SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE RoomFund (
    RoomFundId SERIAL PRIMARY KEY,
    Floor INTEGER NOT NULL,
    RoomNumber VARCHAR(50) NOT NULL,
    CategoryId INTEGER REFERENCES Category(CategoryId),
    StatusId INTEGER REFERENCES Status(StatusId),
    Price NUMERIC(10, 2) NOT NULL,
    CONSTRAINT unique_room UNIQUE (Floor, RoomNumber)
);

CREATE TABLE Client (
    ClientId SERIAL PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    MiddleName VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    PassportData VARCHAR(100)
);

CREATE TABLE Role (
    RoleId SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Employee (
    EmployeeId SERIAL PRIMARY KEY,
    Login VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    RoleId INTEGER REFERENCES Role(RoleId),
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    MiddleName VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE CleaningSchedule (
    CleaningScheduleId SERIAL PRIMARY KEY,
    CleaningDate TIMESTAMP NOT NULL,
    EmployeeId INTEGER REFERENCES Employee(EmployeeId),
    RoomFundId INTEGER REFERENCES RoomFund(RoomFundId),
    Status VARCHAR(50) NOT NULL DEFAULT 'Запланирована'
);

CREATE TABLE Service (
    ServiceId SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Cost NUMERIC(10, 2) NOT NULL,
    Description TEXT
);

CREATE TABLE Booking (
    BookingId SERIAL PRIMARY KEY,
    ClientId INTEGER REFERENCES Client(ClientId),
    RoomFundId INTEGER REFERENCES RoomFund(RoomFundId),
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE,
    StatusId INTEGER REFERENCES Status(StatusId),
    EmployeeId INTEGER REFERENCES Employee(EmployeeId),
    TotalPrice NUMERIC(10, 2) NOT NULL,
    CONSTRAINT valid_dates CHECK (CheckOutDate > CheckInDate)
);

CREATE TABLE Request (
    RequestId SERIAL PRIMARY KEY,
    StatusId INTEGER REFERENCES Status(StatusId),
    EmployeeId INTEGER REFERENCES Employee(EmployeeId),
    Comment TEXT,
    BookingId INTEGER REFERENCES Booking(BookingId),
    ServiceId INTEGER REFERENCES Service(ServiceId),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (4, 1, 1, '2025-02-14', '2025-03-02', 1, 1, 42500.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (5, 2, 2, '2025-02-28', null, 1, 1, 2500.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (6, 3, 4, '2025-02-23', '2025-02-25', 1, 1, 3600.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (7, 4, 5, '2025-03-01', '2025-03-07', 1, 1, 21000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (8, 5, 7, '2025-02-27', '2025-04-22', 1, 1, 165000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (9, 6, 7, '2025-02-24', '2025-03-17', 1, 1, 63000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (10, 7, 8, '2025-02-15', '2025-03-20', 1, 1, 102000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (11, 8, 9, '2025-02-27', '2025-03-12', 1, 1, 56000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (12, 9, 10, '2025-02-14', '2025-02-16', 1, 1, 8000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (13, 10, 11, '2025-02-24', '2025-03-17', 1, 1, 110000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (14, 11, 13, '2025-02-25', '2025-03-07', 1, 1, 55000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (15, 12, 15, '2025-03-01', '2025-03-04', 1, 1, 13500.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (16, 13, 16, '2025-02-02', '2025-02-04', 1, 1, 9000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (17, 14, 17, '2025-02-25', '2025-03-04', 1, 1, 20000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (18, 15, 18, '2025-02-25', '2025-03-04', 1, 1, 20000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (19, 16, 19, '2025-02-27', null, 1, 1, 2500.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (20, 17, 22, '2025-02-28', '2025-03-15', 1, 1, 128000.00);
INSERT INTO public.booking (bookingid, clientid, roomfundid, checkindate, checkoutdate, statusid, employeeid, totalprice) VALUES (21, 18, 24, '2025-02-11', null, 1, 1, 8000.00);

INSERT INTO public.category (categoryid, name) VALUES (1, 'Одноместный стандарт');
INSERT INTO public.category (categoryid, name) VALUES (2, 'Одноместный эконом');
INSERT INTO public.category (categoryid, name) VALUES (3, 'Стандарт двухместный с 2 раздельными кроватями');
INSERT INTO public.category (categoryid, name) VALUES (4, 'Эконом двухместный с 2 раздельными кроватями');
INSERT INTO public.category (categoryid, name) VALUES (5, '3-местный бюджет');
INSERT INTO public.category (categoryid, name) VALUES (6, 'Бизнес с 1 или 2 кроватями');
INSERT INTO public.category (categoryid, name) VALUES (7, 'Двухкомнатный двухместный стандарт с 1 или 2 кроватями');
INSERT INTO public.category (categoryid, name) VALUES (8, 'Люкс с 2 двуспальными кроватями');
INSERT INTO public.category (categoryid, name) VALUES (9, 'Студия');

INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (1, 'Шевченко', 'Ольга', 'Викторовна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (2, 'Мазалова', 'Ирина', 'Львовна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (3, 'Семеняка', 'Юрий', 'Геннадьевич', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (4, 'Савельев', 'Олег', 'Иванович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (5, 'Бунин', 'Эдуард', 'Михайлович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (6, 'Бахшиев', 'Павел', 'Иннокентьевич', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (7, 'Тюренкова', 'Наталья', 'Сергеевна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (8, 'Любяшева', 'Галина', 'Аркадьевна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (9, 'Александров', 'Петр', 'Константинович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (10, 'Мазалова', 'Ольга', 'Николаевна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (11, 'Лапшин', 'Виктор', 'Романович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (12, 'Гусев', 'Семен', 'Петрович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (13, 'Гладилина', 'Вера', 'Михайловна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (14, 'Масюк', 'Динара', 'Викторовна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (15, 'Лукин', 'Илья', 'Федорович', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (16, 'Петров', 'Станислав', 'Игоревич', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (17, 'Филь', 'Марина', 'Федоровна', null, null, null);
INSERT INTO public.client (clientid, lastname, firstname, middlename, phone, email, passportdata) VALUES (18, 'Михайлов', 'Игорь', 'Вадимович', null, null, null);

INSERT INTO public.employee (employeeid, login, passwordhash, roleid, lastname, firstname, middlename, phone) VALUES (1, 'admin', 'hashed_password', 1, 'Admin', 'System', null, null);

INSERT INTO public.role (roleid, name) VALUES (1, 'Администратор');

INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (1, 1, '101', 1, 2, 2500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (2, 1, '102', 1, 2, 2500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (3, 1, '103', 2, 2, 1800.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (4, 1, '104', 2, 2, 1800.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (5, 1, '105', 3, 2, 3500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (6, 1, '106', 3, 2, 3500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (7, 1, '107', 4, 2, 3000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (8, 1, '108', 4, 2, 3000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (9, 1, '109', 5, 2, 4000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (10, 1, '110', 5, 2, 4000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (11, 2, '201', 6, 2, 5000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (12, 2, '202', 6, 2, 5000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (13, 2, '203', 6, 2, 5000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (14, 2, '204', 7, 2, 4500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (15, 2, '205', 7, 2, 4500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (16, 2, '206', 7, 2, 4500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (17, 2, '207', 1, 2, 2500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (18, 2, '208', 1, 2, 2500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (19, 2, '209', 1, 2, 2500.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (20, 3, '301', 9, 2, 6000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (21, 3, '302', 9, 2, 6000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (22, 3, '303', 9, 2, 6000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (23, 3, '304', 8, 2, 8000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (24, 3, '305', 8, 2, 8000.00);
INSERT INTO public.roomfund (roomfundid, floor, roomnumber, categoryid, statusid, price) VALUES (25, 3, '306', 8, 2, 8000.00);

INSERT INTO public.status (statusid, name) VALUES (1, 'Занят');
INSERT INTO public.status (statusid, name) VALUES (2, 'Чистый');
INSERT INTO public.status (statusid, name) VALUES (3, 'Грязный');
INSERT INTO public.status (statusid, name) VALUES (4, 'Назначен к уборке');




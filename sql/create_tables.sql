-- connect to ehotel db
drop database if exists eHOTELS;
create database eHOTELS;
USE eHOTELS;

-- drop tables
-- drop table if exists Employee;
-- drop table if exists Customer;
-- drop table if exists HotelGroupEmailAddress;
-- drop table if exists HotelGroupPhoneNumbers;
-- drop table if exists HotelGroup;
-- drop table if exists HotelPhoneNumbers;
-- drop table if exists HotelEmailAddress;
-- drop table if exists Hotel;
--
-- drop table if exists Address;

-- Address(AddressID, Street, Number, PostalCode, City)


-- Employee(IRSNumber, FirstName, LastName, SocialSecurityNumber, AddressID)
create table Employee (
  IRSNumber int ,
  FirstName varchar(255),
  LastName varchar(255) not null default '',
  SocialSecurityNumber int(11) not null default 0,
  primary key (IRSNumber),
  index (IRSNumber, LastName, FirstName)
);

create table EmployeeAddress (
  AddressID int not null auto_increment,
  IRSNumber int not null,
  Street varchar(255),
  StreetNumber varchar(4),
  PostalCode varchar(5),
  City varchar(255),
  primary key (AddressID),
  foreign key (IRSNumber) references Employee(IRSNumber),
  index(PostalCode, Street)
);

create table Customer (
  IRSNumber int ,
  FirstName varchar(255),
  LastName varchar(255) not null default '',
  FirstRegistration datetime not null default CURRENT_TIMESTAMP,
  SocialSecurityNumber int(11) not null default 0,
  primary key (IRSNumber),
  index (IRSNumber, LastName, FirstName)
);

create table CustomerAddress (
  AddressID int not null auto_increment,
  IRSNumber int,
  Street varchar(255),
  StreetNumber varchar(4),
  PostalCode varchar(5),
  City varchar(255),
  primary key (AddressID),
  foreign key (IRSNumber) references Customer(IRSNumber),
  index (PostalCode, Street)
);

-- HotelGroup(HotelGroupID, NumberOfHotels, EmailAddress[], PhoneNumber[], AddressID)

create table HotelGroup (
  HotelGroupID int not null auto_increment,
  NumberOfHotels int not null default 0,
  primary key (HotelGroupID)
);

create table HotelGroupAddress (
  AddressID int not null auto_increment,
  HotelGroupID int,
  Street varchar(255),
  StreetNumber varchar(4),
  PostalCode varchar(5),
  City varchar(255),
  foreign key (HotelGroupID) references HotelGroup(HotelGroupID),
  primary key (AddressID),
  index (PostalCode, Street)
);

create table HotelGroupEmailAddress (
  AddressID int not null auto_increment,
  HotelGroupID int,
  EmailAddress varchar(255),
  foreign key (HotelGroupID) references HotelGroup(HotelGroupID),
  primary key (AddressID)
);

create table HotelGroupPhoneNumbers (
  NumberID int not null auto_increment,
  HotelGroupID int,
  PhoneNumber varchar(20),
  foreign key (HotelGroupID) references HotelGroup(HotelGroupID),
  primary key (NumberID)
);

-- Hotel(HotelID, AddressID, Stars, NumberOfRooms, EmailAddress[], PhoneNumber[], HotelGroupID)

create table Hotel (
  HotelID int not null auto_increment,
  Stars int(1) not null default 0,
  NumberOfRooms int not null default 0,
  HotelGroupID int,
  primary key (HotelID),
  foreign key (HotelGroupID) references HotelGroup(HotelGroupID)
);

create table HotelAddress (
  AddressID int not null auto_increment,
  HotelID int,
  Street varchar(255),
  StreetNumber varchar(4),
  PostalCode varchar(5),
  City varchar(255),
  foreign key (HotelID) references Hotel(HotelID),
  primary key (AddressID)
);

create table HotelEmailAddress (
  AddressID int not null auto_increment,
  HotelID int,
  EmailAddress varchar(255),
  foreign key (HotelID) references Hotel(HotelID),
  primary key (AddressID)
);

create table HotelPhoneNumbers (
  NumberID int not null auto_increment,
  HotelID int,
  PhoneNumber varchar(20),
  foreign key (HotelID) references Hotel(HotelID),
  primary key (NumberID)
);

-- weak entities
-- HotelRoom(RoomID, HotelID, Price, Amenities[], Capacity, View, Expandable, RepairsNeed)
create table HotelRoom (
  HotelRoomID int not null auto_increment,
  HotelID int not null,
  Price float,
  Capacity int,
  View varchar(50),
  Expandable int(1) not null default 0,
  RepairsNeed int(1) not null default 0,
  primary key (HotelRoomID),
  foreign key (HotelID) references Hotel(HotelID)
);

create table Amenities (
  HotelRoomID int,
  Amenity varchar(50),
  foreign key (HotelRoomID) references HotelRoom(HotelRoomID)
);

-- N : M relations

-- Works(IRSNumber, HotelID, StartDate, Position, FinishDate)
create table Works (
  WorksID int not null auto_increment,
  IRSNumber int,
  HotelID int,
  Position varchar(50),
  StartDate datetime,
  FinishDate datetime,
  constraint check_work_dates check (StartDate < FinishDate),
  foreign key (IRSNumber) references Employee(IRSNumber),
  foreign key (HotelID) references Hotel(HotelID),
  primary key (WorksID)
);

-- -- Reserves(ReservationID, CustomerIRSNumber, HotelRoomID, StartDate, Paid, FinishDate)
create table Reserves (
  ReservationID int not null auto_increment,
  CustomerIRSNumber int,
  HotelRoomID int,
  StartDate datetime,
  FinishDate datetime,
  Paid int(1) not null default 0,
  constraint check_dates check (StartDate < FinishDate),
  foreign key (CustomerIRSNumber) references Customer(IRSNumber),
  foreign key (HotelRoomID) references HotelRoom(HotelRoomID),
  primary key (ReservationID)
);

-- -- Rents(RentID, CustomerIRSNumber, EmployeeIRSNumber, HotelRoomID, StartDate, FinishDate)
create table Rents (
  RentID int not null auto_increment,
  CustomerIRSNumber int,
  EmployeeIRSNumber int,
  HotelRoomID int,
  StartDate datetime,
  FinishDate datetime,
  foreign key (CustomerIRSNumber) references Customer(IRSNumber),
  foreign key (EmployeeIRSNumber) references Employee(IRSNumber),
  foreign key (HotelRoomID) references HotelRoom(HotelRoomID),
  constraint check_r_dates check (StartDate < FinishDate),
  primary key (RentID)
);

delimiter $$
create trigger reservtrig1
after delete on Reserves
for each row
begin
set @x=(SELECT IRSNumber FROM Works WHERE  HotelID=(SELECT HotelID FROM HotelRoom WHERE HotelRoomID=old.HotelRoomID) AND Position='Manager');
insert into Rents (CustomerIRSNumber, EmployeeIRSNumber, HotelRoomID, StartDate, FinishDate)
VALUES (old.CustomerIRSNumber,@x ,old.HotelRoomID, old.StartDate, old.FinishDate);
end; $$

delimiter $$
create trigger nonoverlap
before insert on Reserves
for each row
begin
IF EXISTS (select * from Reserves
	where (HotelRoomID = new.HotelRoomID)
	and ( (new.StartDate between StartDate and FinishDate) or
		 (new.FinishDate between StartDate and FinishDate) or
         (StartDate between new.StartDate and new.FinishDate) or
	     (FinishDate between new.StartDate and new.FinishDate))
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Overlap found!';
END IF;

end; $$


delimiter $$
create trigger delroomgr
before delete on Hotel
for each row
begin
update HotelGroup set NumberOfHotels = NumberOfHotels - 1 where HotelGroupID = old.HotelGroupID;

end; $$

create trigger delroom
before delete on HotelRoom
for each row
begin
update Hotel set NumberOfRooms = NumberOfRooms - 1 where HotelRoomID = old.HotelRoomID;

end; $$

delimiter $$
create trigger history
after insert on Reserves
for each row
begin
	insert into History (CustomerIRSNumber, HotelRoomID, StartDate, FinishDate, Paid)
    values (new.CustomerIRSNumber, new.HotelRoomID, new.StartDate, new.FinishDate, new.Paid);
end; $$


delimiter $$
create trigger deletemgr
before delete on Works
for each row
begin
IF  EXISTS (select * from Works where HotelID = old.HotelID and Position = 'Manager'
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'No manager exists for this hotel!';
END IF;

end; $$

delimiter $$
create trigger updatemgr
before update on Works
for each row
begin
IF  EXISTS (select * from Works where HotelID = old.HotelID and Position = 'Manager'
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'No manager exists for this hotel!';
END IF;

end; $$

delimiter $$
create trigger update_nr_hotels
before insert on Hotel
for each row
begin
	update HotelGroup set NumberOfHotels = NumberOfHotels + 1
    where HotelGroupID = new.HotelGroupID;
end; $$


delimiter $$
create trigger update_nr_rooms
before insert on HotelRoom
for each row
begin
	update Hotel set NumberOfRooms = NumberOfRooms + 1
    where HotelID = new.HotelID;
end; $$

drop trigger rentcheck;
delimiter $$
create trigger rentcheck
before insert on Rents
for each row
begin
IF not EXISTS (
	select * from WorksHotelRoom where WorksHotelRoom.IRSNumber = new.EmployeeIRSNumber
    and WorksHotelRoom.HotelRoomID = new.HotelRoomID
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Wrong Employee!';
END IF;

end; $$

end; $$

delimiter $$
create trigger chkprice
before insert on HotelRoom
for each row
begin
IF (new.Price < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative Price!';
END IF;

end; $$

delimiter $$
create trigger chknrrooms
before insert on Hotel
for each row
begin
IF (new.NumberOfRooms < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative number of rooms!';
END IF;

end; $$

delimiter $$
create trigger chknrhotels
before insert on HotelGroup
for each row
begin
IF (new.NumberOfHotels < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative number of hotels!';
END IF;

end; $$

delimiter $$
create trigger chknrhotels
before insert on HotelGroup
for each row
begin
IF (new.NumberOfHotels < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative number of hotels!';
END IF;

end; $$

delimiter $$
create trigger phonecheck before insert on HotelGroupPhoneNumbers
for each row
begin
IF (new.PhoneNumber regexp '^(\\+?[0-9]{1,4}-)?[0-9]{3,10}$' ) = 0 THEN
  SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Wrong phone number!';
end if;
END$$

delimiter $$
create trigger chkstreet
before insert on Employee
for each row
begin
IF (new.StreetNumber < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative street number!';
END IF;

end; $$

delimiter $$
create trigger chkstreet2
before insert on Customer
for each row
begin
IF (new.StreetNumber < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative street number!';
END IF;

end; $$

delimiter $$
create trigger chkstreet3
before insert on Hotel
for each row
begin
IF (new.StreetNumber < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Negative street number!';
END IF;

end; $$


delimiter $$
create trigger chkstars
before insert on Hotel
for each row
begin
IF not(new.Stars between 0 and 5) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'No valid stars!';
END IF;

end; $$

use eHOTELS;

delimiter $$
create trigger delroomgr
before delete on Hotel
for each row
begin
delete from Works where HotelID=old.HotelID;
delete from HotelEmailAddress where HotelID=old.HotelID;
delete from HotelPhoneNumbers where HotelID=old.HotelID;
delete from Rents where HotelRoomID in (select HotelRoomID FROM HotelRoom where HotelID=old.HotelID);
delete from Amenities where HotelRoomID in (select HotelRoomID FROM HotelRoom where HotelID=old.HotelID);
delete from HotelRoom where HotelID=old.HotelID;
update HotelGroup set NumberOfHotels = NumberOfHotels - 1 where HotelGroupID = old.HotelGroupID;

end; $$

delimiter $$
create trigger delhotgr
before delete on HotelGroup
for each row
begin
delete from HotelGroupEmailAddress where HotelGroupID=old.HotelGroupID;
delete from HotelGroupPhoneNumbers where HotelGroupID=old.HotelGroupID;
delete from Hotel where HotelGroupID=old.HotelGroupID;

end; $$

delimiter $$

create trigger delroom
before delete on HotelRoom
for each row
begin
update Hotel set NumberOfRooms = NumberOfRooms - 1 where HotelRoomID = old.HotelRoomID;
delete from Amenities where HotelRoomID= old.HotelRoomID;
delete from Rents where HotelRoomID = old.HotelRoomID;

end; $$

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
	and (new.StartDate between StartDate and FinishDate) or
		(new.FinishDate between StartDate and FinishDate)
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Overlap found!';
END IF;

end; $$

delimiter $$
create trigger nonoverlap_upd
before update on Reserves
for each row
begin
IF EXISTS (select * from Reserves
	where (HotelRoomID = new.HotelRoomID)
	and ((new.StartDate between StartDate and FinishDate) or
		(new.FinishDate between StartDate and FinishDate)) and Paid = new.Paid
 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Overlap found!';
END IF;

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
create trigger history_upd
after update on Reserves
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

delimiter $$
create trigger rentcheck
before insert on Rents
for each row
begin
IF EXISTS (
	select * from WorksHotelRoom where WorksHotelRoom.IRSNumber = new.EmployeeIRSNumber
    and WorksHotelRoom.HotelRoomID = new.HotelRoomID
		-- and CURRENT_TIMESTAMP between WorksHotelRoom.StartDate and WorksHotelRoom.FinishDate

 ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Wrong Employee or Employee does not work here anymore!';
END IF;

end; $$

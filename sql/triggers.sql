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

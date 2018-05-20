--create view HotelRoomCapacityView as select * from HotelRoom order by Capacity;
create view HotelRoomCapacityView as select Capacity,Count(HotelRoomID) AS Rooms_Per_Capacity from HotelRoom where HotelRoomID not in (select HotelRoomID from Rents) group by Capacity; --available rooms per Capacity

--create view HotelRoomLocationView as select HotelRoomID, Hotel.HotelID, Price, Expandable, RepairsNeed, Stars, Street, StreetNumber, PostalCode, City from HotelRoom inner join Hotel on Hotel.HotelID = HotelRoom.HotelID order by City;  
create view HotelRoomLocationView as select H.City,Count(HR.HotelRoomID) AS Rooms_Per_City from Hotel AS H inner join HotelRoom AS HR on H.HotelID=HR.HotelID where HR.HotelRoomID not in (select HotelRoomID from Rents) group by City; --available rooms per city

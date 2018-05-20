create view HotelRoomCapacityView as select * from HotelRoom order by Capacity;

create view HotelRoomLocationView as select HotelRoomID, Hotel.HotelID, Price, Expandable, RepairsNeed, Stars, Street, StreetNumber, PostalCode, City from HotelRoom inner join Hotel on Hotel.HotelID = HotelRoom.HotelID order by City;  

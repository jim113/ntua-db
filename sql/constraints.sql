alter table HotelRoom add constraint check(Price > 0);

alter table Reserves add constraint check(StartDate < FinishDate);

alter table HotelGroup add constraint check(StreetNumber > 0);

alter table Hotel add constraint check(StreetNumber > 0);

alter table Customer add constraint check(StreetNumber > 0);

alter table Employee add constraint check(StreetNumber > 0);

alter table Hotel add constraint check(Stars between 0 and 5); 

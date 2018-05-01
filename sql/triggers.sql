create trigger restorev
after delete on Reserves
  referencing old row as old
insert into Rents (CustomerIRSNumber,EmployeeIRSNumber,HotelRoomID,StartDate,FinishDate)
values (old.Customer,old.EmployeeIRSNumber,old.HotelRoomID,old.StartDate,old.FinishDate)

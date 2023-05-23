select booking_id,datetime from booking;

-- resets datetimes
call TESTING_randomizeBookingDateTimes(1,0,0);
select booking_id,datetime from booking;

-- randomizes dates
call TESTING_randomizeBookingDateTimes(0,1,0);
select booking_id,datetime from booking;

-- randomizes datetimes
call TESTING_randomizeBookingDateTimes(0,1,1);
select booking_id,datetime from booking;

-- resets and randomizes
call TESTING_randomizeBookingDateTimes(1,1,1);
select * from booking;
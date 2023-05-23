
drop table if exists rentals;

create temporary table rentals(
	ID int primary key auto_increment,
	vin char(17),
    rent_dt datetime
);

insert into rentals (vin)
select vin
from vehicle
where rand() < 25 / 100;

update rentals
set rent_dt = date_add("2023-03-30 17:05:00", interval (5*60 + 55)*60*rand() second)
where ID > 0;

select * from vehicle;
select * from rentals
order by rent_dt;

insert into payment (amount, pay_dt)
select (rental_rate * 2), (date_add(rentals.rent_dt, interval -5 minute)) as pay_dt
from vehicle
inner join rentals on rentals.vin = vehicle.vin
order by rent_dt;

insert into booking (vin, customer_id, representative_id, payment_id, book_dt)
select
	rentals.vin,
    (select customer_id 
		from customer 
		order by rand() 
		limit 1),
    (select representative_id 
		from representative 
		order by rand() 
		limit 1),
    payment.payment_id,
    rentals.rent_dt
	from payment
	inner join rentals
		on rentals.rent_dt = date_add(payment.pay_dt, interval 5 minute)
	inner join vehicle
		on vehicle.vin = rentals.vin;
    
select * from booking;

drop temporary table rentals;

select * from payment;



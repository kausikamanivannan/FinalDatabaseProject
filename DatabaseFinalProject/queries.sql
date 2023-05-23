select concat(first_name, " ", last_name) as "Customer", I.name as "Insurance"
from customer as C
inner join booking as B 
	on B.customer_id = C.customer_id
inner join insurance as I 
	on I.insurance_id = C.insurance_id
where I.name = "AAA";

select concat(first_name, " ", last_name) as "Customer", customer_id
from customer as C
where customer_id < 3;

select concat(C.first_name, " ", C.last_name) as "Customer", concat(R.first_name, " ", R.last_name) as "Representative"
from customer as C
inner join booking as B
	on B.customer_id = C.customer_id
inner join representative as R
	on R.representative_id = B.representative_id;
    
select B.booking_id, B.vin, B.payment_id, V.rental_rate, P.amount, P.pay_dt, B.book_dt
from booking as B
inner join vehicle as V
	on V.vin = B.vin
inner join payment as P
	on P.payment_id = B.payment_id
order by B.booking_id desc;

select date(B.book_dt) as "week of", sum(P.amount) as payment_total, round(.1 * sum(P.amount), 2) as commissions, round(.9 * sum(P.amount), 2) as net
from booking as B
inner join payment as P
	on P.payment_id = B.payment_id
group by date(book_dt);

select concat(R.first_name, " ", R.last_name) as "Representative", count(*) as bookings, round(.1 * sum(P.amount), 2) as commission
from booking as B
inner join representative as R
	on R.representative_id = B.representative_id
inner join payment as P
	on P.payment_id = B.payment_id
group by R.representative_id;

insert into payment (payment_id, amount, pay_dt)
values (2189, 164.00, "2023-04-14 18:32:54");

insert into booking (booking_id, vin, customer_id, representative_id, payment_id, book_dt)
values (2189, "BC4TO5106BM270965", 32, 17, 2189, "2023-04-14 18:35:04");

select vin, concat(C.first_name, " ", C.last_name) as "Customer", book_dt
from booking as B
inner join customer as C
	on C.customer_id = B.customer_id
where booking_id =  2189;
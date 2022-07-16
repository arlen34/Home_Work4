-- 1) Вывести всех клиентов из страны Canada
select *
from customer
where country = 'Canada';

-- 2) Вывести все страны клиентов
select country
from customer;

-- 3) Вывести количество всех заказов
select count(*)
from orders;

-- 4) Вывести максимальную стоимость заказа
select max(total_amount)
from orders;
-- select  max(total_amount) from orders;
-- select id, total_amount from orders where total_amount=total_amount

-- 5) Найти сумму всех заказов
select sum(total_amount)
from orders;

-- 6) Найти сумму всех заказов за 2014 год
select sum(total_amount)
from orders
where order_date between 'Jan 1 2014' and 'Dec 31 2014';

-- 7) Найти среднюю стоимость всех заказов
select avg(total_amount)
from orders;

-- 8) Найти среднюю стоимость всех заказов по каждому клиенту
select distinct first_name,
                avg(total_amount)
from orders o
         join customer c
              on c.id = o.customer_id
group by first_name;

-- 9) Найти всех клиентов, которые живут в Бразилии или Испании
select *
from customer
where country in ('Brazil', 'Spain');

-- 10 Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
select *
from orders
where order_date between 'Jan 1 2013' and 'Dec 31 2014'
  and total_amount < 100.00;

-- 11) Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
select *
from customer
where country in ('Italy', 'Spain', 'Germany', 'France')
order by country;

-- 12) Найти все страны клиентов, страны которых содержаться в таблице поставщиков
select c.country as Страны_клиентов,
       s.country as Страны_которых_содержаться_в_таблице_поставщиков
from customer c
         join supplier s
              on c.country = s.country;

-- 13) Найти всех клиентов, имена которых начинаются на ‘Jo’
select *
from customer
where first_name like 'Jo%';

-- 14) Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
select *
from customer
where first_name like '___a';

-- 15) Найти количество клиентов по странам
select country, count(*)
from customer
group by country;

-- 16) Найти количество клиентов по странам. Вывести в порядке убывания
select country, count(*)
from customer
group by country
order by count(*) desc;

-- 17) Найти общую сумму стоимости заказов и количество заказов по каждому
-- клиенту (customer_id). Отсортировать по сумме
select c.first_name, count(*), sum(total_amount)
from customer c
         join orders o
              on c.id = o.customer_id
group by c.first_name
order by sum(total_amount) desc;

-- 18) Найти общую сумму стоимости заказов и количество заказов по каждому
-- клиенту (customer_id), у которых общее количество заказов больше 20ти



select sum(total_amount), count(*), c.first_name, quantity
from customer c
         inner join orders o on c.id = o.customer_id
         inner join order_item oi on o.id = oi.order_id
where quantity > 20
group by first_name, quantity;
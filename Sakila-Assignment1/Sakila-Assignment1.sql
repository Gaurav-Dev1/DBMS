-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

select title from film,film_category,category where rating='PG-13' and film.film_id=film_category.film_id and film_category.category_id=category.category_id and category.name="COMEDY";

-- 2. Find out the top 3 rented horror movies.

select title from film_list,rental,inventory where rental.inventory_id=inventory.inventory_id and inventory.film_id=film_list.FID and film_list.category='HORROR' group by title order by count(*) desc limit 3 ;

-- 3. Find out the list of customers from India who have rented sports movies.

select distinct customer_list.name 
from  category, film_category, customer_list, rental, inventory 
where customer_list.country='India' and customer_list.ID = rental.customer_id and rental.inventory_id = inventory.inventory_id and inventory.film_id = film_category.film_id and film_category.category_id = category.category_id and category.name = 'Sports' 
order by customer_list.name;

-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select distinct name
from actor, film_actor, rental, inventory, customer_list
where customer_list.ID = rental.customer_id and customer_list.country = 'Canada' and rental.inventory_id = inventory.inventory_id and inventory.film_id =film_actor.film_id and  actor.actor_id = film_actor.actor_id and first_name = 'NICK' and last_name = 'WAHLBERG';

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted.

select count(*) as Total_No_Of_Movies from film_list,film_actor,actor where film_list.FID=film_actor.film_id and film_actor.actor_id=actor.actor_id and actor.first_name='SEAN' and actor.last_name='WILLIAMS';
 
-- 1. Find out the number of documentaries with deleted scenes.
select count(*) from film,film_category,category where film.film_id=film_category.film_id and film_category.category_id=category.category_id and name='Documentary' and special_features='Deleted Scenes';

-- 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.
select count(distinct i.film_id) from  rental as r,inventory as i,category as c,film as f,store,film_category as fc,staff as s,payment as p where r.inventory_id=i.inventory_id and i.store_id=store.store_id and store.manager_staff_id=s.staff_id and s.first_name='Jon'and last_name='Stephens' and (i.film_id=f.film_id) and (f.film_id=fc.film_id) and (fc.category_id=c.category_id) and c.name='sci-fi';

-- 3. Find out the total sales from Animation movies.
select total_sales from sales_by_film_category where category='Animation';

-- 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
select name from category,customer,rental,inventory,film,film_category where rental.customer_id=(select customer_id from customer where first_name='PATRICIA' and last_name='JOHNSON') and rental.inventory_id=inventory.inventory_id and inventory.film_id=film.film_id and film.film_id=film_category.film_id and film_category.category_id=category.category_id group by name order by count(*) desc limit 3;

 -- 5. Find out the number of R rated movies rented by “SUSAN WILSON”.
select count(distinct film.film_id) from category,customer,rental,inventory,film,film_category where rental.customer_id=(select customer_id from customer where first_name='SUSAN' and last_name='WILSON') and rental.inventory_id=inventory.inventory_id and inventory.film_id=film.film_id and film.rating='R';

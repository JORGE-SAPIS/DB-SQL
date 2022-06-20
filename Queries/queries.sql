#1ª Query
select * from inventory as i
join  rental as r
on r.inventory_id = i.inventory_id

#2ª Query
# Las 3 tablas unidas en su totalidad
select * from film as f
join old_hdd as o
on o.title = f.title
join category as c
on o.category_id = c.category_id
group by f.title

# 3ª Query
select * from actor as a
join actor_films as af
on a.actor_id = af.actor_id
join film as f
on f.film_id = af.film_id

#4ª Query 
select * from rental as r
left join inventory as i
on i.inventory_id = r.inventory_id
group by i.inventory_id
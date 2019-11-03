select
       firstname, lastname,
       (select hometown from profiles where user_id = 1),
       (select filename from media where id =
            (select photo_id from profiles where user_id = 1)
       ) as 'main_photo'
from users where id = 1;

select * from media_types as mt where name like '_____';

select filename from media where user_id = (select id from users where email = 'aiyana68@example.org')
and media_type_id = (select id from media_types as mt where name = 'Photo');

-- агрегирующие функции (avg, max, min, sum, count)
select count(*) as 'photos' from media;

-- архив новостей по месяцам
-- сколько новостей в каждом месяце
select count(*) as counts, monthname(created_at) as month_name from media as m group by monthname(created_at) order by counts desc
select count(*) as cnt, user_id from media group by user_id having cnt > 1;
-- новости друзей
select * from media as m where user_id IN (
    select initiator_user_id from friend_requests as fr where target_user_id = 1 and status = 'approved'
    union
    select target_user_id from friend_requests as fr where initiator_user_id = 1 and status = 'approved'
    )

-- alter table messages add column is_read BOOL default false;

-- вывод сообщений и обновление прочитанных
select * from messages as m where to_user_id = 1 and is_read = 0 order by created_at desc;
-- update messages set is_read = 1 where created_at < date_sub(now(), interval 100 day) and to_user_id = 1;


-- выводим друзей с преобразование пола и возраста
select user_id,
       case(gender)
            when 'm' then 'male'
            when 'f' then 'female'
            else 'it'
        end as gender,
        TIMESTAMPDIFF(YEAR, birthday, now()) as age

from profiles as p where user_id IN (
    select initiator_user_id from friend_requests as fr where target_user_id = 1 and status = 'approved'
    union
    select target_user_id from friend_requests as fr where initiator_user_id = 1 and status = 'approved'
    )

-- alter table vk.communities add admin_user_id BIGINT default 1 not null
-- update communities set admin_user_id = 2 where id=1;
-- является ли пользователь админом
select 1 = (select admin_user_id from communities as c where id = 1) as 'is_admin'


-- homework 6
/* Пусть задан некоторый пользователь.
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем. */
use vk;

select
    from_user_id
     , concat(u.firstname, ' ', u.lastname) as name
     , count(*) as 'messages count'
from messages m
         join users u on u.id = m.from_user_id
where to_user_id = 1
group by from_user_id
order by count(*) desc
limit 1;

-- общее количество лайков, которые получили пользователи младше 10 лет.
select count(*) -- количество лайков
from likes
where media_id in ( -- все медиа записи таких пользователей
    select id
    from media
    where user_id in ( -- все пользователи младше 10 лет
        select
            user_id
            -- 	, birthday
        from profiles as p
        where  YEAR(CURDATE()) - YEAR(birthday) < 10
    )
);

-- общее количество лайков, которые получили пользователи младше 10 лет.
-- выполнено объединением таблиц
select count(*) -- количество лайков
from likes l
         join media m on l.media_id = m.id
         join profiles p on p.user_id = m.user_id
where  YEAR(CURDATE()) - YEAR(birthday) < 10
;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
select
    gender
     , count(*)
from (
         select
             user_id as user,
             (
                 select gender
                 from vk.profiles
                 where user_id = user
             ) as gender
         from likes
     ) as dummy
group by gender;



-- LESSON 8

-- Сложные запросы с использованием JOIN
-- ------------------------------------------------------------ Use vk
use vk;
-- Выборка данных по пользователю
SELECT firstname, lastname, email, phone, gender, birthday, hometown
FROM users
         JOIN profiles ON users.id = profiles.user_id
WHERE users.id = 1;

-- Выборка новостей самого пользователя
SELECT media.user_id, media.body, media.created_at
FROM media
         JOIN users ON media.user_id = users.id
WHERE media.user_id = 1;

-- Сообщения к пользователю
SELECT messages.body, firstname, lastname, messages.created_at
FROM messages
         JOIN users ON users.id = messages.to_user_id
WHERE messages.from_user_id = 1;

-- Сообщения от пользователя
SELECT body, firstname, lastname, created_at
FROM messages
         JOIN users ON users.id = messages.from_user_id
WHERE messages.to_user_id = 1;

-- Количество друзей у всех пользователей
SELECT firstname, lastname, COUNT(*) AS total_friends
FROM users
         JOIN friend_requests ON (users.id = friend_requests.initiator_user_id or users.id = friend_requests.target_user_id)
where friend_requests.status = 'approved'
GROUP BY users.id;

-- Количество друзей у всех пользователей с сортировкой
SELECT firstname, lastname, COUNT(*) AS total_friends
FROM users
         JOIN friend_requests ON (users.id = friend_requests.initiator_user_id or users.id = friend_requests.target_user_id)
where friend_requests.status = 'approved'
GROUP BY users.id
ORDER BY total_friends DESC;

-- Выборка новостей друзей пользователя
SELECT media.user_id, media.body, media.created_at -- все, кому я отправлял заявку в друзья
FROM media
         JOIN friend_requests ON media.user_id = friend_requests.target_user_id
         JOIN users ON friend_requests.initiator_user_id = users.id
WHERE users.id = 1
  and f.status = 'approved'
union
SELECT media.user_id, media.body, media.created_at -- все, кого я подтвердил как друга
FROM media
         JOIN friend_requests ON media.user_id = friend_requests.initiator_user_id
         JOIN users ON friend_requests.target_user_id = users.id
WHERE users.id = 1
  and friend_requests.status = 'approved';

-- Список медиафайлов пользователя с количеством лайков
SELECT media.filename,
       media_types.name,
       COUNT(*) AS total_likes,
       CONCAT(firstname, ' ', lastname) AS owner
FROM media
         JOIN media_types ON media.media_type_id = media_types.id
         JOIN likes ON media.id = likes.media_id
         JOIN users ON users.id = media.user_id
WHERE users.id = 1
GROUP BY media.id;

-- Количество групп у пользователей
SELECT firstname, lastname, COUNT(*) AS total_communities
FROM users
         JOIN users_communities ON users.id = users_communities.user_id
GROUP BY users.id
order by count(*) desc;

-- Среднее количество групп у всех пользователей
SELECT AVG(total_communities) AS average_communities
FROM (
         SELECT firstname, lastname, COUNT(*) AS total_communities
         FROM users
                  JOIN users_communities ON users.id = users_communities.user_id
         GROUP BY users.id
     ) AS list;

-- 10 пользователей с наибольшим количеством лайков за медиафайлы
SELECT firstname, lastname, COUNT(*) AS total_likes
FROM users
         JOIN media ON users.id = media.user_id
         JOIN likes ON media.id = likes.media_id
GROUP BY users.id
ORDER BY total_likes DESC
LIMIT 10;

use vk;
-- количество пользователей в сообществах
select
    c.name,
    count(*)
from users u
         join users_communities uc on u.id = uc.user_id
         join communities c on c.id = uc.community_id
group by c.id


-- ---
-- database SHOP
-- Сложные запросы с использованием JOIN
-- Транзакции, переменные, представления
-- Lesson 8
--

-- ------------------------------------------------------------ Use shop
use shop;

-- CROSS JOIN
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users , orders;

-- CROSS JOIN с условием
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users , orders
WHERE users.id = orders.user_id;

-- INNER JOIN (дает тот же результат)
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users
         JOIN orders
              ON users.id = orders.user_id;

-- INNER JOIN с явным указанием типа
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users
         INNER JOIN orders
                    ON users.id = orders.user_id;

-- INNER JOIN с агрегирующей функцией
-- Подсчёт заказов пользователей
SELECT users.name, COUNT(orders.user_id) AS total_orders
FROM users
         INNER JOIN orders
                    ON users.id = orders.user_id
GROUP BY orders.user_id
ORDER BY total_orders;

-- Аналогично запросу выше, но с сокращением записи имён таблиц
SELECT u.name, COUNT(o.user_id) AS total_orders
FROM users u
         INNER JOIN orders o
                    ON u.id = o.user_id
GROUP BY o.user_id
ORDER BY total_orders;

-- LEFT OUTER JOIN (LEFT JOIN)
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users
         LEFT OUTER JOIN orders
                         ON users.id = orders.user_id;

-- FULL OUTER JOIN (пример без содержательной нагрузки, просто для понимания синтаксиса)
SELECT *
FROM users
         LEFT OUTER JOIN orders ON users.id = orders.user_id
UNION
SELECT *
FROM users
         RIGHT OUTER JOIN orders ON users.id = orders.user_id;

-- Пользователи, у которых нет заказов
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM users
         LEFT OUTER JOIN orders
                         ON users.id = orders.user_id
WHERE orders.id IS NULL;
/*
-- RIGHT OUTER JOIN (RIGHT JOIN)
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
  FROM users
    RIGHT OUTER JOIN orders
  ON users.id = orders.user_id;
*/
-- Показано, что LEFT и RIGHT JOIN работают аналогично
-- Снова пользователи без заказов
SELECT users.id, users.name, users.birthday_at, orders.id, orders.user_id
FROM orders
         RIGHT OUTER JOIN users
                          ON users.id = orders.user_id
WHERE orders.id IS NULL;
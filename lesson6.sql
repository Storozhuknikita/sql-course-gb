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
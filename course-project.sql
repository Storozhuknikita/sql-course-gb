-- COURSE PROJECT INIT
/*
Курсовая работа по Базам данных.
Тема курсовой которую выбрал: система работы для склада с заказами на поставку продукции.
- Склад заводит контрагента
- Делает заявку на контрагента
- Контрагент подтверждает заявку на поставку
- Склад ожидает поставщика и принимает поставку

Таблицы все
- Users (пользователи) - Ok
- Склады (warehouse) - Ok
- Контрагенты (clients) - Ok
- Транспорт (transport) - Ok

- Категории товаров (category) - Ok
- Номенклатура товаров (goods) - Ok
- Заявки (applications) - Ok
- Товары в заявке (application_goods) - Ok

Технические табилицы для хранения информации
- Города (cities) - Ok
- Страны (country) - Ok
- Тип транспортов (transport) - Ok



Требования к курсовому проекту

1. общее текстовое описание БД и решаемых ею задач
2. минимальное количество таблиц - 10
3. скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами)
4. скрипты наполнения БД данными
5. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы)
6. представления (минимум 2)
7. хранимые процедуры / триггеры
8. ...

 */


create table if not exists category
(
    category_id   int          not null
        constraint `PRIMARY`
        primary key,
    category_name varchar(255) not null comment 'Название категории'
)
    comment 'Категории товаров';

create table if not exists clients
(
    client_id              int          not null
        constraint `PRIMARY`
        primary key,
    client_inn             int(12)      not null comment 'ИНН компании',
    client_company_name    varchar(255) not null comment 'Название компании',
    client_company_address varchar(255) not null comment 'Адрес контрагента',
    client_ceo_fio         varchar(255) not null comment 'ФИО ген директора',
    constraint clients_client_inn_uindex
        unique (client_inn)
)
    comment 'Клиенты - Контаргенты';

create table if not exists country
(
    country_id   int          not null
        constraint `PRIMARY`
        primary key,
    country_name varchar(255) not null
)
    comment 'Страны';

create table if not exists cities
(
    city_id         int          not null
        constraint `PRIMARY`
        primary key,
    city_name       varchar(255) not null comment 'Название города',
    city_country_id int          not null,
    constraint cities_country_country_id_fk
        foreign key (city_country_id) references country (country_id)
)
    comment 'Города';

create table if not exists goods
(
    good_id          int          not null
        constraint `PRIMARY`
        primary key,
    good_category_id int          not null comment 'Номер категории',
    good_name        varchar(255) null comment 'Название',
    good_price       varchar(15)  not null comment 'Цена',
    good_description varchar(255) not null comment 'Краткое описание',
    good_barcode     int(13)      not null comment 'Штрих-код EAN',
    constraint goods_category_category_id_fk
        foreign key (good_category_id) references category (category_id)
)
    comment 'Товары';

create table if not exists transport_type
(
    transport_type_id         int          not null
        constraint `PRIMARY`
        primary key,
    transport_type_name       varchar(255) not null comment 'Название',
    transport_weight          varchar(5)   not null comment 'Вес транспорта в тоннах',
    transport_type_date_entry datetime     not null
)
    comment 'Тип Транспорта';

create table if not exists transport
(
    transport_id     int not null
        constraint `PRIMARY`
        primary key,
    transport_type   int not null comment 'Тип транспорта',
    transport_number int not null comment 'Номер автомобиля',
    constraint transport_transport_type_transport_type_id_fk
        foreign key (transport_type) references transport_type (transport_type_id)
)
    comment 'Транспорт';

create table if not exists users
(
    user_id       int auto_increment
        constraint `PRIMARY`
        primary key,
    user_login    varchar(255)         not null comment 'Логин для входа',
    user_password varchar(255)         not null comment 'Пароль',
    user_fio      varchar(255)         not null comment 'ФИО человека',
    user_role     enum ('0', '1', '2') not null comment '0 - поставщик
1 - кладовщик
2 - администратор',
    user_email    varchar(255)         not null comment 'Email',
    user_phone    varchar(40)          not null comment 'Номер телефона'
)
    comment 'Пользователи';

create table if not exists applications
(
    application_id                int not null
        constraint `PRIMARY`
        primary key,
    application_create_user_id    int not null comment 'ID пользователя создавшего заявку',
    application_warehouse_user_id int not null comment 'ID пользователя принимающего на складе',
    application_transport_id      int not null comment 'ID транспорта который используется для перевозки',
    application_driver_user_id    int not null comment 'ID пользователя который осуществляет перевозку',
    constraint applications_transport_transport_id_fk
        foreign key (application_transport_id) references transport (transport_id),
    constraint applications_users_user_id_fk
        foreign key (application_create_user_id) references users (user_id),
    constraint applications_users_user_id_fk_2
        foreign key (application_driver_user_id) references users (user_id),
    constraint applications_users_user_id_fk_3
        foreign key (application_warehouse_user_id) references users (user_id)
);

create table if not exists application_goods
(
    application_goods_id int not null
        constraint `PRIMARY`
        primary key,
    goods_id             int not null comment 'ID товара',
    application_id       int not null comment 'ID заявки',
    constraint application_goods_applications_application_id_fk
        foreign key (application_id) references applications (application_id),
    constraint application_goods_goods_good_id_fk
        foreign key (goods_id) references goods (good_id)
);

create table if not exists warehouse
(
    warehouse_id       int auto_increment
        constraint `PRIMARY`
        primary key,
    warehouse_address  varchar(255) not null comment 'Адрес склада',
    warehouse_admin_id int          not null comment 'ID пользователя кто главный на складе',
    constraint warehouse_users_user_id_fk
        foreign key (warehouse_admin_id) references users (user_id)
)
    comment 'Склады';



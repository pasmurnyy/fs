CREATE DATABASE freespot;
USE freespot;
CREATE TABLE users ( 
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	user_type_id int UNSIGNED NOT NULL, -- whether user is a spot owner or a guest or maybe even both
	hometown_id int UNSIGNED NOT null,
	country_id int UNSIGNED NOT NULL,
	reg_date DATETIME DEFAULT NOW(),
	photo_id int UNSIGNED DEFAULT NULL,
	phone_number varchar(20) UNIQUE,
	identity_status_id int UNSIGNED NOT NULL DEFAULT 1
);

CREATE TABLE user_types (
	id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(20) NOT NULL
);
INSERT INTO user_types(name) VALUES ('Guest'), ('Owner'), ('Guest and owner');

CREATE TABLE identity_status (
	id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	status varchar(20)
);
INSERT INTO identity_status(status) VALUES ('Not confirmed'), ('Confirmed');

CREATE TABLE user_bookmarks ( -- Apartments or spots that user wants to add to his/her bookmarks
	id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id int UNSIGNED NOT NULL,
	spot_id int UNSIGNED NOT NULL
);




CREATE TABLE testimonials ( 
	id int unsigned AUTO_INCREMENT  PRIMARY KEY,
	target_type_id int UNSIGNED NOT NULL,
	target_id int UNSIGNED NOT NULL,
	from_user_id int UNSIGNED,
	post_date datetime DEFAULT now(),
	user_text text NOT NULL,
	rating int UNSIGNED NOT NULL,
	hidden_text text -- special freespot feature that allows reviewer to write a message in the testimonial that can only be seen by the review target
);


CREATE TABLE spot_info (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	name varchar(100) NOT NULL,
	owner_id int UNSIGNED NOT NULL,
	city_id int UNSIGNED NOT NULL,
	spot_sort_id int UNSIGNED NOT NULL,
	spot_type_id int,
	description text,
	guests_amount int UNSIGNED NOT NULL,
	price int UNSIGNED NOT NULL,
	adress varchar(200),
	rules text
);

CREATE TABLE spot_sorts (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	spot_sort varchar(20) NOT NULL UNIQUE
);
INSERT INTO spot_sorts(spot_sort) VALUES ('Мастерская на час'), ('Кабинет'), ('Зал'), ('Видеостудия'), ('Гараж га час');

CREATE TABLE spot_types (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	spot_type varchar(20) NOT NULL UNIQUE
);
INSERT INTO spot_types(spot_type) VALUES ('Столярная мастерская'), ('Гончарная мастерская'), ('Швейная мастерская'), ('Стекло, витраж'), ('Слесарная мастерская'), ('Ювелирная'), ('Макетная мастерская'), ('Кузница'), ('Багетная мастерская'), ('Фотостудия'), ('Цветочная студия'), ('3D мастерская'), ('Художественная'), ('Офортная мастерская'), ('Каллиграфия'), ('Кабинет психолога'), ('Массажный кабинет'), ('Стоматология'), ('Салон красоты'), ('Детская студия'), ('Аудитория'), ('Танцевальный зал'), ('Спортивный зал'), ('Выставочный зал'), ('Театральный зал'), ('Конференц-зал');


CREATE TABLE advantages (
	id int unsigned AUTO_INCREMENT  PRIMARY KEY,
	spot_id int UNSIGNED NOT NULL,
	advantage_type_id int UNSIGNED NOT NULL
);

CREATE TABLE advantage_types(
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	header text NOT null,
	body text NOT null
);

/*
INSERT INTO advantage_types(header, body) VALUES 
('Perfect cleanliness', 'Majority of guest underline that apartment is clean') , 
('Experienced owner','Owners with a lot of experience'),
('Cheap price and good conditions', 'One of the best variants to chose in the region'),
('Best location', 'Building is situated near the supermarket'),
('Parking available', 'Parking inside the building');
*/

CREATE TABLE facilities (
	id int unsigned AUTO_INCREMENT  PRIMARY KEY,
	spot_id int UNSIGNED NOT NULL,
	facility_type_id int unsigned NOT NULL
);

CREATE table facility_types (
	id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	facility_type varchar(20)
);
INSERT INTO facility_types(facility_type) VALUES ('Wi-Fi'), ('Паркинг'), ('Аптеча'), ('Нейлер'), ('Торцорвая пила'), ('Циркулярная пила'), ('Строгальный станок'), ('Гримерная зона'), ('Радиопетличка'), ('LED-панель'), ('Софтбокс'), ('Хромакей'), ('3D сканер'), ('3D принтер'), ('Горелка'), ('Керамическое одеяло'), ('Муфельная пучь'), ('Массажный стол'), ('Душ'), ('Раздевалка'), ('Зонты отражатели'), ('Портретная тарелка'), ('Свидание в мастерской'), ('Зона кофе-брейков'), ('Проектор'), ('Телевизор'), ('Флипчарт'), ('Магнитная доска'), ('Растяжка колец'), ('Голтовка'), ('Микроскоп'), ('Ультро-звуковая ванночка'), ('Вулканизатор'), ('Инжектор'), ('Бормашина'), ('Автовальц'), ('Дневной свет'), ('Бумажный фон'), ('Тканевый фон'), ('Импульсивный свет'), ('Покрасочная камера'), ('Шведская стенка'), ('Хореографический станок'), ('Пол ламинат'), ('Пол паркет'), ('Помощь мастера'), ('Количество локаций'), ('Спецодежда и защита'), ('Кузнечный горн'), ('Вакуумный пресс'), ('Рейсмусовый станок'), ('Фуговальный станок'), ('Форматно-раскроечный станок'), ('Маслосборник'), ('Пескоструйная установка'), ('Гидростойка'), ('Заточный станок'), ('Сварочный аппарат'), ('Гриндер'), ('Фрезерный станок'), ('Сверлильный станок'), ('Токарный станок'), ('Манекен'), ('Раскройный стол'), ('Парогенератор'), ('Швейные машины быт'), ('Швейные машины пром'), ('Паспартурезка'), ('Скрепляющий станок'), ('Гильотина'), ('Шлифовальная машина'), ('Планшет художника'), ('Лифт'), ('Фен строительный'), ('Стол для лепки'), ('Стол раскаточный'), ('Кувалда'), ('Наковальня'), ('Гидромолот'), ('Пол линолеум'), ('Сухая игла'), ('Шабер'), ('Эко-травление'), ('Эдинбургский коктейль'), ('Офортный станок'), ('Кисти'), ('Референсы'), ('Мастихины'), ('Мольберт');

CREATE TABLE available_dates (
	id int unsigned AUTO_INCREMENT  PRIMARY KEY,
	spot_id int UNSIGNED NOT NULL,
	date_from datetime NOT NULL,
	date_till datetime NOT NULL
);


CREATE TABLE cities (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	country_id int UNSIGNED NOT NULL,
	city_name varchar(100) NOT NULL
);




CREATE TABLE orders (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	spot_id int UNSIGNED NOT NULL,
	user_id int UNSIGNED NOT NULL,
	date_from datetime NOT NULL,
	date_till datetime NOT NULL,
	total_price int UNSIGNED NOT NULL,
	order_status_id int UNSIGNED NOT NULL
);

CREATE TABLE order_statuses (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	status varchar(100)
);
INSERT INTO order_statuses (status) VALUES ('Confirmed and payed'), ('Decline'), ('Done');

CREATE TABLE guest_list (
	id int unsigned AUTO_INCREMENT  PRIMARY KEY,
	order_id int UNSIGNED NOT NULL,
	user_id int UNSIGNED NOT NULL
);



CREATE TABLE photos (
	id int UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
	photo_link varchar(100),
	target_id int UNSIGNED NOT NULL
);

ALTER TABLE users
	ADD CONSTRAINT users_user_type_id_fk
	FOREIGN key(user_type_id) REFERENCES user_types(id),
	ADD CONSTRAINT users_hometown_id_fk
	FOREIGN key(country_id) REFERENCES countries(id),
	ADD CONSTRAINT users_photo_id_fk
	FOREIGN key(photo_id) REFERENCES photos(id),
	ADD CONSTRAINT users_identity_status_id_fk
	FOREIGN key(identity_status_id) REFERENCES identity_status(id);

ALTER TABLE user_bookmarks
	ADD CONSTRAINT user_bookmarks_user_id_fk
	FOREIGN key(user_id) REFERENCES users(id),
	ADD CONSTRAINT user_bookmarks_spot_id_fk
	FOREIGN KEY(spot_id) REFERENCES spot_info(id);

ALTER TABLE testimonials 
	ADD CONSTRAINT testimonials_target_type_id_fk
	FOREIGN key(target_type_id) REFERENCES target_type(id),
	ADD CONSTRAINT testimonials_target_id_fk
	FOREIGN key(target_id) REFERENCES users(id),
	ADD CONSTRAINT testimonials_by_user_id_fk
	FOREIGN key(from_user_id) REFERENCES users(id);
	
/*
ALTER TABLE messages 
	ADD CONSTRAINT messages_to_user_id_fk
	FOREIGN key(to_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_from_user_id_fk
	FOREIGN key(from_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_report_type_id_fk
	FOREIGN key(report_type_id) REFERENCES report_types(id);
*/

ALTER TABLE spot_info 
	ADD CONSTRAINT spot_info_owner_id_fk
	FOREIGN key(owner_id) REFERENCES users(id),
	ADD CONSTRAINT spot_info_city_id_fk
	FOREIGN key(city_id) REFERENCES cities(id),
	ADD CONSTRAINT spot_info_spot_type_id_fk
	FOREIGN key(spot_type_id) REFERENCES spot_types(id);


ALTER TABLE advantages 
	ADD CONSTRAINT advantages_spot_id_fk
	FOREIGN key(spot_id) REFERENCES spot_info(id),
	ADD CONSTRAINT advantages_advantage_type_id_fk
	FOREIGN key(advantage_type_id) REFERENCES advantage_types(id);


ALTER TABLE facilities
	ADD CONSTRAINT facilities_spot_id_fk
	FOREIGN key(spot_id) REFERENCES spot_info(id),
	ADD CONSTRAINT facilities_facility_type_id_fk
	FOREIGN key(facility_type_id) REFERENCES facility_types(id);

ALTER TABLE available_dates 
	ADD CONSTRAINT available_dates_spot_id_fk
	FOREIGN key(spot_id) REFERENCES spot_info(id);	


ALTER TABLE orders
	ADD CONSTRAINT orders_spot_id_fk
	FOREIGN key(spot_id) REFERENCES spot_info(id),
	ADD CONSTRAINT orders_user_id_fk
	FOREIGN key(user_id) REFERENCES users(id),
	ADD CONSTRAINT orders_order_status_id_fk
	FOREIGN key(order_status_id) REFERENCES order_statuses(id);

ALTER TABLE guest_list 
	ADD CONSTRAINT guest_list_order_id_fk
	FOREIGN key(order_id) REFERENCES orders(id),
	ADD CONSTRAINT guest_list_user_id_fk
	FOREIGN key(user_id) REFERENCES users(id);

ALTER TABLE photos 
	ADD CONSTRAINT photos_target_type_id_fk
	FOREIGN key(target_type_id) REFERENCES photo_target_types(id);



CREATE INDEX guests_amount_idx ON spot_info(guests_amount); -- to offer users fast search based on guests amount
CREATE INDEX price_idx ON spot_info(price); -- to offer users fast search based on price
CREATE INDEX adress_idx ON spot_info(adress); -- to offer users fast search based on location

CREATE INDEX date_from_idx ON available_dates(date_from);
CREATE INDEX date_till_idx ON available_dates(date_till);

CREATE INDEX name_idx ON users(name);
CREATE INDEX surname_idx ON users(surname);
CREATE INDEX phone_idx ON users(phone_number);

CREATE INDEX post_date_idx ON testimonials(post_date); -- to sort by testimonial date
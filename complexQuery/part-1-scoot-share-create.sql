CREATE TABLE user(
    user_id serial PRIMARY KEY,
    user_name VARCHAR (150) NOT NULL,
    email VARCHAR (150) NOT NULL,
    phone VARCHAR (150) UNIQUE NOT NULL,
    adress VARCHAR (150) NOT NULL,
    join_time TIMESTAMPTZ DEFAULT NOW(), 
    payment_token uuid /* why not linted? */,
    has_flag BOOLEAN

);

CREATE TABLE referral(
    referral_id serial PRIMARY KEY,
    user_id integer NOT NULL,
    referral_name VARCHAR (150) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (user_id)
        ON DELETE CASCADE,

);

CREATE TABLE rental(
    rental_id serial PRIMARY KEY,
    user_id integer NOT NULL,
    scooter_id integer NOT NULL,
    is_returned BOOLEAN,
    when_borrow TIMESTAMPTZ,
    pay_amount NUMERIC (5,2), /* assumption no more than 10k*/
    surcharge NUMERIC (5,2), /* assumption no more than 10k*/
    note VARCHAR (150) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (scooter_id) REFERENCES scooter (scooter_id)
        ON DELETE CASCADE,
);

CREATE TABLE damage(
    damage_id serial PRIMARY KEY,
    rental_id integer NOT NULL,
    damage_type VARCHAR (150) NOT NULL,
    damage_fee VARCHAR (150) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
        ON DELETE CASCADE,

);

CREATE TABLE scooter(
    scooter_id serial PRIMARY KEY,
    scooter_meta_id integer NOT NULL,
    condition VARCHAR (150) NOT NULL,
    FOREIGN KEY (scooter_meta_id) REFERENCES scooter_meta (scooter_meta_id)
        ON DELETE CASCADE,
);

CREATE TABLE scooter_meta(
    scooter_meta_id serial PRIMARY KEY,
    manufacturer_id integer NOT NULL,
    model_number VARCHAR (150) NOT NULL,
    scooter_range VARCHAR (150) NOT NULL,
    scooter_weight VARCHAR (150) NOT NULL,
    top_speed VARCHAR (150) NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (manufacturer_id)
        ON DELETE CASCADE,

);

CREATE TABLE manufacturer(
    manufacturer_id serial PRIMARY KEY,
    manufacturer_name VARCHAR (150) NOT NULL,
    manufacturer_country VARCHAR (150) NOT NULL,

);

CREATE TABLE note(
    note_id serial PRIMARY KEY,
    scooter_id integer NOT NULL,
    category_id integer NOT NULL,
    note_description VARCHAR (150) NOT NULL,
    FOREIGN KEY (scooter_id) REFERENCES scooter (scooter_id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id)
        ON DELETE CASCADE,

);

CREATE TABLE category(
    category_id serial PRIMARY KEY,
    category_name VARCHAR (150) NOT NULL,

);
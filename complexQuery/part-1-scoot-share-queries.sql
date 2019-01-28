/*1. List all people that have flags in any order*/
SELECT user_name FROM user WHERE has_flag = True;
/*2. List all available scooters in any order*/
/*SELECT scooter_id FROM rental WHERE is_returned = True; scooter TABLE QUERY*/
SELECT scooter.scooter_id FROM scooter
INNER JOIN rental on scooter.scooter_id = rental.scooter_id
WHERE rental.is_returned = True

/*3. List all scooters that are being borrowed in order of when they are due back ordered by ...*/
/*CORRECT?*/
SELECT user.user_name, manufacturer.manufacturer, scooter.model_number, when_borrow from rental
INNER JOIN user on rental.user_id = user.user_id
INNER JOIN manufacturer ON (manufacturer.manufacturer_id = scooter_meta.manufacturer_id)
INNER JOIN scooter ON (scooter_meta.scooter_meta_id = scooter.scooter_meta_id)
WHERE rental.is_returned = False ORDER BY (when_borrow + (pay_amount / 2 ||' minutes')::interval)

/*4. List all scooters that are being borrowed and that are late in any order*/
SELECT user.user_name, manufacturer.manufacturer, scooter.model_number from rental
INNER JOIN user on rental.user_id = user.user_id
INNER JOIN manufacturer ON (manufacturer.manufacturer_id = scooter_meta.manufacturer_id)
INNER JOIN scooter ON (scooter_meta.scooter_meta_id = scooter.scooter_meta_id)
WHERE rental.is_returned = False AND current_timestamp > ((pay_amount / 2 ||' minutes')::interval  + when_borrow)) /*minutely rate $2*/

/*5. List the top 5 people (names and number of referrals that have the most referrals sorted by most referrals descending*/
SELECT user_name, count(referral.referral_name) FROM user
INNER JOIN referral on user.user_id = referral.user_id ORDER BY count(referral.referral_name) DESC LIMIT 5;

/*6. Given a unique identifier for a person, show all of the times that person has borrowed a scotter in chronological order*/
SELECT when_borrow FROM rental
INNER JOIN user on rental.user_id = user.user_id
WHERE user.user_id = '123' ORDER BY when_borrow DESC;

/*7. Given a unique identifer for a particular instance of a person borrowing a scooter, show all of the damage / late related fees*/
SELECT damage.damage_type, damage.damage_fee, rental.surcharge from damage
INNER JOIN rental on damage.rental_id = rental.rental_id
WHERE rental.rental_id='1234';

/*8. List all of the manufacturers of scooters in your database, even if you don't ...*/
SELECT manufacturer_name FROM manufacturer;


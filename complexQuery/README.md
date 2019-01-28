# Homework 05

## Scoot-Share

![er diagram for scoot share](https://user-images.githubusercontent.com/29666846/48714100-f1194680-ebdf-11e8-97e9-b6c4d988ad72.jpeg)

* TODO: a list of design decisions
- USER table is like a root (parent) of the whole diagram
    - USER table has
        - join_time as timestamp (which has both date and time) instead of having date and time separtely
        - visited_before as boolean : chek if the join_time is null or not to determine if a user is a first-timer or not
        - payment_token as uuid (Universally unique Identifiers) : get token from 3rd party payment gateway
    - REFERRAL table has
        - a 1 - M relationship with USER table
    - RENTAL table
        - is like a receipt or transaction record betwee nUSER and SCOOTER.
        - when_borrow, pay_amount : by calculating EXPECTED_RETURN_TIME (when_borrow + pay_amount / hourly rate), 
            and comparing EXPECTED_RETURN_TIME with CURRENT_TIMESTAMP, we know whether this bike is returned late or not
        - surcharge : records extra charging to User's payment account for unreturned scooter or a damaged scooter
    - DAMAGE table
        - There are Many (different) damage type and fee drelated to the type of damage.
    - SCOOTER table has
        - Each scooter has its own condition
        - and MANY note about conditions and damages ... information to inform to next clients
        - SCOOTER_META table has information about "SCOOTER MODEL" such as
        weight, range ... and has a relationship with each scooters
    - SCOOTER_META table has
        - it has 1 - M relationship with manufacturer : one bike maker can make Many bike models

* TODO: a list of assumptions
    1) I assume that scooter_range is a property of scooter model (how much each scooter model can drive INSTEAD OF how much each scooter has been driven (ride history of scooter))
    2) ONE manufacturer can make MANY scooter model. But, a scooter model cannot be produced by MULTIPLE manufacturer
    3) Simiarly, ONE scooter can belong to ONE scooter model. A scooter cannot have MULTIPLE scooter model
    4) ONE scooter can have MULTIPLE notes. It is like a history of bike
    5) USER can be referred by multiple people (referral)

Scripts

* [part-1-scoot-share-create.sql](part-1-scoot-share-create.sql)
* [part-1-scoot-share-queries.sql](part-1-scoot-share-queries.sql)

## Normalization

* [part-2-normalization-create.sql](part-2-normalization-create.sql)
* [original dataset](movie_data.csv)
* [part-2-normalization-import.py](part-2-normalization-import.py)
* [part-2-normalization-queries.sql](part-2-normalization-queries.sql)

DROP TABLE IF EXISTS "movies";
CREATE TABLE movies
(
    movie_id INT PRIMARY KEY,
    title TEXT,
    genre TEXT,
    runtime INT,
    year_of_release INT,
    renting_price numeric
);


COPY movies
	FROM PROGRAM 'curl "https://raw.githubusercontent.com/shravan-kuchkula/interview-prep/master/SQL/data/movies_181127_2.csv?token=AGGD7U2NOXYQLMGYJOA5CKC6IA7XY"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "actors";
CREATE TABLE actors
(
    actor_id integer PRIMARY KEY,
    name character varying,
    year_of_birth integer,
    nationality character varying,
    gender character varying
);


COPY actors
	FROM PROGRAM 'curl "https://raw.githubusercontent.com/shravan-kuchkula/interview-prep/master/SQL/data/actors_181127_2.csv?token=AGGD7U74INLYIGZEPZJEWCS6IATJE"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "actsin";
CREATE TABLE actsin
(
    actsin_id integer PRIMARY KEY,
    movie_id integer,
    actor_id integer
);


COPY actsin
	FROM PROGRAM 'curl "https://raw.githubusercontent.com/shravan-kuchkula/interview-prep/master/SQL/data/actsin_181127_2.csv?token=AGGD7U3EILTTP6MFOBPZHF26IBAUE"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "customers";
CREATE TABLE customers
(
	customer_id integer PRIMARY KEY,
    name character varying,
    country character varying,
    gender character varying,
    date_of_birth date,
    date_account_start date
);


COPY customers
	FROM PROGRAM 'curl "https://raw.githubusercontent.com/shravan-kuchkula/interview-prep/master/SQL/data/customers_181127_2.csv?token=AGGD7U4ZUCQFY4O5UGETQS26IBAV2"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "renting";
CREATE TABLE renting
(
    renting_id integer PRIMARY KEY,
    customer_id integer NOT NULL,
    movie_id integer NOT NULL,
    rating integer,
    date_renting date
);


COPY renting
	FROM PROGRAM 'curl "https://raw.githubusercontent.com/shravan-kuchkula/interview-prep/master/SQL/data/renting_181127_2.csv?token=AGGD7U7CNQSF3BW5RIGM3RS6IBAXS"' (DELIMITER ',', FORMAT CSV, HEADER);

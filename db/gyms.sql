DROP TABLE bookings;
DROP TABLE class_times;
DROP TABLE classes;
DROP TABLE instructors;
DROP TABLE customers;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership VARCHAR(255),
  status VARCHAR(255)
);


CREATE TABLE instructors(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  image VARCHAR(255),
   qualifications VARCHAR(255)
);

CREATE TABLE classes(
  id SERIAL PRIMARY KEY,
  activity VARCHAR(255),
  instructor_id INT REFERENCES instructors(id) ON DELETE CASCADE,
  type VARCHAR(255),
  intensity VARCHAR(255)


);

CREATE TABLE class_times(
  id SERIAL PRIMARY KEY,
  class_id INT REFERENCES classes(id) ON DELETE CASCADE,
  time VARCHAR(255),
  date VARCHAR(255),
    capacity INT,
      status VARCHAR(255)
);

CREATE TABLE bookings(
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    class_id INT REFERENCES classes(id) ON DELETE CASCADE,
    class_time_id INT REFERENCES class_times(id) ON DELETE CASCADE

);

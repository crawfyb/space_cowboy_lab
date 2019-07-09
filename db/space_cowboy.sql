DROP TABLE IF EXISTS space_cowboy;

CREATE TABLE space_cowboy(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  favourite_weapon VARCHAR(255),
  bounty_value INT8,
  homeworld VARCHAR(255)
);

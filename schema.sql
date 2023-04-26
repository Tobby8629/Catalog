--create catalog database
CREATE DATABASE catalog;

--create genre table
CREATE TABLE genre(
  id BIGINT PRIMARY KEY,
  name VARCHAR(70),
  items VARCHAR(50)[]
);

--create Item table
CREATE TABLE items(
  id BIGINT PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN
  genre INTEGER REFERENCES genre(id)
);

--create MusicAlbum table share association with genre
CREATE TABLE MusicAlbum(
  id INTEGER PRIMARY KEY,
  on_spotify BOOLEAN,
  published_date DATE,
  artist VARCHAR(50),
  name VARCHAR(50),
  genre INTEGER REFERENCES genre(id)
);
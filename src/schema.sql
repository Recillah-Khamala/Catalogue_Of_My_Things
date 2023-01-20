DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS labels;

-- Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
-- books table (add all properties and associations from the parent Item class as table columns)

-- books Table
CREATE TABLE books(
  id SERIAL NOT NULL PRIMARY KEY,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publisher VARCHAR(255) NOT NULL,
  publication_date DATE NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false 
);

-- labels Table
CREATE TABLE labels(
  id SERIAL NOT NULL PRIMARY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
);

-- create genre table
CREATE TABLE Genre(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL
);

-- create item table

CREATE TABLE item(
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 genre_id INT,
 author_id INT,
 source_id INT,
 label_id INT,
 publish_date Date,
 archived BOOLEAN,
 FOREIGN KEY(genre_id) REFERENCES Genre(id) ON UPDATE CASCADE,
 FOREIGN KEY(author_id) REFERENCES Author(id) ON UPDATE CASCADE,
 FOREIGN KEY(source_id) REFERENCES Source(id) ON UPDATE CASCADE,
 FOREIGN KEY(label_id) REFERENCES Label(id) ON UPDATE CASCADE
);

-- create music_album table
CREATE TABLE MusicAlbum(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY(id) REFERENCES item(id) ON UPDATE CASCADE
);

-- Create Authors Table
CREATE TABLE authors (
    id  INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
);

-- Create Games Table
CREATE TABLE games (
    id  INT,
    multiplayer BOOLEAN,
    last_played_at DATE,
    FOREIGN KEY(id) REFERENCES item(id)
);

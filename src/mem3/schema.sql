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

-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS benefit;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  firstname TEXT NOT NULL,
  lastname TEXT NOT NULL,
  coins INTEGER DEFAULT 0
);

CREATE TABLE benefit (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  picture_path TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price INTEGER NOT NULL,
  redeemed INTEGER DEFAULT 0,
  availability TEXT NOT NULL
);

INSERT INTO user(email, password, firstname, lastname, coins) VALUES("miron@gmail.com", "scrypt:32768:8:1$m1hWZFgFusHuCmjG$0376b04ae06ef7482b44b01aa14775b25350d5294338975455817037706c8ea7cbfc3e5bbfb6a9f959f588c010fa52deca1598c11ac921e9db9ab3715af8ffa3", "Miron", "Boiangiu", 1200);

INSERT INTO benefit(picture_path, name, description, price, availability) VALUES("pic1.webp", "Abonament metrorex 10 calatorii", "This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.", 100, "weekly"),
("pic2.webp", "Cod reducere Decathlon 15%", "This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.", 0, "indefinitely"),
("pic3.webp", "Abonament STB 7 zile", "This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.", 100, "weekly");

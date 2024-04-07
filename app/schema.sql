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
  coins INTEGER DEFAULT 0,
  benefit1 INTEGER DEFAULT 0,
  benefit2 INTEGER DEFAULT 0,
  benefit3 INTEGER DEFAULT 0,
  benefit4 INTEGER DEFAULT 0, 
  benefit5 INTEGER DEFAULT 0, 
  benefit6 INTEGER DEFAULT 0,
  glass REAL DEFAULT 0,
  paper REAL DEFAULT 0,
  plastic REAL DEFAULT 0,
  metal REAL DEFAULT 0
);

CREATE TABLE benefit (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  picture_path TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price INTEGER NOT NULL,
  availability TEXT NOT NULL
);

INSERT INTO user(email, password, firstname, lastname, coins) VALUES("miron@gmail.com", "scrypt:32768:8:1$m1hWZFgFusHuCmjG$0376b04ae06ef7482b44b01aa14775b25350d5294338975455817037706c8ea7cbfc3e5bbfb6a9f959f588c010fa52deca1598c11ac921e9db9ab3715af8ffa3", "Miron", "Boiangiu", 1200);

INSERT INTO benefit(picture_path, name, description, price, availability) 
VALUES
("shop_metrorex.jpeg", "METROREX 10 rides subscription", "Activate this benefit for 10 free subway rides around Bucharest.", 100, "weekly"),
("shop_decathlon.jpeg", "Decathlon 10% discount code", "Activate this benefit for 10% discount to hiking products.", 200, "indefinitely"),
("shop_stb.jpeg", "STB 7 days subscription", "Activate this benefit for 7 days subscription to public transport offered by STB.", 100, "weekly"),
("shop_trotinete.jpeg", "30km with Bolt electric scooters", "Activate this benefit for 30km with Bolt electric scooters for free", 300, "weekly"),
("shop_pepandpepper.jpeg", "Pep&Pepper 20% for BIO menus discount code", "Activate this benefit for 20% discount to select menus from Pep&Pepper.", 250, "indefinitely"),
("shop_worldclass.jpg", "World Class membership 15% discount code", "Activate this benefit for a 15% discount for any Bronze World Class membership.", 400, "monthly");
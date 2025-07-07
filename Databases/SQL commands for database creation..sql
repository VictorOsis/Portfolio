#https://github.com/Generation-UK-I/DatabaseOperations/tree/main
#Rise and grind SQL commands

-- Creating the database
CREATE DATABASE rise&grind;
SHOW DATABASES;

-- Creating tables
CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL(10,2)
    details VARCHAR(100),
    quantity INT
);

CREATE TABLE books (
    book_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    author VARCHAR(100)
);

CREATE TABLE food (
    food_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    allergens VARCHAR(100)
);

CREATE TABLE drinks (
    drink_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    allergens VARCHAR(100)
);

CREATE TABLE employees (
    employee_ID INT NOT NULL PRIMARY KEY,
    user_name VARCHAR(100),
    password DECIMAL(10,2)
);

-- Insert product base
INSERT INTO products (product_id, name, price, details, quantity)
VALUES (1, 'American Psycho', 10.00, 'American Psycho is a black comedy horror novel by American writer Bret Easton Ellis, published in 1991. The story is told in the first-person by Patrick Bateman, a wealthy, narcissistic, and vain Manhattan investment banker who lives a double life as a serial killer',10);
INSERT INTO products (product_id, name, price, details, quantity)
VALUES (2, 'House Of Leaves', 12.99, 'House of Leaves is the debut novel by American author Mark Z. Danielewski, published in March 2000 by Pantheon Books. A bestseller, it has been translated into a number of languages, and is followed by a companion piece, The Whalestoe Letters',10);
INSERT INTO products (product_id, name, price, details, quantity)
VALUES (3, 'The Picture Of Dorian Gray', 15.99, 'The Picture of Dorian Gray is an 1890 philosophical fiction and gothic horror novel by Irish writer Oscar Wilde. A shorter novella-length version was published in the July 1890 issue of the American periodical Lippincotts Monthly Magazine, while the novel-length version was published in April 1891',10);
INSERT INTO products (product_id, name, price, details, quantity)
VALUES (4, 'A Little Life', 10.99, 'A Little Life is a 2015 novel by American writer Hanya Yanagihara. Lengthy and tackling difficult subject matter, it garnered critical acclaim, was shortlisted for the 2015 Man Booker Prize and the National Book Awards, and became a best seller',10);
INSERT INTO products (product_id, name, price, details, quantity)
VALUES (5, 'The Love Hypothesis', 12.99, 'The Love Hypothesis is a romance novel by Ali Hazelwood, published September 14, 2021 by Berkley Books',10);


INSERT INTO books (book_id, product_id, author)
VALUES (1, 1, 'Bret Easton Ellis');
INSERT INTO books (book_id, product_id, author)
VALUES (2, 2, 'Mark Z. Danielewski');
INSERT INTO books (book_id, product_id, author)
VALUES (3, 3, 'Oscar Wilde');
INSERT INTO books (book_id, product_id, author)
VALUES (4, 4, 'Hanya Yanagihara');
INSERT INTO books (book_id, product_id, author)
VALUES (5, 5, 'Ali Hazelwood');


INSERT INTO products (product_id, name, price, details)
VALUES (6, 'Chocolate Muffins', 6.99, 'Rich and delicious Chocolate Muffins made with an intense chocolate batter and studded with chocolate chips throughout');
INSERT INTO products (product_id, name, price, details)
VALUES (7, 'Scones', 5.99, 'A small, often round, quick bread-like pastry, traditionally from Britain and Ireland');
INSERT INTO products (product_id, name, price, details)
VALUES (8, 'Cookie', 7.99, 'A baked snack or dessert that is typically small, flat, and sweet');
INSERT INTO products (product_id, name, price, details)
VALUES (9, 'Victoria Sponge Cakes', 8.99, 'Soft, tender, and fluffy, this Victoria Sponge Cake is a simple but delicious cake thats a British classic for a reason');
INSERT INTO products (product_id, name, price, details)
VALUES (10, 'Lemon Loaf Cake', 12.99, 'This lemon loaf cake is soft, velvety, super moist and is bursting with lemon flavour');
INSERT INTO products (product_id, name, price, details)
VALUES (11, 'Surloin Steak', 12.99, 'Hassiba was talking about a surloin steak after not realising they werent muted lol');

INSERT INTO food (food_id, product_id, allergens)
VALUES (1, 6, 'Gluten (from wheat flour), eggs, and milk');
INSERT INTO food (food_id, product_id, allergens)
VALUES (2, 7, 'gluten (from wheat flour), dairy (milk and butter), and egg');
INSERT INTO food (food_id, product_id, allergens)
VALUES (3, 8, 'wheat (gluten), milk, eggs, nuts (such as peanuts and tree nuts), and soy');
INSERT INTO food (food_id, product_id, allergens)
VALUES (4, 9, 'eggs, gluten (from wheat flour), and milk (from butter and/or milk powder)');
INSERT INTO food (food_id, product_id, allergens)
VALUES (5, 10, 'gluten, eggs, and dairy (milk and butter)');
INSERT INTO food (food_id, product_id, allergens)
VALUES (6, 11, 'None');


INSERT INTO products (product_id, name, price, details)
VALUES (12, 'Espresso', 4.99, 'A concentrated coffee beverage made by forcing hot water under pressure through finely ground coffee beans');
INSERT INTO products (product_id, name, price, details)
VALUES (13, 'Latte', 4.99, 'A milk-based coffee drink typically made with espresso, steamed milk, and a thin layer of frothed milk on top');
INSERT INTO products (product_id, name, price, details)
VALUES (14, 'Cappuccino', 4.99, 'A popular coffee drink, typically made with espresso, steamed milk, and milk foam, all in equal parts');
INSERT INTO products (product_id, name, price, details)
VALUES (15, 'Macchiato', 4.99, 'A coffee beverage that typically consists of a shot of espresso marked or stained with a small amount of steamed or foamed milk');
INSERT INTO products (product_id, name, price, details)
VALUES (16, 'Mocha', 4.99, 'A coffee beverage that combines the flavors of espresso, steamed milk, and chocolate');


INSERT INTO drinks (drink_id, product_id, allergens)
VALUES (1, 12, 'gluten, milk, soy, nuts, and eggs');
INSERT INTO drinks (drink_id, product_id, allergens)
VALUES (2, 13, 'The main allergen concern is milk');
INSERT INTO drinks (drink_id, product_id, allergens)
VALUES (3, 14, 'milk the primary allergen for most people');
INSERT INTO drinks (drink_id, product_id, allergens)
VALUES (4, 15, 'include allergens such as caramel sauce and vanilla syrup which can contain milk and/or soy');
INSERT INTO drinks (drink_id, product_id, allergens)
VALUES (5, 16, 'milk and soy');

 INSERT INTO employees (employee_ID, user_name, password)
 (2, 'Stephen', "Pass"),
 (3, "Stella", "Pass"),
 (4, "Hassiba", "Pass"),
 (5, "Victor", "Pass"),
 (6, "Josef", "Pass")

UPDATE products
SET quantity = 10
WHERE product_ID > 6;

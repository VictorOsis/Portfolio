import mysql.connector
# Import the tabulate module
from tabulate import tabulate


def get_connection():
    return mysql.connector.connect(
    host="127.0.0.1",
    port=4406,
    user="root",
    password="root",
    database="rise_and_grind"
)

print("Connected!")

def table(sql_list):
    data = []
    headers = []
    for x in sql_list:
        newdata =[]
        for key,values in x.items():
            newdata.append(values)
        data.append(newdata)
    for x in sql_list:
        for key in x.keys():
            headers.append(key)
        break
    #print(data)
    #print(headers)
    #Creating a table with headers and a grid format
    table = tabulate(
        data, 
        headers, 
        tablefmt="grid",
        maxcolwidths=[None, 30]  # Set maximum width for the Description column
    )
    print(table)

def fetch_all_products():
    conn = get_connection()
    cursor = conn.cursor()  # Returns rows as dicts
    cursor.execute("SELECT * from products")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def fetch_all_food():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True) # Returns rows as dicts
    cursor.execute("SELECT p.name, p.details,p.price,f.allergens FROM food f JOIN products p ON f.product_ID = p.product_ID;")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def order_food():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True) # Returns rows as dicts
    cursor.execute("SELECT p.name,p.price,p.quantity FROM food f JOIN products p ON f.product_ID = p.product_ID;")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def check_food(food):
    conn = get_connection()
    cursor = conn.cursor()
    query = "SELECT COUNT(*) FROM product WHERE name = %s AND quantity > 0"
    cursor.execute(query, (food,))
    result = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return result


def fetch_all_drinks():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)  # Returns rows as dicts
    cursor.execute("SELECT p.name, p.details,p.price,d.allergens FROM drinks d JOIN products p ON d.product_ID = p.product_ID;")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def fetch_all_books():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)  # Returns rows as dicts
    cursor.execute("SELECT p.name, p.details,p.price,b.author FROM books b JOIN products p ON b.product_ID = p.product_ID;")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def customer_ID_check(id):
    conn = get_connection()
    cursor = conn.cursor()
    query = "SELECT COUNT(*) FROM customers WHERE customer_ID = %s"
    cursor.execute(query, (id,))
    result = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return result > 0

def fetch_all_employees():
    conn = get_connection()
    cursor = conn.cursor(dictionary =True)  # Returns rows as dicts
    cursor.execute("SELECT user_name,password from employees")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def employee_username_check(username):
    conn = get_connection()
    cursor = conn.cursor()
    query = "SELECT COUNT(*) FROM employees WHERE user_name = %s"
    cursor.execute(query, (username,))
    result = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return result > 0

def employee_password_check(password):
    conn = get_connection()
    cursor = conn.cursor()
    query = "SELECT COUNT(*) FROM employees WHERE password = %s"
    cursor.execute(query, (password,))
    result = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return result > 0

def fetch_all_customers():
    conn = get_connection()
    cursor = conn.cursor(dictionary = True)  # Returns rows as dicts
    cursor.execute("SELECT first_name, last_name, age, address, postcode from customers")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return table(results)

def insert_product(name, price, details):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO products (name, price, details) VALUES (%s, %s, %s)",
        (name, price, details)
    )
    conn.commit()
    cursor.close()
    conn.close()

def insert_customer(first_name, last_name, age, address, postcode ):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT MAX(customer_id) FROM customers")
    customer_id_count = (cursor.fetchone()[0]) + 1
    print(customer_id_count)
    cursor.execute(
        "INSERT INTO customers (customer_ID, first_name, last_name, age, address, postcode) VALUES (%s, %s, %s, %s, %s, %s)",
        (customer_id_count,first_name, last_name, age, address, postcode)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return ('Customer details added!')

print (fetch_all_books())


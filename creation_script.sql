/* New table creation */
CREATE TABLE product (
    product_id number NOT NULL,
    product_desc varchar(500) NOT NULL,
    upc number NOT NULL,
    quantity number NOT NULL,
    cost decimal(10, 2) NOT NULL,
    msrp decimal(10, 2) NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (product_id)
);

CREATE TABLE region (
    regionid number NOT NULL,
    region_desc varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    CONSTRAINT region_pk PRIMARY KEY (regionid)
);

CREATE TABLE status (
    status Number NOT NULL,
    status_def Varchar(10) NOT NULL,
    CONSTRAINT status_pk PRIMARY KEY (status)
);

CREATE TABLE store (
    store_Number number NOT NULL,
    regionID number Not Null,
    address Varchar(255) NOT NULL,
    CONSTRAINT store_pk PRIMARY KEY (store_Number),
    CONSTRAINT store_region_FK FOREIGN KEY (regionid) REFERENCES Region (regionid)
);

CREATE TABLE employee(
    employee_number number NOT NULL,
    store_number number NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    role varchar(50) Not Null,
    Employment_Date date NOT NULL,
    reports_to number,
    CONSTRAINT employee_pk PRIMARY KEY (employee_number),
    CONSTRAINT employee_fk1 FOREIGN KEY (reports_to) REFERENCES employee (employee_number),
    CONSTRAINT employee_fk2 FOREIGN KEY (store_number) REFERENCES STORE (store_number)
);

CREATE TABLE customer (
    customer_number number NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    dob date NOT NULL,
    shipping_address varchar(255) NOT NULL,
    sales_rep number,
    CONSTRAINT customer_pk PRIMARY KEY (customer_number),
    CONSTRAINT customer_fk FOREIGN KEY (sales_rep) REFERENCES employee(employee_number)
);

CREATE TABLE orders (
    order_number number NOT NULL,
    date_ordered date NOT NULL,
    comments varchar(500),
    store_number number NOT NULL,
    customer_number number,
    CONSTRAINT orders_pk PRIMARY KEY (order_number),
    CONSTRAINT orders_fk1 FOREIGN KEY (store_number) REFERENCES STORE (store_number),
    CONSTRAINT orders_fk2 FOREIGN KEY (customer_number) REFERENCES customer (customer_number)
);

CREATE TABLE receipt (
    receipt_number number NOT NULL,
    order_number number NOT NULL,
    payment_date date NOT NULL,    
    CONSTRAINT receipt_pk PRIMARY KEY (receipt_number),
    CONSTRAINT receipt_fk FOREIGN KEY (order_number) REFERENCES orders (order_number)
);

CREATE TABLE warehouse (
    order_number number NOT NULL,
    product_id number NOT NULL,
    amount_ordered number NOT NULL,
    shippment_date date,
    expected_arrival date,
    status number,
    CONSTRAINT warehouse_comp_pk PRIMARY KEY (order_number, product_id),
    CONSTRAINT warehouse_fk1 FOREIGN KEY (order_number) REFERENCES orders (order_number),
    CONSTRAINT warehouse_fk2 FOREIGN KEY (product_id) REFERENCES product (product_id),
    CONSTRAINT warehouse_fk3 FOREIGN KEY (status) REFERENCES status (status)
);

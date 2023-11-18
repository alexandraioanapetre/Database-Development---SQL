USE DemoDB

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Alice Johnson', 'alicej@example.com');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1001, 'Laptop', 1200.00),
(1002, 'Smartphone', 800.00),
(1003, 'Headphones', 150.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-01-15', 150.00),
(102, 2, '2023-01-16', 200.50),
(103, 3, '2023-01-17', 99.99);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 101, 1001, 1, 1200.00),
(2, 101, 1003, 2, 150.00),
(3, 102, 1002, 1, 800.00),
(4, 103, 1003, 1, 150.00);

--orders refera customers pe customerid
--orderdetails refera orders cu orderid
--orderdetails refera products cu productid


Select 
*
From Customers C
join Orders O on C.CustomerID = O.CustomerID
join OrderDetails OD on OD.OrderID = O.OrderID
join Products P on P.ProductID = OD.ProductID


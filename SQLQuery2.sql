SELECT * FROM Book
SELECT COUNT (DISTINCT PublisherName) FROM Book;

SELECT DISTINCT PublisherName FROM Book


Create table Publisher (
 Name varchar(30) NOT NULL,
 Address varchar(50) NOT NULL,
 Phone varchar(20) NOT NULL
);


Insert into Publisher (Name, Address, Phone)
Values ('Charles Scribner', '123 N Main St', '555-236-4545');

Select * From Publisher

Insert into Publisher (Name, Address, Phone)
Values ('Greywolf', '456 N Central Ave', '555-784-6565'), ('Harper', '412 W Summer Dr', '555-862-7894'), ('Penguin', '234 S Winter Ave', '555-465-7788'), ('Rand McNally', '5452 N 22nd St', '555-987-5632'), ('Sams Publishing', '6545 N 1st St', '999-654-3579'), ('Thomas Nelson', '675 E Lemon Way', '737-375-8975'), ('William Morrow', '456 S Hill Dr', '555-666-7777'), ('Zondervan', '56 Outer Way', '555-221-4456');

Select * from Publisher

Select * From Book

Create Table Book_Authors(
	BookID int NOT NULL,
	AuthorName varchar(50),
	Foreign Key (BookID) References Book (BookID)
	);

Select * From Book_Authors
Insert into Book_Authors (BookID, AuthorName) Values ('1', 'Sebastian Junger');

Insert into Book_Authors (BookID, AuthorName) Values ('2', 'Coben Thomas'), ('3', 'John Grogan'), ('4', 'Stephen King'), ('5', 'Paula Hawkins'), ('6', 'Harlan Coben'), ('7', 'Karin Slaughter'), ('8', 'Ilona Andrews'), ('9', 'Carl Hiasen'), ('10', 'Stacy Schiff'), ('11', 'Lysa Terkeurst'), ('12', 'Shauna Niequist'), ('13', 'Ann Patchett'), ('14', 'Sebastian Junger'), ('15', 'Claudia Rankine'), ('16', 'Brene Brown'), ('17', 'Aziz Ansari'), ('18', 'Mark Sikes'), ('19', 'A.S. Byatt'), ('20', 'Kate Andersen');

Select * From Book_Authors

Create Table Libary_Branch(

BranchID int Not Null,
BranchName varchar(50) Not Null,
Address varchar(100),
Primary Key (BranchID)
);
Select * From Libary_Branch

Insert Into Libary_Branch (BranchId, BranchName, Address)
 Values (1, 'Sharptown', '132 Sharptown Lane');

 Insert Into Libary_Branch (BranchId, BranchName, Address)
 Values (2, 'Central', '145 Central Ave'), (3, 'Brooklyn', '256 Brooklyn Ave'), (4, 'Jasper', '119 Jasper St');

 Select * From Libary_Branch

 Create Table Book_Copies(
 BookID int,
 BranchID int,
 No_Of_Copies int,
 Foreign Key (BookID) References Book (BookID),
 Foreign Key (BranchID) References Libary_Branch (BranchID)
 );

 Select * From Book_Copies

 Insert into Book_Copies (BookID)
 Select BookID From Book
 
Drop Table Book_Copies

 Create Table Book_Copies(
 BookID int,
 BranchID int,
 No_Of_Copies int,
 Foreign Key (BookID) References Book (BookID),
 Foreign Key (BranchID) References Libary_Branch (BranchID)
);
 Insert into Book_Copies (BookID, BranchID, No_Of_Copies)
 Values (1,1,2),(2,1,2), (3,1,2), (4,1,2), (5,1,2), (6,1,2), (7,1,2), (8,1,2), (9,1,2), (10,1,2);

 Select * From Book_Copies

 Insert into Book_Copies (BookID, BranchID, No_Of_Copies)
 Values (1,2,2),(2,2,2), (3,2,2), (4,2,2), (5,2,2), (6,2,2), (7,2,2), (8,2,2), (9,2,2), (10,2,2);

 Insert into Book_Copies (BookID, BranchID, No_Of_Copies)
 Values (11,3,2), (12,3,2), (13,3,2), (14,3,2), (15,3,2), (16,3,2), (17,3,2), (18,3,2), (19,3,2), (20,3,2);

  Insert into Book_Copies (BookID, BranchID, No_Of_Copies)
 Values (11,4,2), (12,4,2), (13,4,2), (14,4,2), (15,4,2), (16,4,2), (17,4,2), (18,4,2), (19,4,2), (20,4,2);

 Select * From Book_Copies

 Create Table Borrower(
 CardNo int Primary Key,
 Name Varchar(30) Not NULL,
 Address Varchar(50)Not Null,
 Phone Varchar(12)
 );

 Select * From Borrower
 Insert into Borrower (CardNo,Name,Address,Phone) 
 Values (1,'Janelle', '135 Cat Rd', 236-5563);

 Drop Table Borrower

 
 Create Table Borrower(
 CardNo int Primary Key,
 Name Varchar(30) Not NULL,
 Address Varchar(50)Not Null,
 Phone Varchar(12)
 );

 Insert into Borrower (CardNo,Name,Address,Phone) 
 Values (1,'Janelle', '135 Cat Rd', '226-5564');

 Select * From Borrower

  Insert into Borrower (CardNo,Name,Address,Phone) 
 Values (2, 'Jonathan', '117 Dog Dr', '455-2485'), (3, 'Alexandria', '232 100th Lane','324-2498'), (4, 'Brian', '234 100th Lane','324-2499'), (5,' Daniel', '118 Rabbit Dr','455-7984'), (6, 'Julia', '132 Cat Rd', '236-5545'), (7, 'Halina', '114 Sheridan St', '640-1727'), (8, 'Wesley', '114 Owl Ln', '594-0145');

 Update Borrower
 Set Name='Daniel', CardNo=5
 Where Name=' Daniel'

 CREATE TABLE [dbo].[Book_Loans](
	[BookID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[CardNo] [int] NOT NULL,
	[DateOut] [date] NULL,
	[DueDate] [date] NULL
) ON [PRIMARY]

 Select * From Book_Loans

Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (1,1,1,'Jan 01, 2016','Feb 20, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (2,1,2,'Jan 02, 2016','Feb 21, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (3,1,3,'Jan 03, 2016','Feb 22, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (4,1,4,'Jan 04, 2016','Feb 23, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (5,1,5,'Jan 05, 2016','Feb 24, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (6,1,6,'Jan 06, 2016','Feb 25, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (7,1,7,'Jan 07, 2016','Feb 26, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (8,1,8,'Jan 08, 2016','Feb 27, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (9,1,1,'Jan 09, 2016','Feb 28, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (10,1,2,'Jan 10, 2016','Feb 29, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (11,3,3,'Jan 11, 2016','Mar 01, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (12,3,4,'Jan 12, 2016','Mar 02, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (13,3,5,'Jan 13, 2016','Mar 03, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (14,3,6,'Jan 14, 2016','Mar 04, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (15,3,7,'Jan 15, 2016','Mar 05, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (16,3,8,'Jan 16, 2016','Mar 06, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (17,3,1,'Jan 17, 2016','Mar 07, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (18,3,2,'Jan 18, 2016','Mar 08, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (19,3,3,'Jan 19, 2016','Mar 09, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (20,3,4,'Jan 20, 2016','Mar 10, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (1,1,5,'Jan 21, 2016','Mar 11, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (2,1,6,'Jan 22, 2016','Mar 12, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (3,1,7,'Jan 23, 2016','Mar 13, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (4,1,8,'Jan 24, 2016','Mar 14, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (5,1,1,'Jan 25, 2016','Mar 15, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (6,1,2,'Jan 26, 2016','Mar 16, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (7,1,3,'Jan 27, 2016','Mar 17, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (8,1,4,'Jan 28, 2016','Mar 18, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (9,1,5,'Jan 29, 2016','Mar 19, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (10,1,6,'Jan 30, 2016','Mar 20, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (11,3,7,'Jan 31, 2016','Mar 21, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (12,3,8,'Feb 01, 2016','Mar 22, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (13,3,1,'Feb 02, 2016','Mar 23, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (14,3,2,'Feb 03, 2016','Mar 24, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (15,3,3,'Feb 04, 2016','Mar 25, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (16,3,4,'Feb 05, 2016','Mar 26, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (17,3,5,'Feb 06, 2016','Mar 27, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (18,3,6,'Feb 07, 2016','Mar 28, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (19,3,7,'Feb 08, 2016','Mar 29, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (20,3,8,'Feb 09, 2016','Mar 30, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (1,1,1,'Feb 10, 2016','Mar 31, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (2,1,2,'Feb 11, 2016','Apr 01, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (3,1,3,'Feb 12, 2016','Apr 02, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (4,1,4,'Feb 13, 2016','Apr 03, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (5,1,5,'Feb 14, 2016','Apr 04, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (6,1,6,'Feb 15, 2016','Apr 05, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (7,1,7,'Feb 16, 2016','Apr 06, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (8,1,8,'Feb 17, 2016','Apr 07, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (9,1,1,'Feb 18, 2016','Apr 08, 2016')
Insert into Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate) Values (10,1,2,'Feb 19, 2016','Apr 09, 2016')


Update Book_Loans
Set BranchID=2
Where Dateout='Feb 10, 2016'

Update Book_Loans
Set BranchID=2
Where Dateout='Feb 19, 2016';

Select * From Book_Loans

Alter Table Book_Copies
Add Constraint FK_BranchID
Foreign Key (BranchID)
References Library_Branch (BranchID) ON UPDATE CASCADE

 Alter TABLE [dbo].[Book_Loans]
	ADD Foreign Key (BookID) References Book (BookID);

Alter TABLE [dbo].[Book_Loans]
	ADD Foreign Key (BranchID) References Library_Branch (BranchID);

Alter TABLE [dbo].[Book_Loans]
	ADD Foreign Key (CardNo) References Borrower (CardNo);




Select * From Book


Select Book.BookID, Title, Library_Branch.BranchID, BranchName, No_Of_Copies 
From Book
	Join Book_Copies 
	On Book.BookID=Book_Copies.BookID
	Join Library_Branch
	On Book_Copies.BranchID=Library_Branch.BranchID
Where Title='The Lost Tribe' and BranchName='Sharptown';



Select * From Book_Copies

Select Book.BookID, Title, Library_Branch.BranchID, BranchName, No_Of_Copies 
From Book
	Join Book_Copies 
	On Book.BookID=Book_Copies.BookID
	Join Library_Branch
	On Book_Copies.BranchID=Library_Branch.BranchID
Where Title='The Lost Tribe';

Select Borrower.Name, Borrower.CardNo, Book_Loans.BookID
From Book_Loans
  Right Join Borrower
	On Borrower.CardNo=Book_Loans.CardNo
	Where Book_Loans.BookID IS NULL


Select Borrower.Name, Borrower.CardNo, Book_Loans.BookID, Book_Loans.DueDate 
From Borrower
Join Book_Loans
	On Borrower.CardNo=Book_Loans.CardNo
	Where DateOut=Null

Select Library_Branch.BranchID, Library_Branch.BranchName, Book_Loans.BookID, Book_Loans.DueDate, Borrower.Name, Borrower.Address
From Library_Branch
	Join Book_Loans
	On Library_Branch.BranchID=Book_Loans.BranchID
	Join Borrower
	On Book_Loans.CardNo=Borrower.CardNo
	Where Library_Branch.BranchID=1 and Duedate=(SELECT CONVERT(date, getdate()));



Select * from Book_Loans;
Select * from Library_Branch;

SELECT CONVERT(date, getdate());


Insert into Borrower (CardNo, Name, Address, Phone) Values (9, 'Micky', '123 Mouse Dr', '956-2365');

Select * From Borrower



SELECT Library_Branch.BranchName,COUNT(Book_Loans.BookID) AS NumberOfLoans FROM Book_Loans
LEFT JOIN Library_Branch
ON Book_Loans.BranchID=Library_Branch.BranchID
GROUP BY BranchName;




SELECT Borrower.Name, Borrower.Address, COUNT(Book_Loans.BookID) AS NumberOfLoans FROM Book_Loans
LEFT JOIN Borrower
ON Book_Loans.CardNo=Borrower.CardNo
GROUP BY Name, Address
HAVING COUNT(Book_Loans.BookID) > 5;



Select Book.Title, No_Of_Copies
From Book
	Join Book_Copies 
	On Book.BookID=Book_Copies.BookID
	Join Library_Branch
	On Book_Copies.BranchID=Library_Branch.BranchID
	Join Book_Authors
	ON Book.BookID=Book_Authors.BookID
Where AuthorName='Stephen King' AND BranchName='Central';

INSERT INTO Book (Title, PublisherName) Values ('IT', 'Viking Press');

SELECT * FROM Book
DELETE FROM Book
WHERE BookID=22;

INSERT INTO Book_Authors (BookID, AuthorName) Values (21, 'Stephen King');
SELECT * FROM Book_Authors

INSERT INTO Book_Copies (BookID, BranchID, No_Of_Copies) Values (21,2,3);

SELECT * FROM Book_Copies

Select Book.Title, No_Of_Copies
From Book
	Join Book_Copies 
	On Book.BookID=Book_Copies.BookID
	Join Library_Branch
	On Book_Copies.BranchID=Library_Branch.BranchID
	Join Book_Authors
	ON Book.BookID=Book_Authors.BookID
Where AuthorName='Stephen King' AND BranchName='Central';




CREATE PROCEDURE dbo.GetTitle_Copies @BranchName nvarchar(30) = NULL, @AuthorName nvarchar(50) = NULL
AS
	SELECT *
	FROM Book
		Join Book_Copies 
		On Book.BookID=Book_Copies.BookID
		Join Library_Branch
		On Book_Copies.BranchID=Library_Branch.BranchID
		Join Book_Authors
		ON Book.BookID=Book_Authors.BookID
		Where AuthorName= ISNULL(@AuthorName,AuthorName) OR BranchName= ISNULL(@BranchName, BranchName);

DROP PROCEDURE dbo.GetTitle_Copies;


CREATE PROCEDURE dbo.GetTitle_Copies @BranchName nvarchar(30) = NULL, @AuthorName nvarchar(50) = NULL
AS
	SELECT Book.Title, Book_Copies.No_Of_Copies,Library_Branch.BranchName
	FROM Book
		Join Book_Copies 
		On Book.BookID=Book_Copies.BookID
		Join Library_Branch
		On Book_Copies.BranchID=Library_Branch.BranchID
		Join Book_Authors
		ON Book.BookID=Book_Authors.BookID
		Where AuthorName= @AuthorName or BranchName= @BranchName;

EXEC dbo.GetTitle_Copies @AuthorName = N'Stephen King', @BranchName = N'Central';
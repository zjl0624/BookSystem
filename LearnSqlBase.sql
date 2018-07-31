INSERT INTO Teacher(Name,Sal,Sex,Age) VALUES('老马',4200,'男',33)

select sum(Sal) as TotalSal, avg(Age) as avgAge from Teacher where Age < 40 and Sex = '男'

select count(distinct Sal) as HighSal from Teacher where Sal >= 4000

select min(Age) as minAge,max(Age) as maxAge from Teacher

select * from Teacher order by Age desc

update Teacher set Sal = 4200,Name = '老老王' where ID = 2

delete from Teacher where ID = 1

select * from Teacher where Name like '%老%'

select max(Sal) as MaxSal from Teacher group by Sex having max(Sal) <= 4500

select * from Users;
SELECT * FROM MyDb.Books;
insert into Books(BookName,Author,Summary,UpLoadadminId,UpLoadDate) values('书籍7','作者7','书籍7的简介',7,(select now()));
SELECT * FROM MyDb.BorrowInfo;
insert into BorrowInfo(BookId,UserId,BorrowDate) values(5,3,(select now()));

select Users.UserId,Users.Username,Users.Account,Books.BookName from Users 
join BorrowInfo on Users.UserId = BorrowInfo.UserId 
join Books on BorrowInfo.BookId = Books.BookId 
where Users.UserId = 2;


select * from Teacher order by Age limit 0,3;
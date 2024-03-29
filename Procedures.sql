

/****** Object:  StoredProcedure [dbo].[DeleteStudentMaster]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteStudentMaster]
@StudentID int
,@UserID int
as
begin

update [dbo].[StudentMaster]  set Deleted = 1
,DeletedDate = GETDATE()
,DeletedID = @UserID
where StudentID = @StudentID

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentSubject]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteStudentSubject]
@StudentID int
as
begin
Delete from [dbo].[StudentSubject] where StudentID = @StudentID
end
GO
/****** Object:  StoredProcedure [dbo].[insertStudentSubject]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertStudentSubject]
@StudentID int
,@SubjectID int
as
begin
if not exists(select * from [dbo].[StudentSubject] where StudentID = @StudentID and SubjectID = @SubjectID)
begin
insert into  [dbo].[StudentSubject] (StudentID,SubjectID)
values (@StudentID,@SubjectID)
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateStudentMaster]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertUpdateStudentMaster]
@StudentID int
,@Name varchar(1000)
,@MobileNo varchar(15)
,@EmailID varchar(250)
,@DOB date
,@RollNo varchar(50)
,@Address varchar(1000)
,@UserID int
as
begin
if not exists(Select StudentID from [dbo].[StudentMaster] where Deleted = 0 and StudentID = @StudentID)
begin
insert into [dbo].[StudentMaster] 
(Name,MobileNo,EmailID,DOB,RollNo,[Address],CreatedID,CreatedDate,Deleted)
values 
(@Name,@MobileNo,@EmailID,@DOB,@RollNo,@Address,@UserID,GETDATE(),0)

select @@IDENTITY as StudentID

end
else
begin
update [dbo].[StudentMaster] set 
Name = @Name
,MobileNo = @MobileNo
,EmailID = @EmailID
,DOB = @DOB
,RollNo = @RollNo
,[Address] = @Address
,ModifiedID = @UserID
,ModifiedDate = GETDATE()
where StudentID = @StudentID
select @StudentID as StudentID
end
end 
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentMaster]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectStudentMaster]
@StudentID int
as
begin
Select StudentID
,Name
,MobileNo
,EmailID
,CONVERT(varchar(20), DOB,103) as SDOB
,RollNo
,[Address] from [dbo].[StudentMaster] 
where Deleted = 0 and (StudentID = @StudentID or 0 = @StudentID)

end
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentSubjectList]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectStudentSubjectList]
@StudentID int
as
begin
Select distinct SubjectID from [dbo].[StudentSubject] where StudentID = @StudentID
end
GO
/****** Object:  StoredProcedure [dbo].[SelectSubjectList]    Script Date: 03/11/2019 4:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectSubjectList]
as
begin
SELECT [SubjectID],[Name] FROM [dbo].[SubjectMaster] where Deleted= 0
end
GO

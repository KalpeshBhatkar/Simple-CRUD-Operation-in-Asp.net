/****** Object:  Table [dbo].[StudentMaster]    Script Date: 03/11/2019 3:58:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[StudentMaster](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NULL,
	[MobileNo] [varchar](15) NULL,
	[EmailID] [varchar](250) NULL,
	[DOB] [date] NULL,
	[RollNo] [varchar](50) NULL,
	[Address] [varchar](1000) NULL,
	[CreatedID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedID] [int] NULL,
	[DeletedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_StudentMaster] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[StudentSubject]    Script Date: 03/11/2019 3:58:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StudentSubject](
	[StudentSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[SubjectID] [int] NULL,
 CONSTRAINT [PK_StudentSubject] PRIMARY KEY CLUSTERED 
(
	[StudentSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[SubjectMaster]    Script Date: 03/11/2019 3:59:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SubjectMaster](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[CreatedID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedID] [int] NULL,
	[DeletedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_SubjectMaster] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO







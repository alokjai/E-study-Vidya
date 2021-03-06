USE [EstudyCorner]
GO
/****** Object:  Table [dbo].[Softupload]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Softupload](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[softDate] [datetime] NULL,
	[SoftName] [varchar](60) NULL,
	[SoftFile] [varchar](200) NULL,
 CONSTRAINT [PK_Softupload] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Softupload] ON
INSERT [dbo].[Softupload] ([SerialNo], [softDate], [SoftName], [SoftFile]) VALUES (1, CAST(0x0000AC0000AF37CD AS DateTime), N'anydesk', N'uxq305so.5rs.EXE')
INSERT [dbo].[Softupload] ([SerialNo], [softDate], [SoftName], [SoftFile]) VALUES (2, CAST(0x0000AC0000B06FC9 AS DateTime), N'anydesk', N'ww4teb0k.vao.EXE')
INSERT [dbo].[Softupload] ([SerialNo], [softDate], [SoftName], [SoftFile]) VALUES (3, CAST(0x0000AC00013AAC98 AS DateTime), N'rufus', N'cradksnh.v0o.EXE')
SET IDENTITY_INSERT [dbo].[Softupload] OFF
/****** Object:  Table [dbo].[registration]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NULL,
	[Fname] [varchar](60) NULL,
	[college] [varchar](60) NULL,
	[Qualification] [varchar](100) NULL,
	[branch] [varchar](100) NULL,
	[course_year] [int] NULL,
	[training_name] [varchar](100) NULL,
	[emailID] [varchar](100) NOT NULL,
	[mobno] [varchar](13) NULL,
	[gender] [varchar](7) NULL,
	[address] [varchar](300) NULL,
	[picName] [varchar](200) NULL,
	[pass] [varchar](60) NULL,
	[regDate] [datetime] NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[emailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[registration] ON
INSERT [dbo].[registration] ([Sn], [name], [Fname], [college], [Qualification], [branch], [course_year], [training_name], [emailID], [mobno], [gender], [address], [picName], [pass], [regDate]) VALUES (1, N'Alok jaiswal', N'Anil jaiswal', N'Government polytechnic jaunpur', N'Diploma', N'Computer Science & Engineering', 2018, N'Asp.net with MVC', N'alokjaiswal@gmail.com', N'9369474565', N'male', N'Rampur, jaunpur', N'qt0s2tlw.ufs20190330_164451-1.jpg', N'Alok@123', CAST(0x0000ABEE0153F50E AS DateTime))
INSERT [dbo].[registration] ([Sn], [name], [Fname], [college], [Qualification], [branch], [course_year], [training_name], [emailID], [mobno], [gender], [address], [picName], [pass], [regDate]) VALUES (7, N'Alok kumar', N'anil kumar ', N'Government polytechnic jaunpur', N'Diploma', N'Machanical Engineering', 2018, N'PHP with CodeIgnitor', N'Ashishkumar@gmail.com', N'76564564465', N'male', N'Lakhapur, jaunpur', N'iegbwbxv.1bfsachin1.jpg', N'qwerty', CAST(0x0000ABF0014889E9 AS DateTime))
SET IDENTITY_INSERT [dbo].[registration] OFF
/****** Object:  Table [dbo].[notification]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notification](
	[notyID] [int] IDENTITY(1,1) NOT NULL,
	[msg] [varchar](300) NULL,
	[notydate] [datetime] NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[notyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[notification] ON
INSERT [dbo].[notification] ([notyID], [msg], [notydate]) VALUES (8, N'Today Project Submission  of .Net Please Submit your Project.', CAST(0x0000ABFC009AAB12 AS DateTime))
INSERT [dbo].[notification] ([notyID], [msg], [notydate]) VALUES (9, N'Date 26/07/2020 is Hosting Day of Project ,so Please Attend', CAST(0x0000AC0100B4DB2E AS DateTime))
SET IDENTITY_INSERT [dbo].[notification] OFF
/****** Object:  Table [dbo].[login]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[userID] [varchar](100) NOT NULL,
	[pass] [varchar](50) NULL,
	[Utype] [varchar](20) NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[login] ([userID], [pass], [Utype]) VALUES (N'alokjaiswal@gmail.com', N'sygtv{', N'Student')
INSERT [dbo].[login] ([userID], [pass], [Utype]) VALUES (N'alokjaiswalcs@gmail.com', N'sygtv{', N'Admin')
INSERT [dbo].[login] ([userID], [pass], [Utype]) VALUES (N'Ashishkumar@gmail.com', N'sygtv{', N'Student')
/****** Object:  Table [dbo].[Library]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Library](
	[BookId] [int] IDENTITY(100,1) NOT NULL,
	[Title] [varchar](30) NULL,
	[BookName] [varchar](60) NULL,
	[BookWriter] [varchar](60) NULL,
	[AddedON] [datetime] NULL,
	[BookFileName] [varchar](200) NULL,
 CONSTRAINT [PK_Library] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Library] ON
INSERT [dbo].[Library] ([BookId], [Title], [BookName], [BookWriter], [AddedON], [BookFileName]) VALUES (101, N'CSE', N'Java for Begiener', N'james gosling', CAST(0x0000AC000138C90E AS DateTime), N'kd4r3gcg.llk.PDF')
SET IDENTITY_INSERT [dbo].[Library] OFF
/****** Object:  Table [dbo].[assignment]    Script Date: 07/29/2020 10:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[assignment](
	[assignID] [int] IDENTITY(1,1) NOT NULL,
	[assignDATE] [varchar](30) NULL,
	[assignName] [varchar](30) NULL,
	[fileName] [varchar](200) NULL,
	[NoQues] [int] NULL,
	[addedON] [datetime] NULL,
 CONSTRAINT [PK_assignment] PRIMARY KEY CLUSTERED 
(
	[assignID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[assignment] ON
INSERT [dbo].[assignment] ([assignID], [assignDATE], [assignName], [fileName], [NoQues], [addedON]) VALUES (1, N'18july', N'dropdown list', N'ni3bvjkk.qk0.JPG', 4, CAST(0x0000ABFC01413A32 AS DateTime))
INSERT [dbo].[assignment] ([assignID], [assignDATE], [assignName], [fileName], [NoQues], [addedON]) VALUES (2, N'20 july', N'c#', N'bviktgtb.ezz.PDF', 0, CAST(0x0000ABFE01333EBC AS DateTime))
SET IDENTITY_INSERT [dbo].[assignment] OFF
/****** Object:  Table [dbo].[enquiry]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[enquiry](
	[enquiryid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NULL,
	[emailId] [varchar](100) NULL,
	[mobno] [varchar](13) NULL,
	[message] [varchar](500) NULL,
	[enquiry_dt] [datetime] NULL,
 CONSTRAINT [PK_enquiry] PRIMARY KEY CLUSTERED 
(
	[enquiryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[enquiry] ON
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (1, N'SANTOSH KUMAR JAISWAL', N'santoshjaiswaljnp8726@gmail.com', N'06306728878', NULL, CAST(0x0000ABF801556B33 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (2, N'SANTOSH KUMAR JAISWAL', N'santoshjaiswal@gmail.com', N'063067675765', NULL, CAST(0x0000ABF80156F7E6 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (3, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', NULL, CAST(0x0000ABF8015F1617 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (4, N'agam kumar', N'Agam@gmail.com', N'9369474565', N'How Are Teach', CAST(0x0000ABFA00901306 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (5, N'anurag Yadav', N'anurag@gmail.com', N'9369474565', N'Why not work forget Password', CAST(0x0000AC020159BC39 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (6, N'anurag Yadav', N'anurag@gmail.com', N'9369474565', N'Why not work forget Password', CAST(0x0000AC02015A1CD5 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (7, N'anurag Yadav', N'anurag@gmail.com', N'9369474565', N'Why not work forget Password', CAST(0x0000AC02015A68C3 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (8, N'SANTOSH KUMAR JAISWAL', N'santoshjaiswaljnp@gmail.com', N'9369474565', N'Hello!
how are you', CAST(0x0000AC0400A52B32 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (9, N'SANTOSH KUMAR JAISWAL', N'santoshjaiswaljnp@gmail.com', N'9369474565', N'Hello!
how are you', CAST(0x0000AC0400A530DD AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (10, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.', CAST(0x0000AC07009C9BC3 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (11, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.

jhfjhgjhkj', CAST(0x0000AC07009CDE76 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (12, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.

jhfjhgjhkj', CAST(0x0000AC07009CE14A AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (13, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.', CAST(0x0000AC07009CE1AB AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (14, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.', CAST(0x0000AC07009CE2B5 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (15, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.', CAST(0x0000AC07009CE4A6 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (16, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.

jhfjhgjhkj', CAST(0x0000AC07009CE551 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (17, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.', CAST(0x0000AC07009CE5F8 AS DateTime))
INSERT [dbo].[enquiry] ([enquiryid], [name], [emailId], [mobno], [message], [enquiry_dt]) VALUES (18, N'Alok jaiswal', N'alokjaiswal@gmail.com', N'9369474565', N'how it work.

jhfjhgjhkj', CAST(0x0000AC07009CE69C AS DateTime))
SET IDENTITY_INSERT [dbo].[enquiry] OFF
/****** Object:  Table [dbo].[StudyMaterial]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudyMaterial](
	[StdMatID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](30) NULL,
	[FileName] [varchar](200) NULL,
	[FileType] [varchar](20) NULL,
	[AddedON] [datetime] NULL,
 CONSTRAINT [PK_StudyMaterial] PRIMARY KEY CLUSTERED 
(
	[StdMatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudyMaterial] ON
INSERT [dbo].[StudyMaterial] ([StdMatID], [title], [FileName], [FileType], [AddedON]) VALUES (1, NULL, N'cwyprlkk.j2v.PDF', N'.PDF', CAST(0x0000AC0400AFBC04 AS DateTime))
SET IDENTITY_INSERT [dbo].[StudyMaterial] OFF
/****** Object:  Table [dbo].[StdUpload]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StdUpload](
	[uploadID] [int] IDENTITY(1,1) NOT NULL,
	[topic] [varchar](50) NULL,
	[description] [varchar](300) NULL,
	[filename] [varchar](200) NULL,
	[userId] [varchar](100) NULL,
	[uploadDT] [datetime] NULL,
 CONSTRAINT [PK_StdUpload] PRIMARY KEY CLUSTERED 
(
	[uploadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StdUpload] ON
INSERT [dbo].[StdUpload] ([uploadID], [topic], [description], [filename], [userId], [uploadDT]) VALUES (1, N'18july', N'Task Completed', N'zp3ygvrk.cpr.PDF', NULL, CAST(0x0000ABFF01366C24 AS DateTime))
SET IDENTITY_INSERT [dbo].[StdUpload] OFF
/****** Object:  Table [dbo].[StdFeedback]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StdFeedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[Message] [varchar](max) NULL,
	[FeedbackDt] [datetime] NULL,
 CONSTRAINT [PK_StdFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StdFeedback] ON
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (1, N'Ashishkumar@gmail.com', N'due to covid-19', N'hello how are you', CAST(0x0000ABF40130BA74 AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (2, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF601133589 AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (3, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF6011384C3 AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (4, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF60113BB64 AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (5, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF60113F898 AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (6, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF601143B0C AS DateTime))
INSERT [dbo].[StdFeedback] ([FeedbackID], [userID], [subject], [Message], [FeedbackDt]) VALUES (7, N'Ashishkumar@gmail.com', N'Digital marketing', N'ahsjdkgkgbnd fjv jfunfbi ygrhgrifjg
wfghgurihdjghrughdb efuegfu fyiur
euyfuyyighu', CAST(0x0000ABF60114694D AS DateTime))
SET IDENTITY_INSERT [dbo].[StdFeedback] OFF
/****** Object:  Table [dbo].[Dquestion]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dquestion](
	[Qid] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](500) NULL,
	[userID] [varchar](100) NULL,
	[askDate] [datetime] NULL,
 CONSTRAINT [PK_Dquestion] PRIMARY KEY CLUSTERED 
(
	[Qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dquestion] ON
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (1, N'hello ;  what is razor block?', N'Ashishkumar@gmail.com', CAST(0x0000ABF5009B656B AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (2, N'hello ;  what is razor block?', N'Ashishkumar@gmail.com', CAST(0x0000ABF5009BFE2F AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (3, N'what is blazor ', N'Ashishkumar@gmail.com', CAST(0x0000ABF5009D629D AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (4, N'what is blazor ', N'Ashishkumar@gmail.com', CAST(0x0000ABF5009DBCF5 AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (5, N'what is blazor ', N'Ashishkumar@gmail.com', CAST(0x0000ABF5009E2921 AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (6, N'Who invented C language', N'Ashishkumar@gmail.com', CAST(0x0000ABFB01084D69 AS DateTime))
INSERT [dbo].[Dquestion] ([Qid], [question], [userID], [askDate]) VALUES (7, N'Father of Java
', N'Ashishkumar@gmail.com', CAST(0x0000AC000132FAF9 AS DateTime))
SET IDENTITY_INSERT [dbo].[Dquestion] OFF
/****** Object:  Table [dbo].[DAnswer]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DAnswer](
	[AnsID] [int] IDENTITY(1,1) NOT NULL,
	[QuesID] [int] NULL,
	[userID] [varchar](100) NULL,
	[answer] [varchar](500) NULL,
	[ansDATE] [datetime] NULL,
 CONSTRAINT [PK_DAnswer] PRIMARY KEY CLUSTERED 
(
	[AnsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DAnswer] ON
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (1, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF9012E6447 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (2, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF9012FADCE AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (3, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF9012FF84E AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (4, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF9013004ED AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (5, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90130FAE5 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (6, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF9013145EC AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (7, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF901318A4A AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (8, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90131D9D0 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (9, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90131F94B AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (10, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF901323179 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (11, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90132807A AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (12, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90132E5D9 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (13, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90133F92D AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (14, 5, N'Ashishkumar@gmail.com', N'Hello blazor is latest version.', CAST(0x0000ABF90135538C AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (15, 6, N'Ashishkumar@gmail.com', N'Denish ritche', CAST(0x0000ABFB0108712D AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (16, 2, N'Ashishkumar@gmail.com', N'Razor block is a ', CAST(0x0000ABFE0120EF66 AS DateTime))
INSERT [dbo].[DAnswer] ([AnsID], [QuesID], [userID], [answer], [ansDATE]) VALUES (17, 7, N'Ashishkumar@gmail.com', N'James Gosling', CAST(0x0000AC0001332155 AS DateTime))
SET IDENTITY_INSERT [dbo].[DAnswer] OFF
/****** Object:  Table [dbo].[LeaveApp]    Script Date: 07/29/2020 10:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveApp](
	[AppliID] [int] IDENTITY(200,1) NOT NULL,
	[FileName] [varchar](200) NULL,
	[FileType] [varchar](50) NULL,
	[userID] [varchar](100) NULL,
	[Subject] [varchar](200) NULL,
	[AddedON] [datetime] NULL,
 CONSTRAINT [PK_LeaveApp] PRIMARY KEY CLUSTERED 
(
	[AppliID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveApp] ON
INSERT [dbo].[LeaveApp] ([AppliID], [FileName], [FileType], [userID], [Subject], [AddedON]) VALUES (200, N'hwtenmwk.mms.PDF', N'.PDF', NULL, N'Fever Application', CAST(0x0000AC05009FF8F3 AS DateTime))
SET IDENTITY_INSERT [dbo].[LeaveApp] OFF
/****** Object:  ForeignKey [FK_DAnswer_registration]    Script Date: 07/29/2020 10:55:44 ******/
ALTER TABLE [dbo].[DAnswer]  WITH CHECK ADD  CONSTRAINT [FK_DAnswer_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([emailID])
GO
ALTER TABLE [dbo].[DAnswer] CHECK CONSTRAINT [FK_DAnswer_registration]
GO
/****** Object:  ForeignKey [FK_Dquestion_registration]    Script Date: 07/29/2020 10:55:44 ******/
ALTER TABLE [dbo].[Dquestion]  WITH CHECK ADD  CONSTRAINT [FK_Dquestion_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([emailID])
GO
ALTER TABLE [dbo].[Dquestion] CHECK CONSTRAINT [FK_Dquestion_registration]
GO
/****** Object:  ForeignKey [FK_LeaveApp_registration]    Script Date: 07/29/2020 10:55:44 ******/
ALTER TABLE [dbo].[LeaveApp]  WITH CHECK ADD  CONSTRAINT [FK_LeaveApp_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([emailID])
GO
ALTER TABLE [dbo].[LeaveApp] CHECK CONSTRAINT [FK_LeaveApp_registration]
GO
/****** Object:  ForeignKey [FK_StdFeedback_registration]    Script Date: 07/29/2020 10:55:44 ******/
ALTER TABLE [dbo].[StdFeedback]  WITH CHECK ADD  CONSTRAINT [FK_StdFeedback_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([emailID])
GO
ALTER TABLE [dbo].[StdFeedback] CHECK CONSTRAINT [FK_StdFeedback_registration]
GO
/****** Object:  ForeignKey [FK_StdUpload_registration]    Script Date: 07/29/2020 10:55:44 ******/
ALTER TABLE [dbo].[StdUpload]  WITH CHECK ADD  CONSTRAINT [FK_StdUpload_registration] FOREIGN KEY([userId])
REFERENCES [dbo].[registration] ([emailID])
GO
ALTER TABLE [dbo].[StdUpload] CHECK CONSTRAINT [FK_StdUpload_registration]
GO

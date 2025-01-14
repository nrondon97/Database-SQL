USE [master]
GO

IF DB_ID('Examples') IS NOT NULL
DROP DATABASE [Examples]
GO

/****** Object:  Database [Examples]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE DATABASE [Examples]
GO
ALTER DATABASE [Examples] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examples].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Examples] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examples] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examples] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examples] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examples] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examples] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Examples] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Examples] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Examples] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examples] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examples] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examples] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examples] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examples] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examples] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examples] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examples] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examples] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examples] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examples] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examples] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examples] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examples] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examples] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Examples] SET  MULTI_USER 
GO
ALTER DATABASE [Examples] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [Examples] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examples] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examples] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Examples]
GO
/****** Object:  Table [dbo].[ActiveInvoices]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActiveInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [smalldatetime] NOT NULL,
	[PaymentDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APFlat]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APFlat](
	[VendorName] [varchar](50) NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[ItemDescription1] [varchar](100) NULL,
	[ItemDescription2] [varchar](100) NULL,
	[ItemDescription3] [varchar](100) NULL,
	[ItemDescription4] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerLast] [nvarchar](30) NULL,
	[CustomerFirst] [nvarchar](30) NULL,
	[CustAddr] [nvarchar](60) NULL,
	[CustCity] [nvarchar](15) NULL,
	[CustState] [nvarchar](15) NULL,
	[CustZip] [nvarchar](10) NULL,
	[CustPhone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateSample]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateSample](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[FirstName] [varchar](35) NOT NULL,
	[DeptNo] [int] NOT NULL,
	[ManagerID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeesOld]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeesOld](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[FirstName] [varchar](35) NOT NULL,
	[DeptNo] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeesTest]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeesTest](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[FirstName] [varchar](35) NOT NULL,
	[DeptNo] [int] NOT NULL,
	[ManagerID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Investors]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Investors](
	[InvestorID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[ZipCode] [char](10) NULL,
	[Phone] [char](20) NULL,
	[Investments] [money] NULL,
	[NetGain] [money] NULL,
 CONSTRAINT [PK_Investors] PRIMARY KEY CLUSTERED 
(
	[InvestorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] NOT NULL,
	[InvoiceNumber] [int] NULL,
	[InvoiceTotal] [smallmoney] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NullSample]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NullSample](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceTotal] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaidInvoices]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaidInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [smalldatetime] NOT NULL,
	[PaymentDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectNo] [char](5) NOT NULL,
	[EmployeeID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RealSample]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealSample](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[R] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReps]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReps](
	[RepID] [int] IDENTITY(1,1) NOT NULL,
	[RepFirstName] [varchar](50) NOT NULL,
	[RepLastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SalesReps] PRIMARY KEY CLUSTERED 
(
	[RepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesTotals]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesTotals](
	[RepID] [int] NOT NULL,
	[SalesYear] [char](4) NOT NULL,
	[SalesTotal] [money] NOT NULL,
 CONSTRAINT [PK_SalesTotals] PRIMARY KEY CLUSTERED 
(
	[RepID] ASC,
	[SalesYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sample]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sample](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Color] [char](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StringSample]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StringSample](
	[ID] [char](3) NULL,
	[Name] [varchar](25) NULL,
	[AltID] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 5/3/2012 10:02:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [nvarchar](50) NOT NULL,
	[VendorAddress1] [nvarchar](50) NULL,
	[VendorAddress2] [nvarchar](50) NULL,
	[VendorCity] [nvarchar](50) NOT NULL,
	[VendorState] [nchar](2) NOT NULL,
	[VendorZipCode] [nvarchar](10) NOT NULL,
	[VendorContactLName] [nvarchar](35) NULL,
	[VendorContactFName] [nvarchar](35) NULL,
	[VendorPhone] [nvarchar](50) NULL,
	[TermsID] [int] NOT NULL,
	[AccountNo] [int] NOT NULL,
	[LastTranDate] [smalldatetime] NULL,
	[YTDPurchases] [money] NULL,
	[YTDReturns] [money] NULL,
	[LastYTDPurchases] [money] NULL,
	[LastYTDReturns] [money] NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ActiveInvoices] ON 

INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (89, 72, N'39104', CAST(0xA0100000 AS SmallDateTime), 85.3100, 0.0000, 0.0000, 3, CAST(0xA02E0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (94, 123, N'963253264', CAST(0xA0180000 AS SmallDateTime), 52.2500, 0.0000, 0.0000, 3, CAST(0xA0360000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (98, 83, N'31361833', CAST(0xA01B0000 AS SmallDateTime), 579.4200, 0.0000, 0.0000, 2, CAST(0xA02F0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (99, 123, N'263253268', CAST(0xA01B0000 AS SmallDateTime), 59.9700, 0.0000, 0.0000, 3, CAST(0xA0390000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (100, 123, N'263253270', CAST(0xA01C0000 AS SmallDateTime), 67.9200, 0.0000, 0.0000, 3, CAST(0xA03A0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (101, 123, N'263253273', CAST(0xA01C0000 AS SmallDateTime), 30.7500, 0.0000, 0.0000, 3, CAST(0xA03A0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (102, 110, N'P-0608', CAST(0xA01D0000 AS SmallDateTime), 20551.1800, 0.0000, 1200.0000, 3, CAST(0xA03B0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (105, 106, N'9982771', CAST(0xA01E0000 AS SmallDateTime), 503.2000, 0.0000, 0.0000, 3, CAST(0xA03C0000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (110, 80, N'134116', CAST(0xA0220000 AS SmallDateTime), 90.3600, 0.0000, 0.0000, 2, CAST(0xA0360000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (112, 110, N'0-2436', CAST(0xA0250000 AS SmallDateTime), 10976.0600, 0.0000, 0.0000, 3, CAST(0xA0430000 AS SmallDateTime), NULL)
INSERT [dbo].[ActiveInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (113, 37, N'547480102', CAST(0xA0260000 AS SmallDateTime), 224.0000, 0.0000, 0.0000, 3, CAST(0xA0430000 AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[ActiveInvoices] OFF
INSERT [dbo].[APFlat] ([VendorName], [InvoiceNumber], [ItemDescription1], [ItemDescription2], [ItemDescription3], [ItemDescription4]) VALUES (N'Wells Fargo Bank', N'112897', N'DiCicco''s', N'Kinko''s', N'Office Max', N'Publishers Marketing')
INSERT [dbo].[APFlat] ([VendorName], [InvoiceNumber], [ItemDescription1], [ItemDescription2], [ItemDescription3], [ItemDescription4]) VALUES (N'Zylka Design', N'97/522', N'MC Bouncebacks', N'SCMD Flyer', NULL, NULL)
INSERT [dbo].[APFlat] ([VendorName], [InvoiceNumber], [ItemDescription1], [ItemDescription2], [ItemDescription3], [ItemDescription4]) VALUES (N'Zylka Design', N'97/553B', N'Card revision', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (1, N'Anders', N'Maria', N'345 Winchell Pl', N'Anderson', N'IN', N'46014', N'(765) 555-7878')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (2, N'Trujillo', N'Ana', N'1298 E Smathers St', N'Benton', N'AR', N'72018', N'(501) 555-7733')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (3, N'Moreno', N'Antonio', N'6925 N Parkland Ave', N'Puyallup', N'WA', N'98373', N'(253) 555-8332')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (4, N'Hardy', N'Thomas', N'83 d''Urberville Ln', N'Casterbridge', N'GA', N'31209', N'(478) 555-1139')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (5, N'Berglund', N'Christina', N'22717 E 73rd Ave', N'Dubuque', N'IA', N'52004', N'(319) 555-1139')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (6, N'Moos', N'Hanna', N'1778 N Bovine Ave', N'Peoria', N'IL', N'61638', N'(309) 555-8755')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (7, N'Citeaux', N'Fred', N'1234 Main St', N'Normal', N'IL', N'61761', N'(309) 555-1914')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (8, N'Summer', N'Martin', N'1877 Ete Ct', N'Frogtown', N'LA', N'70563', N'(337) 555-9441')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (9, N'Lebihan', N'Laurence', N'717 E Michigan Ave', N'Chicago', N'IL', N'60611', N'(312) 555-9441')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (10, N'Lincoln', N'Elizabeth', N'4562 Rt 78 E', N'Vancouver', N'WA', N'98684', N'(360) 555-2680')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (32, N'Snyder', N'Howard', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'(503) 555-7555')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (36, N'Latimer', N'Yoshi', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'(503) 555-6874')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (43, N'Steel', N'John', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'(509) 555-7969')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (45, N'Yorres', N'Jaime', N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'(415) 555-5938')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (48, N'Wilson', N'Fran', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'(503) 555-9573')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (55, N'Phillips', N'Rene', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'(907) 555-7584')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (65, N'Wilson', N'Paula', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'(505) 555-5939')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (71, N'Pavarotti', N'Jose', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'(208) 555-8097')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (75, N'Braunschweiger', N'Art', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'(307) 555-4680')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (77, N'Nixon', N'Liz', N'89 Jefferson Way Suite 2', N'Providence', N'RI', N'02909', N'(401) 555-3612')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (78, N'Wong', N'Liu', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'(406) 555-5834')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (82, N'Nagy', N'Helvetius', N'722 DaVinci Blvd.', N'Concord', N'MA', N'01742', N'(351) 555-1219')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (89, N'Jablonski', N'Karl', N'305 - 14th Ave. S. Suite 3B', N'Seattle', N'WA', N'98128', N'(206) 555-4112')
INSERT [dbo].[Customers] ([CustID], [CustomerLast], [CustomerFirst], [CustAddr], [CustCity], [CustState], [CustZip], [CustPhone]) VALUES (92, N'Chelan', N'Donna', N'2299 E Baylor Dr', N'Dallas', N'TX', N'75224', N'(469) 555-8828')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[DateSample] ON 

INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (1, CAST(0x0000762E00000000 AS DateTime))
INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (2, CAST(0x000092B300000000 AS DateTime))
INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (3, CAST(0x0000995D00000000 AS DateTime))
INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (4, CAST(0x00009B4300A4CB80 AS DateTime))
INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (5, CAST(0x00009F8A00E65057 AS DateTime))
INSERT [dbo].[DateSample] ([ID], [StartDate]) VALUES (6, CAST(0x00009F8E0094FAAC AS DateTime))
SET IDENTITY_INSERT [dbo].[DateSample] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DeptNo], [DeptName]) VALUES (1, N'Accounting')
INSERT [dbo].[Departments] ([DeptNo], [DeptName]) VALUES (2, N'Payroll')
INSERT [dbo].[Departments] ([DeptNo], [DeptName]) VALUES (3, N'Operations')
INSERT [dbo].[Departments] ([DeptNo], [DeptName]) VALUES (4, N'Personnel')
INSERT [dbo].[Departments] ([DeptNo], [DeptName]) VALUES (5, N'Maintenance')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (1, N'Smith', N'Cindy', 2, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (2, N'Jones', N'Elmer', 4, 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (3, N'Simonian', N'Ralph', 2, 2)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (4, N'Hernandez', N'Olivia', 1, 2)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (5, N'Aaronsen', N'Robert', 2, 3)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (6, N'Watson', N'Denise', 6, 3)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (7, N'Hardy', N'Thomas', 5, 2)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (8, N'O''Leary', N'Rhea', 4, 2)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (9, N'Locario', N'Paulo', 6, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[EmployeesOld] ON 

INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (1, N'Smith', N'Cindy', 2)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (2, N'Jones', N'Elmer', 4)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (3, N'Simonian', N'Ralph', 2)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (4, N'Hernandez', N'Olivia', 1)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (5, N'Aaronsen', N'Robert', 2)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (6, N'Watson', N'Denise', 6)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (7, N'Hardy', N'Thomas', 5)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (8, N'O''Leary', N'Rhea', 4)
INSERT [dbo].[EmployeesOld] ([EmployeeID], [LastName], [FirstName], [DeptNo]) VALUES (9, N'Locario', N'Paulo', 6)
SET IDENTITY_INSERT [dbo].[EmployeesOld] OFF
SET IDENTITY_INSERT [dbo].[EmployeesTest] ON 

INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (1, N'Smith', N'Cindy', 2, NULL)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (2, N'Jones', N'Elmer', 4, 1)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (3, N'Simonian', N'Ralph', 2, 2)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (4, N'Hernandez', N'Olivia', 1, 9)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (5, N'Aaronsen', N'Robert', 2, 4)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (6, N'Watson', N'Denise', 6, 8)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (7, N'Hardy', N'Thomas', 5, 2)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (8, N'O''Leary', N'Rhea', 4, 9)
INSERT [dbo].[EmployeesTest] ([EmployeeID], [LastName], [FirstName], [DeptNo], [ManagerID]) VALUES (9, N'Locario', N'Paulo', 6, 1)
SET IDENTITY_INSERT [dbo].[EmployeesTest] OFF
SET IDENTITY_INSERT [dbo].[Investors] ON 

INSERT [dbo].[Investors] ([InvestorID], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [Phone], [Investments], [NetGain]) VALUES (1, N'Anders', N'Maria', N'345 Winchell Pl', N'Anderson', N'IN', N'46014     ', N'(765) 555-7878      ', 15000.0000, 1242.5700)
INSERT [dbo].[Investors] ([InvestorID], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [Phone], [Investments], [NetGain]) VALUES (2, N'Trujilo', N'Ana', N'1298 E Smathers St.', N'Benton', N'AR', N'72018     ', N'(510) 555-7733      ', 43500.0000, 8497.4400)
INSERT [dbo].[Investors] ([InvestorID], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [Phone], [Investments], [NetGain]) VALUES (3, N'Moreno', N'Antonio', N'6925 N Parkland Ave.', N'Puyallup', N'WA', N'98373     ', N'(253) 555-8332      ', 22900.0000, 2338.8700)
INSERT [dbo].[Investors] ([InvestorID], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [Phone], [Investments], [NetGain]) VALUES (4, N'Hardy', N'Thomas', N'83 d''Urberville Ln.', N'Casterbridge', N'GA', N'31209     ', N'(478) 555-1139      ', 5000.0000, -245.6900)
INSERT [dbo].[Investors] ([InvestorID], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [Phone], [Investments], [NetGain]) VALUES (5, N'Berglund', N'Christina', N'22717 E 73rd Ave.', N'Dubuque', N'IA', N'52004     ', N'(319) 555-1139      ', 11750.0000, 865.7700)
SET IDENTITY_INSERT [dbo].[Investors] OFF
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [InvoiceTotal]) VALUES (1, 8937, 50.0000)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [InvoiceTotal]) VALUES (2, 3662, 100.0000)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [InvoiceTotal]) VALUES (3, NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [InvoiceTotal]) VALUES (4, 4553, 250.0000)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [InvoiceTotal]) VALUES (5, 8937, 0.0000)
SET IDENTITY_INSERT [dbo].[NullSample] ON 

INSERT [dbo].[NullSample] ([InvoiceID], [InvoiceTotal]) VALUES (1, 125.0000)
INSERT [dbo].[NullSample] ([InvoiceID], [InvoiceTotal]) VALUES (2, 0.0000)
INSERT [dbo].[NullSample] ([InvoiceID], [InvoiceTotal]) VALUES (3, NULL)
INSERT [dbo].[NullSample] ([InvoiceID], [InvoiceTotal]) VALUES (4, 2199.9900)
INSERT [dbo].[NullSample] ([InvoiceID], [InvoiceTotal]) VALUES (5, 0.0000)
SET IDENTITY_INSERT [dbo].[NullSample] OFF
SET IDENTITY_INSERT [dbo].[PaidInvoices] ON 

INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (1, 122, N'989319-457', CAST(0x9FB30000 AS SmallDateTime), 3813.3300, 3813.3300, 0.0000, 3, CAST(0x9FD20000 AS SmallDateTime), CAST(0x9FD10000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (2, 123, N'263253241', CAST(0x9FB50000 AS SmallDateTime), 40.2000, 40.2000, 0.0000, 3, CAST(0x9FD40000 AS SmallDateTime), CAST(0x9FD80000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (3, 123, N'963253234', CAST(0x9FB80000 AS SmallDateTime), 138.7500, 138.7500, 0.0000, 3, CAST(0x9FD70000 AS SmallDateTime), CAST(0x9FD30000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (4, 123, N'2-000-2993', CAST(0x9FBB0000 AS SmallDateTime), 144.7000, 144.7000, 0.0000, 3, CAST(0x9FDA0000 AS SmallDateTime), CAST(0x9FD60000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (5, 123, N'963253251', CAST(0x9FBB0000 AS SmallDateTime), 15.5000, 15.5000, 0.0000, 3, CAST(0x9FDA0000 AS SmallDateTime), CAST(0x9FD50000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (6, 123, N'963253261', CAST(0x9FBB0000 AS SmallDateTime), 42.7500, 42.7500, 0.0000, 3, CAST(0x9FDA0000 AS SmallDateTime), CAST(0x9FDF0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (7, 123, N'963253237', CAST(0x9FC00000 AS SmallDateTime), 172.5000, 172.5000, 0.0000, 3, CAST(0x9FDF0000 AS SmallDateTime), CAST(0x9FE00000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (8, 89, N'125520-1', CAST(0x9FC30000 AS SmallDateTime), 95.0000, 95.0000, 0.0000, 1, CAST(0x9FCE0000 AS SmallDateTime), CAST(0x9FCB0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (9, 121, N'97/488', CAST(0x9FC30000 AS SmallDateTime), 601.9500, 601.9500, 0.0000, 3, CAST(0x9FE20000 AS SmallDateTime), CAST(0x9FDF0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (10, 123, N'263253250', CAST(0x9FC30000 AS SmallDateTime), 42.6700, 42.6700, 0.0000, 3, CAST(0x9FE20000 AS SmallDateTime), CAST(0x9FE00000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (11, 123, N'963253262', CAST(0x9FC40000 AS SmallDateTime), 42.5000, 42.5000, 0.0000, 3, CAST(0x9FE30000 AS SmallDateTime), CAST(0x9FDE0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (12, 96, N'I77271-O01', CAST(0x9FC50000 AS SmallDateTime), 662.0000, 662.0000, 0.0000, 2, CAST(0x9FDA0000 AS SmallDateTime), CAST(0x9FD70000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (13, 95, N'111-92R-10096', CAST(0x9FC90000 AS SmallDateTime), 16.3300, 16.3300, 0.0000, 2, CAST(0x9FDE0000 AS SmallDateTime), CAST(0x9FE10000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (14, 115, N'25022117', CAST(0x9FCB0000 AS SmallDateTime), 6.0000, 6.0000, 0.0000, 4, CAST(0x9FF30000 AS SmallDateTime), CAST(0x9FF30000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (15, 48, N'P02-88D77S7', CAST(0x9FCD0000 AS SmallDateTime), 856.9200, 856.9200, 0.0000, 3, CAST(0x9FEB0000 AS SmallDateTime), CAST(0x9FE80000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (16, 97, N'21-4748363', CAST(0x9FCD0000 AS SmallDateTime), 9.9500, 9.9500, 0.0000, 2, CAST(0x9FE10000 AS SmallDateTime), CAST(0x9FE00000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (17, 123, N'4-321-2596', CAST(0x9FCF0000 AS SmallDateTime), 10.0000, 10.0000, 0.0000, 3, CAST(0x9FED0000 AS SmallDateTime), CAST(0x9FEE0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (18, 123, N'963253242', CAST(0x9FD00000 AS SmallDateTime), 104.0000, 104.0000, 0.0000, 3, CAST(0x9FEE0000 AS SmallDateTime), CAST(0x9FEE0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (19, 34, N'QP58872', CAST(0x9FD10000 AS SmallDateTime), 116.5400, 116.5400, 0.0000, 1, CAST(0x9FDB0000 AS SmallDateTime), CAST(0x9FDD0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (20, 115, N'24863706', CAST(0x9FD40000 AS SmallDateTime), 6.0000, 6.0000, 0.0000, 4, CAST(0x9FFC0000 AS SmallDateTime), CAST(0x9FF80000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (21, 119, N'10843', CAST(0x9FD50000 AS SmallDateTime), 4901.2600, 4901.2600, 0.0000, 2, CAST(0x9FE90000 AS SmallDateTime), CAST(0x9FE70000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (22, 123, N'963253235', CAST(0x9FD50000 AS SmallDateTime), 108.2500, 108.2500, 0.0000, 3, CAST(0x9FF30000 AS SmallDateTime), CAST(0x9FF20000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (23, 97, N'21-4923721', CAST(0x9FD70000 AS SmallDateTime), 9.9500, 9.9500, 0.0000, 2, CAST(0x9FEB0000 AS SmallDateTime), CAST(0x9FE60000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (24, 113, N'77290', CAST(0x9FD70000 AS SmallDateTime), 1750.0000, 1750.0000, 0.0000, 5, CAST(0xA0080000 AS SmallDateTime), CAST(0xA00B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (25, 123, N'963253246', CAST(0x9FD70000 AS SmallDateTime), 129.0000, 129.0000, 0.0000, 3, CAST(0x9FF50000 AS SmallDateTime), CAST(0x9FF20000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (26, 123, N'4-342-8069', CAST(0x9FD80000 AS SmallDateTime), 10.0000, 10.0000, 0.0000, 3, CAST(0x9FF60000 AS SmallDateTime), CAST(0x9FF60000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (27, 88, N'972110', CAST(0x9FD90000 AS SmallDateTime), 207.7800, 207.7800, 0.0000, 1, CAST(0x9FE30000 AS SmallDateTime), CAST(0x9FE50000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (28, 123, N'963253263', CAST(0x9FDA0000 AS SmallDateTime), 109.5000, 109.5000, 0.0000, 3, CAST(0x9FF80000 AS SmallDateTime), CAST(0x9FF30000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (29, 108, N'121897', CAST(0x9FDD0000 AS SmallDateTime), 450.0000, 450.0000, 0.0000, 4, CAST(0xA0050000 AS SmallDateTime), CAST(0xA0090000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (30, 123, N'1-200-5164', CAST(0x9FDE0000 AS SmallDateTime), 63.4000, 63.4000, 0.0000, 3, CAST(0x9FFC0000 AS SmallDateTime), CAST(0xA0010000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (31, 104, N'P02-3772', CAST(0x9FDF0000 AS SmallDateTime), 7125.3400, 7125.3400, 0.0000, 3, CAST(0x9FFD0000 AS SmallDateTime), CAST(0xA0010000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (32, 121, N'97/486', CAST(0x9FDF0000 AS SmallDateTime), 953.1000, 953.1000, 0.0000, 3, CAST(0x9FFD0000 AS SmallDateTime), CAST(0x9FFF0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (33, 105, N'94007005', CAST(0x9FE10000 AS SmallDateTime), 220.0000, 220.0000, 0.0000, 3, CAST(0x9FFF0000 AS SmallDateTime), CAST(0xA0030000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (34, 123, N'963253232', CAST(0x9FE10000 AS SmallDateTime), 127.7500, 127.7500, 0.0000, 3, CAST(0x9FFF0000 AS SmallDateTime), CAST(0x9FFB0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (35, 107, N'RTR-72-3662-X', CAST(0x9FE30000 AS SmallDateTime), 1600.0000, 1600.0000, 0.0000, 4, CAST(0xA00A0000 AS SmallDateTime), CAST(0xA00F0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (36, 121, N'97/465', CAST(0x9FE30000 AS SmallDateTime), 565.1500, 565.1500, 0.0000, 3, CAST(0xA0010000 AS SmallDateTime), CAST(0xA0010000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (37, 123, N'963253260', CAST(0x9FE30000 AS SmallDateTime), 36.0000, 36.0000, 0.0000, 3, CAST(0xA0010000 AS SmallDateTime), CAST(0xA0030000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (38, 123, N'963253272', CAST(0x9FE40000 AS SmallDateTime), 61.5000, 61.5000, 0.0000, 3, CAST(0xA0020000 AS SmallDateTime), CAST(0xA0050000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (39, 110, N'0-2058', CAST(0x9FE60000 AS SmallDateTime), 37966.1900, 37966.1900, 0.0000, 3, CAST(0xA0040000 AS SmallDateTime), CAST(0xA0050000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (40, 121, N'97/503', CAST(0x9FE80000 AS SmallDateTime), 639.7700, 639.7700, 0.0000, 3, CAST(0xA0050000 AS SmallDateTime), CAST(0xA0020000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (41, 123, N'963253255', CAST(0x9FE90000 AS SmallDateTime), 53.7500, 53.7500, 0.0000, 3, CAST(0xA0050000 AS SmallDateTime), CAST(0xA0040000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (42, 123, N'94007069', CAST(0x9FE90000 AS SmallDateTime), 400.0000, 400.0000, 0.0000, 3, CAST(0xA0050000 AS SmallDateTime), CAST(0xA0070000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (43, 72, N'40318', CAST(0x9FEA0000 AS SmallDateTime), 21842.0000, 21842.0000, 0.0000, 3, CAST(0xA0070000 AS SmallDateTime), CAST(0xA0050000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (44, 95, N'111-92R-10094', CAST(0x9FEA0000 AS SmallDateTime), 19.6700, 19.6700, 0.0000, 2, CAST(0x9FFE0000 AS SmallDateTime), CAST(0xA0010000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (45, 122, N'989319-437', CAST(0x9FEA0000 AS SmallDateTime), 2765.3600, 2765.3600, 0.0000, 3, CAST(0xA0070000 AS SmallDateTime), CAST(0xA0050000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (46, 37, N'547481328', CAST(0x9FEC0000 AS SmallDateTime), 224.0000, 224.0000, 0.0000, 3, CAST(0xA0090000 AS SmallDateTime), CAST(0xA00A0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (47, 83, N'31359783', CAST(0x9FEC0000 AS SmallDateTime), 1575.0000, 1575.0000, 0.0000, 2, CAST(0xA0000000 AS SmallDateTime), CAST(0x9FFE0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (48, 123, N'1-202-2978', CAST(0x9FEC0000 AS SmallDateTime), 33.0000, 33.0000, 0.0000, 3, CAST(0xA0090000 AS SmallDateTime), CAST(0xA00B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (49, 95, N'111-92R-10097', CAST(0x9FED0000 AS SmallDateTime), 16.3300, 16.3300, 0.0000, 2, CAST(0xA0010000 AS SmallDateTime), CAST(0xA0030000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (50, 37, N'547479217', CAST(0x9FF00000 AS SmallDateTime), 116.0000, 116.0000, 0.0000, 3, CAST(0xA00D0000 AS SmallDateTime), CAST(0xA00D0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (51, 122, N'989319-477', CAST(0x9FF10000 AS SmallDateTime), 2184.1100, 2184.1100, 0.0000, 3, CAST(0xA00E0000 AS SmallDateTime), CAST(0xA00E0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (52, 34, N'Q545443', CAST(0x9FF20000 AS SmallDateTime), 1083.5800, 1083.5800, 0.0000, 1, CAST(0x9FFC0000 AS SmallDateTime), CAST(0xA0000000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (53, 95, N'111-92R-10092', CAST(0x9FF20000 AS SmallDateTime), 46.2100, 46.2100, 0.0000, 2, CAST(0xA0050000 AS SmallDateTime), CAST(0xA0080000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (54, 121, N'97/553B', CAST(0x9FF30000 AS SmallDateTime), 313.5500, 313.5500, 0.0000, 3, CAST(0xA0100000 AS SmallDateTime), CAST(0xA00F0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (55, 123, N'963253245', CAST(0x9FF30000 AS SmallDateTime), 40.7500, 40.7500, 0.0000, 3, CAST(0xA0100000 AS SmallDateTime), CAST(0xA0120000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (56, 86, N'367447', CAST(0x9FF40000 AS SmallDateTime), 2433.0000, 2433.0000, 0.0000, 1, CAST(0x9FFE0000 AS SmallDateTime), CAST(0x9FFA0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (57, 103, N'75C-90227', CAST(0x9FF40000 AS SmallDateTime), 1367.5000, 1367.5000, 0.0000, 5, CAST(0xA0250000 AS SmallDateTime), CAST(0xA0250000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (58, 123, N'963253256', CAST(0x9FF40000 AS SmallDateTime), 53.2500, 53.2500, 0.0000, 3, CAST(0xA0110000 AS SmallDateTime), CAST(0xA00D0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (59, 123, N'4-314-3057', CAST(0x9FF40000 AS SmallDateTime), 13.7500, 13.7500, 0.0000, 3, CAST(0xA0110000 AS SmallDateTime), CAST(0xA0150000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (60, 122, N'989319-497', CAST(0x9FF50000 AS SmallDateTime), 2312.2000, 2312.2000, 0.0000, 3, CAST(0xA0120000 AS SmallDateTime), CAST(0xA00F0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (61, 115, N'24946731', CAST(0x9FF80000 AS SmallDateTime), 25.6700, 25.6700, 0.0000, 4, CAST(0xA01F0000 AS SmallDateTime), CAST(0xA0200000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (62, 123, N'963253269', CAST(0x9FF80000 AS SmallDateTime), 26.7500, 26.7500, 0.0000, 3, CAST(0xA0150000 AS SmallDateTime), CAST(0xA0110000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (63, 122, N'989319-427', CAST(0x9FF90000 AS SmallDateTime), 2115.8100, 2115.8100, 0.0000, 3, CAST(0xA0160000 AS SmallDateTime), CAST(0xA0190000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (64, 123, N'963253267', CAST(0x9FFA0000 AS SmallDateTime), 23.5000, 23.5000, 0.0000, 3, CAST(0xA0170000 AS SmallDateTime), CAST(0xA0190000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (65, 99, N'509786', CAST(0x9FFB0000 AS SmallDateTime), 6940.2500, 6940.2500, 0.0000, 3, CAST(0xA0180000 AS SmallDateTime), CAST(0xA0150000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (66, 123, N'263253253', CAST(0x9FFB0000 AS SmallDateTime), 31.9500, 31.9500, 0.0000, 3, CAST(0xA0180000 AS SmallDateTime), CAST(0xA01B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (67, 122, N'989319-487', CAST(0x9FFD0000 AS SmallDateTime), 1927.5400, 1927.5400, 0.0000, 3, CAST(0xA01A0000 AS SmallDateTime), CAST(0xA0180000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (68, 81, N'MABO1489', CAST(0x9FFE0000 AS SmallDateTime), 936.9300, 936.9300, 0.0000, 2, CAST(0xA0110000 AS SmallDateTime), CAST(0xA0100000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (69, 80, N'133560', CAST(0x9FFF0000 AS SmallDateTime), 175.0000, 175.0000, 0.0000, 2, CAST(0xA0120000 AS SmallDateTime), CAST(0xA0160000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (70, 115, N'24780512', CAST(0x9FFF0000 AS SmallDateTime), 6.0000, 6.0000, 0.0000, 4, CAST(0xA0260000 AS SmallDateTime), CAST(0xA0230000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (71, 123, N'963253254', CAST(0x9FFF0000 AS SmallDateTime), 108.5000, 108.5000, 0.0000, 3, CAST(0xA01C0000 AS SmallDateTime), CAST(0xA01A0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (72, 123, N'43966316', CAST(0x9FFF0000 AS SmallDateTime), 10.0000, 10.0000, 0.0000, 3, CAST(0xA01C0000 AS SmallDateTime), CAST(0xA0170000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (73, 114, N'CBM9920-M-T77109', CAST(0xA0000000 AS SmallDateTime), 290.0000, 290.0000, 0.0000, 1, CAST(0xA0090000 AS SmallDateTime), CAST(0xA0050000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (74, 102, N'109596', CAST(0xA0010000 AS SmallDateTime), 41.8000, 41.8000, 0.0000, 4, CAST(0xA0280000 AS SmallDateTime), CAST(0xA0290000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (75, 123, N'7548906-20', CAST(0xA0010000 AS SmallDateTime), 27.0000, 27.0000, 0.0000, 3, CAST(0xA01E0000 AS SmallDateTime), CAST(0xA01E0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (76, 123, N'963253248', CAST(0xA0010000 AS SmallDateTime), 241.0000, 241.0000, 0.0000, 3, CAST(0xA01E0000 AS SmallDateTime), CAST(0xA01F0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (77, 121, N'97/553', CAST(0xA0020000 AS SmallDateTime), 904.1400, 904.1400, 0.0000, 3, CAST(0xA01F0000 AS SmallDateTime), CAST(0xA01F0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (78, 121, N'97/522', CAST(0xA0050000 AS SmallDateTime), 1962.1300, 1762.1300, 200.0000, 3, CAST(0xA0220000 AS SmallDateTime), CAST(0xA0240000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (79, 100, N'587056', CAST(0xA0050000 AS SmallDateTime), 2184.5000, 2184.5000, 0.0000, 4, CAST(0xA02E0000 AS SmallDateTime), CAST(0xA02C0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (80, 122, N'989319-467', CAST(0xA0070000 AS SmallDateTime), 2318.0300, 2318.0300, 0.0000, 3, CAST(0xA0250000 AS SmallDateTime), CAST(0xA0230000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (81, 123, N'263253265', CAST(0xA0080000 AS SmallDateTime), 26.2500, 26.2500, 0.0000, 3, CAST(0xA0260000 AS SmallDateTime), CAST(0xA0220000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (82, 94, N'203339-13', CAST(0xA00B0000 AS SmallDateTime), 17.5000, 17.5000, 0.0000, 2, CAST(0xA01F0000 AS SmallDateTime), CAST(0xA0210000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (83, 95, N'111-92R-10093', CAST(0xA00C0000 AS SmallDateTime), 39.7700, 39.7700, 0.0000, 2, CAST(0xA0200000 AS SmallDateTime), CAST(0xA01C0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (84, 123, N'963253258', CAST(0xA00C0000 AS SmallDateTime), 111.0000, 111.0000, 0.0000, 3, CAST(0xA02A0000 AS SmallDateTime), CAST(0xA02A0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (85, 123, N'963253271', CAST(0xA00D0000 AS SmallDateTime), 158.0000, 158.0000, 0.0000, 3, CAST(0xA02B0000 AS SmallDateTime), CAST(0xA0300000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (86, 123, N'963253230', CAST(0xA00D0000 AS SmallDateTime), 739.2000, 739.2000, 0.0000, 3, CAST(0xA02B0000 AS SmallDateTime), CAST(0xA02B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (87, 123, N'963253244', CAST(0xA00E0000 AS SmallDateTime), 60.0000, 60.0000, 0.0000, 3, CAST(0xA02C0000 AS SmallDateTime), CAST(0xA02E0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (88, 123, N'963253239', CAST(0xA00E0000 AS SmallDateTime), 147.2500, 147.2500, 0.0000, 3, CAST(0xA02C0000 AS SmallDateTime), CAST(0xA0300000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (90, 123, N'963253252', CAST(0xA0120000 AS SmallDateTime), 38.7500, 38.7500, 0.0000, 3, CAST(0xA0300000 AS SmallDateTime), CAST(0xA0300000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (91, 95, N'111-92R-10095', CAST(0xA0150000 AS SmallDateTime), 32.7000, 32.7000, 0.0000, 2, CAST(0xA0290000 AS SmallDateTime), CAST(0xA02B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (92, 117, N'111897', CAST(0xA0150000 AS SmallDateTime), 16.6200, 16.6200, 0.0000, 3, CAST(0xA0330000 AS SmallDateTime), CAST(0xA0330000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (93, 123, N'4-327-7357', CAST(0xA0160000 AS SmallDateTime), 162.7500, 162.7500, 0.0000, 3, CAST(0xA0340000 AS SmallDateTime), CAST(0xA0300000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (95, 82, N'C73-24', CAST(0xA0190000 AS SmallDateTime), 600.0000, 600.0000, 0.0000, 2, CAST(0xA02D0000 AS SmallDateTime), CAST(0xA0320000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (96, 110, N'P-0259', CAST(0xA0190000 AS SmallDateTime), 26881.4000, 26881.4000, 0.0000, 3, CAST(0xA0370000 AS SmallDateTime), CAST(0xA0390000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (97, 90, N'97-1024A', CAST(0xA01A0000 AS SmallDateTime), 356.4800, 356.4800, 0.0000, 2, CAST(0xA02E0000 AS SmallDateTime), CAST(0xA02C0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (103, 122, N'989319-417', CAST(0xA01D0000 AS SmallDateTime), 2051.5900, 2051.5900, 0.0000, 3, CAST(0xA03B0000 AS SmallDateTime), CAST(0xA03D0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (104, 123, N'263253243', CAST(0xA01D0000 AS SmallDateTime), 44.4400, 44.4400, 0.0000, 3, CAST(0xA03B0000 AS SmallDateTime), CAST(0xA03D0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (106, 110, N'0-2060', CAST(0xA01E0000 AS SmallDateTime), 23517.5800, 21221.6300, 2295.9500, 3, CAST(0xA03C0000 AS SmallDateTime), CAST(0xA0400000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (107, 122, N'989319-447', CAST(0xA01E0000 AS SmallDateTime), 3689.9900, 3689.9900, 0.0000, 3, CAST(0xA03C0000 AS SmallDateTime), CAST(0xA0380000 AS SmallDateTime))
GO
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (108, 123, N'963253240', CAST(0xA01E0000 AS SmallDateTime), 67.0000, 67.0000, 0.0000, 3, CAST(0xA03C0000 AS SmallDateTime), CAST(0xA03C0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (109, 121, N'97/222', CAST(0xA01F0000 AS SmallDateTime), 1000.4600, 1000.4600, 0.0000, 3, CAST(0xA03D0000 AS SmallDateTime), CAST(0xA03B0000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (111, 123, N'263253257', CAST(0xA0240000 AS SmallDateTime), 22.5700, 22.5700, 0.0000, 3, CAST(0xA0420000 AS SmallDateTime), CAST(0xA0460000 AS SmallDateTime))
INSERT [dbo].[PaidInvoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (114, 123, N'963253249', CAST(0xA0270000 AS SmallDateTime), 127.7500, 127.7500, 0.0000, 3, CAST(0xA0440000 AS SmallDateTime), CAST(0xA0470000 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[PaidInvoices] OFF
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1011', 8)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1011', 4)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1012', 3)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1012', 1)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1012', 5)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1013', 6)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1013', 9)
INSERT [dbo].[Projects] ([ProjectNo], [EmployeeID]) VALUES (N'P1014', 10)
SET IDENTITY_INSERT [dbo].[RealSample] ON 

INSERT [dbo].[RealSample] ([ID], [R]) VALUES (1, 1.0000000000000011)
INSERT [dbo].[RealSample] ([ID], [R]) VALUES (2, 1)
INSERT [dbo].[RealSample] ([ID], [R]) VALUES (3, 0.999999999999999)
INSERT [dbo].[RealSample] ([ID], [R]) VALUES (4, 1234.56789012345)
INSERT [dbo].[RealSample] ([ID], [R]) VALUES (5, 999.04440209348)
INSERT [dbo].[RealSample] ([ID], [R]) VALUES (6, 24.04849)
SET IDENTITY_INSERT [dbo].[RealSample] OFF
SET IDENTITY_INSERT [dbo].[SalesReps] ON 

INSERT [dbo].[SalesReps] ([RepID], [RepFirstName], [RepLastName]) VALUES (1, N'Jonathon', N'Thomas')
INSERT [dbo].[SalesReps] ([RepID], [RepFirstName], [RepLastName]) VALUES (2, N'Sonja', N'Martinez')
INSERT [dbo].[SalesReps] ([RepID], [RepFirstName], [RepLastName]) VALUES (3, N'Andrew', N'Markasian')
INSERT [dbo].[SalesReps] ([RepID], [RepFirstName], [RepLastName]) VALUES (4, N'Phillip', N'Winters')
INSERT [dbo].[SalesReps] ([RepID], [RepFirstName], [RepLastName]) VALUES (5, N'Lydia', N'Kramer')
SET IDENTITY_INSERT [dbo].[SalesReps] OFF
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (1, N'2009', 1274856.3800)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (1, N'2010', 923746.8500)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (1, N'2011', 998337.4600)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (2, N'2009', 978465.9900)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (2, N'2010', 974853.8100)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (2, N'2011', 887695.7500)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (3, N'2009', 1032875.4800)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (3, N'2010', 1132744.5600)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (4, N'2010', 655786.9200)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (4, N'2011', 72443.3700)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (5, N'2010', 422847.8600)
INSERT [dbo].[SalesTotals] ([RepID], [SalesYear], [SalesTotal]) VALUES (5, N'2011', 45182.4400)
SET IDENTITY_INSERT [dbo].[Sample] ON 

INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (1, 8937, N'Brown     ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (2, 3662, N'Blue      ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (3, NULL, N'Red       ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (4, 4553, N'Green     ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (5, 8937, N'Yellow    ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (6, 606, N'Purple    ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (7, NULL, N'Orange    ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (8, 808, N'None      ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (9, NULL, N'None      ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (10, NULL, N'None      ')
INSERT [dbo].[Sample] ([ID], [Number], [Color]) VALUES (11, NULL, N'None      ')
SET IDENTITY_INSERT [dbo].[Sample] OFF
INSERT [dbo].[StringSample] ([ID], [Name], [AltID]) VALUES (N'1  ', N'Lizbeth Darien', N'01 ')
INSERT [dbo].[StringSample] ([ID], [Name], [AltID]) VALUES (N'2  ', N'Darnell O''Sullivan', N'02 ')
INSERT [dbo].[StringSample] ([ID], [Name], [AltID]) VALUES (N'17 ', N'Lance Pinos-Potter', N'17 ')
INSERT [dbo].[StringSample] ([ID], [Name], [AltID]) VALUES (N'20 ', N'Jean Paul Renard', N'20 ')
INSERT [dbo].[StringSample] ([ID], [Name], [AltID]) VALUES (N'3  ', N'Alisha von Strump', N'03 ')
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (1, N'US Postal Service', N'Attn:  Supt. Window Services', N'PO Box 7005', N'Madison', N'WI', N'53707', N'Alberto', N'Francesco', N'(209) 555-1205', 1, 552, CAST(0x96200000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (2, N'National Information Data Ctr', N'PO Box 96621', N'', N'Washington', N'DC', N'20090', N'Irvin', N'Ania', N'(301) 555-8950', 3, 540, CAST(0x9B510000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (3, N'Register of Copyrights', N'Library Of Congress', N'', N'Washington', N'DC', N'20559', N'Liana', N'Lukas', N'', 3, 403, CAST(0x9B620000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (4, N'Jobtrak', N'1990 Westwood Blvd Ste 260', N'', N'Los Angeles', N'CA', N'90025', N'Quinn', N'Kenzie', N'(800) 555-8725', 3, 572, CAST(0x9B6E0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (5, N'Newbrige Book Clubs', N'3000 Cindel Drive', N'', N'Delran', N'NJ', N'08370', N'Marks', N'Michelle', N'(800) 555-9980', 4, 394, CAST(0x9BBB0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (6, N'California Chamber Of Commerce', N'3255 Ramos Cir', N'', N'Sacramento', N'CA', N'95827', N'Mauro', N'Anton', N'(916) 555-6670', 3, 572, CAST(0x9BDB0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (7, N'Towne Advertiser''s Mailing Svcs', N'Kevin Minder', N'3441 W Macarthur Blvd', N'Santa Ana', N'CA', N'92704', N'Maegen', N'Ted', N'', 3, 540, CAST(0x9C6F0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (8, N'BFI Industries', N'PO Box 9369', N'', N'Fresno', N'CA', N'93792', N'Kaleigh', N'Erick', N'(209) 555-1551', 3, 521, CAST(0x9CF80000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (9, N'Pacific Gas & Electric', N'Box 52001', N'', N'San Francisco', N'CA', N'94152', N'Anthoni', N'Kaitlyn', N'(209) 555-6081', 3, 521, CAST(0x9CF80000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (10, N'Robbins Mobile Lock And Key', N'4669 N Fresno', N'', N'Fresno', N'CA', N'93726', N'Leigh', N'Bill', N'(209) 555-9375', 2, 523, CAST(0x9CF80000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (11, N'Bill Marvin Electric Inc', N'4583 E Home', N'', N'Fresno', N'CA', N'93703', N'Hostlery', N'Kaitlin', N'(209) 555-5106', 2, 523, CAST(0x9CFF0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (12, N'City Of Fresno', N'PO Box 2069', N'', N'Fresno', N'CA', N'93718', N'Mayte', N'Kendall', N'(209) 555-9999', 3, 574, CAST(0x9CFF0000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (13, N'Golden Eagle Insurance Co', N'PO Box 85826', N'', N'San Diego', N'CA', N'92186', N'Blanca', N'Korah', N'', 3, 590, CAST(0x9D050000 AS SmallDateTime), 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (14, N'Expedata Inc', N'4420 N. First Street, Suite 108', N'', N'Fresno', N'CA', N'93726', N'Quintin', N'Marvin', N'(209) 555-9586', 3, 589, CAST(0x9D1A0000 AS SmallDateTime), 0.0000, 0.0000, 6.9500, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (15, N'ASC Signs', N'1528 N Sierra Vista', N'', N'Fresno', N'CA', N'93703', N'Darien', N'Elisabeth', N'', 1, 546, CAST(0x9D280000 AS SmallDateTime), 0.0000, 0.0000, 108.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (16, N'Internal Revenue Service', N'', N'', N'Fresno', N'CA', N'93888', N'Aileen', N'Joan', N'', 1, 235, CAST(0x9D340000 AS SmallDateTime), 0.0000, 0.0000, 86.0700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (17, N'Blanchard & Johnson Associates', N'27371 Valderas', N'', N'Mission Viejo', N'CA', N'92691', N'Keeton', N'Gonzalo', N'(214) 555-3647', 3, 540, CAST(0x9D420000 AS SmallDateTime), 0.0000, 0.0000, 354.2700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (18, N'Fresno Photoengraving Company', N'1952 "H" Street', N'P.O. Box 1952', N'Fresno', N'CA', N'93718', N'Chaddick', N'Derek', N'(209) 555-3005', 3, 403, CAST(0x9D420000 AS SmallDateTime), 0.0000, 0.0000, 50.3700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (19, N'Crown Printing', N'1730 "H" St', N'', N'Fresno', N'CA', N'93721', N'Randrup', N'Leann', N'(209) 555-7473', 2, 400, CAST(0x9D580000 AS SmallDateTime), 0.0000, 0.0000, 3016.1200, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (20, N'Diversified Printing & Pub', N'2632 Saturn St', N'', N'Brea', N'CA', N'92621', N'Lane', N'Vanesa', N'(714) 555-4541', 3, 400, CAST(0x9D580000 AS SmallDateTime), 0.0000, 0.0000, 8805.7300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (21, N'The Library Ltd', N'7700 Forsyth', N'', N'St Louis', N'MO', N'63105', N'Marques', N'Malia', N'(314) 555-8834', 3, 540, CAST(0x9DBF0000 AS SmallDateTime), 0.0000, 0.0000, 100.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (22, N'Micro Center', N'1555 W Lane Ave', N'', N'Columbus', N'OH', N'43221', N'Evan', N'Emily', N'(614) 555-4435', 2, 160, CAST(0x9DCE0000 AS SmallDateTime), 0.0000, 0.0000, 1200.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (23, N'Yale Industrial Trucks-Fresno', N'3711 W Franklin', N'', N'Fresno', N'CA', N'93706', N'Alexis', N'Alexandro', N'(209) 555-2993', 3, 532, CAST(0x9DE10000 AS SmallDateTime), 0.0000, 0.0000, 479.6300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (24, N'Zee Medical Service Co', N'4221 W Sierra Madre #104', N'', N'Fresno', N'CA', N'93722', N'Hallie', N'Juliana', N'', 3, 570, CAST(0x9DE10000 AS SmallDateTime), 0.0000, 0.0000, 84.7800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (25, N'California Data Marketing', N'2818 E Hamilton', N'', N'Fresno', N'CA', N'93721', N'Jonessen', N'Moises', N'(209) 555-3801', 4, 540, CAST(0x9DFE0000 AS SmallDateTime), 0.0000, 0.0000, 2577.8600, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (26, N'Small Press', N'121 E Front St - 4th Floor', N'', N'Traverse City', N'MI', N'49684', N'Colette', N'Dusty', N'', 3, 540, CAST(0x9E210000 AS SmallDateTime), 0.0000, 0.0000, 34.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (27, N'Rich Advertising', N'12 Daniel Road', N'', N'Fairfield', N'NJ', N'07004', N'Neil', N'Ingrid', N'(201) 555-9742', 3, 540, CAST(0x9E3D0000 AS SmallDateTime), 0.0000, 0.0000, 3000.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (29, N'Vision Envelope & Printing', N'PO Box 3100', N'', N'Gardena', N'CA', N'90247', N'Raven', N'Jamari', N'(310) 555-7062', 3, 551, CAST(0x9E4A0000 AS SmallDateTime), 0.0000, 0.0000, 1248.8300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (30, N'Costco', N'Fresno Warehouse', N'4500 W Shaw', N'Fresno', N'CA', N'93711', N'Jaquan', N'Aaron', N'', 3, 570, CAST(0x9E7E0000 AS SmallDateTime), 140.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (31, N'Enterprise Communications Inc', N'1483 Chain Bridge Rd, Ste 202', N'', N'Mclean', N'VA', N'22101', N'Lawrence', N'Eileen', N'(770) 555-9558', 2, 536, CAST(0x9E910000 AS SmallDateTime), 500.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (32, N'RR Bowker', N'PO Box 31', N'', N'New Providence', N'NJ', N'07974', N'Essence', N'Marjorie', N'(800) 555-8110', 3, 532, CAST(0x9E910000 AS SmallDateTime), 272.4800, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (33, N'Nielson', N'Ohio Valley Litho Division', N'Location #0470', N'Cincinnati', N'OH', N'45264', N'Brooklynn', N'Keely', N'', 2, 541, CAST(0x9E980000 AS SmallDateTime), 5372.0000, 0.0000, 4972.8400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (34, N'IBM', N'PO Box 61000', N'', N'San Francisco', N'CA', N'94161', N'Camron', N'Trentin', N'(800) 555-4426', 1, 160, CAST(0x9EA50000 AS SmallDateTime), 123.0000, 0.0000, 123.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (35, N'Cal State Termite', N'PO Box 956', N'', N'Selma', N'CA', N'93662', N'Hunter', N'Demetrius', N'(209) 555-1534', 2, 523, CAST(0x9EB30000 AS SmallDateTime), 65.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (36, N'Graylift', N'PO Box 2808', N'', N'Fresno', N'CA', N'93745', N'Sydney', N'Deangelo', N'(209) 555-6621', 3, 532, CAST(0x9EB30000 AS SmallDateTime), 62.1400, 0.0000, 630.7400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (37, N'Blue Cross', N'PO Box 9061', N'', N'Oxnard', N'CA', N'93031', N'Eliana', N'Nikolas', N'(800) 555-0912', 3, 510, CAST(0x9EBB0000 AS SmallDateTime), 372.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (38, N'Venture Communications Int''l', N'60 Madison Ave', N'', N'New York', N'NY', N'10010', N'Neftaly', N'Thalia', N'(212) 555-4800', 3, 540, CAST(0x9EBB0000 AS SmallDateTime), 6000.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (39, N'Custom Printing Company', N'PO Box 7028', N'', N'St Louis', N'MO', N'63177', N'Myles', N'Harley', N'(301) 555-1494', 3, 540, CAST(0x9EC80000 AS SmallDateTime), 12102.0100, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (40, N'Nat Assoc of College Stores', N'500 East Lorain Street', N'', N'Oberlin', N'OH', N'44074', N'Bernard', N'Lucy', N'', 3, 572, CAST(0x9EC80000 AS SmallDateTime), 390.0000, 0.0000, 390.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (41, N'Shields Design', N'415 E Olive Ave', N'', N'Fresno', N'CA', N'93728', N'Kerry', N'Rowan', N'(209) 555-8060', 2, 403, CAST(0x9EE30000 AS SmallDateTime), 5588.9900, 0.0000, 22363.2000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (42, N'Opamp Technical Books', N'1033 N Sycamore Ave.', N'', N'Los Angeles', N'CA', N'90038', N'Paris', N'Gideon', N'(213) 555-4322', 3, 572, CAST(0x9EF10000 AS SmallDateTime), 700.0000, 0.0000, 1136.1700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (43, N'Capital Resource Credit', N'PO Box 39046', N'', N'Minneapolis', N'MN', N'55439', N'Maxwell', N'Jayda', N'(612) 555-0057', 3, 589, CAST(0x9EFF0000 AS SmallDateTime), 59.3800, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (44, N'Courier Companies, Inc', N'PO Box 5317', N'', N'Boston', N'MA', N'02206', N'Antavius', N'Troy', N'(508) 555-6351', 4, 400, CAST(0x9EFF0000 AS SmallDateTime), 27462.5600, 0.0000, 29074.2500, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (45, N'Naylor Publications Inc', N'PO Box 40513', N'', N'Jacksonville', N'FL', N'32231', N'Gerald', N'Kristofer', N'(800) 555-6041', 3, 572, CAST(0x9EFF0000 AS SmallDateTime), 99.5000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (46, N'Open Horizons Publishing', N'Book Marketing Update', N'PO Box 205', N'Fairfield', N'IA', N'52556', N'Damien', N'Deborah', N'(515) 555-6130', 2, 540, CAST(0x9EFF0000 AS SmallDateTime), 94.0000, 0.0000, 60.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (47, N'Baker & Taylor Books', N'Five Lakepointe Plaza, Ste 500', N'2709 Water Ridge Parkway', N'Charlotte', N'NC', N'28217', N'Bernardo', N'Brittnee', N'(704) 555-3500', 3, 572, CAST(0x9F0F0000 AS SmallDateTime), 531.2500, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (48, N'Fresno County Tax Collector', N'PO Box 1192', N'', N'Fresno', N'CA', N'93715', N'Brenton', N'Kila', N'(209) 555-3482', 3, 574, CAST(0x9F0F0000 AS SmallDateTime), 378.8800, 0.0000, 678.5800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (49, N'Mcgraw Hill Companies', N'PO Box 87373', N'', N'Chicago', N'IL', N'60680', N'Holbrooke', N'Rashad', N'(614) 555-3663', 3, 572, CAST(0x9F0F0000 AS SmallDateTime), 70.4100, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (50, N'Publishers Weekly', N'Box 1979', N'', N'Marion', N'OH', N'43305', N'Carrollton', N'Priscilla', N'(800) 555-1669', 3, 572, CAST(0x9F0F0000 AS SmallDateTime), 169.0000, 0.0000, 149.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (51, N'Blue Shield of California', N'PO Box 7021', N'', N'Anaheim', N'CA', N'92850', N'Smith', N'Kylie', N'(415) 555-5103', 3, 510, CAST(0x9F1A0000 AS SmallDateTime), 720.0000, 0.0000, 939.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (52, N'Aztek Label', N'Accounts Payable', N'1150 N Tustin Ave', N'Aneheim', N'CA', N'92807', N'Griffin', N'Brian', N'(714) 555-9000', 3, 551, CAST(0x9F2A0000 AS SmallDateTime), 267.0000, 0.0000, 813.7000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (53, N'Gary McKeighan Insurance', N'3649 W Beechwood Ave #101', N'', N'Fresno', N'CA', N'93711', N'Jair', N'Caitlin', N'(209) 555-2420', 3, 590, CAST(0x9F2A0000 AS SmallDateTime), 4745.0000, 0.0000, 4990.1800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (54, N'Ph Photographic Services', N'2384 E Gettysburg', N'', N'Fresno', N'CA', N'93726', N'Cheyenne', N'Kaylea', N'(209) 555-0765', 3, 540, CAST(0x9F2A0000 AS SmallDateTime), 565.1500, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (55, N'Quality Education Data', N'PO Box 95857', N'', N'Chicago', N'IL', N'60694', N'Misael', N'Kayle', N'(800) 555-5811', 2, 540, CAST(0x9F2A0000 AS SmallDateTime), 799.0900, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (56, N'Springhouse Corp', N'PO Box 7247-7051', N'', N'Philadelphia', N'PA', N'19170', N'Maeve', N'Clarence', N'(215) 555-8700', 3, 523, CAST(0x9F2F0000 AS SmallDateTime), 1942.2500, 0.0000, 1215.5000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (57, N'The Windows Deck', N'117 W Micheltorena Top Floor', N'', N'Santa Barbara', N'CA', N'93101', N'Wood', N'Liam', N'(800) 555-3353', 3, 536, CAST(0x9F2F0000 AS SmallDateTime), 2975.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (58, N'Fresno Rack & Shelving Inc', N'4718 N Bendel Ave', N'', N'Fresno', N'CA', N'93722', N'Baylee', N'Dakota', N'', 2, 523, CAST(0x9F3E0000 AS SmallDateTime), 168.0900, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (59, N'Publishers Marketing Assoc', N'627 Aviation Way', N'', N'Manhatttan Beach', N'CA', N'90266', N'Walker', N'Jovon', N'(310) 555-2732', 3, 572, CAST(0x9F3E0000 AS SmallDateTime), 175.0000, 0.0000, 120.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (60, N'The Mailers Guide Co', N'PO Box 1550', N'', N'New Rochelle', N'NY', N'10802', N'Lacy', N'Karina', N'', 3, 540, CAST(0x9F3E0000 AS SmallDateTime), 69.0000, 0.0000, 59.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (61, N'American Booksellers Assoc', N'828 S Broadway', N'', N'Tarrytown', N'NY', N'10591', N'Angelica', N'Nashalie', N'(800) 555-0037', 3, 574, CAST(0x9F4D0000 AS SmallDateTime), 775.0000, 0.0000, 175.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (62, N'Cmg Information Services', N'PO Box 2283', N'', N'Boston', N'MA', N'02107', N'Randall', N'Yash', N'(508) 555-7000', 3, 540, CAST(0x9F4D0000 AS SmallDateTime), 194.5700, 0.0000, 399.8500, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (63, N'Lou Gentile''s Flower Basket', N'722 E Olive Ave', N'', N'Fresno', N'CA', N'93728', N'Anum', N'Trisha', N'(209) 555-6643', 1, 570, CAST(0x9F4D0000 AS SmallDateTime), 74.3500, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (64, N'Texaco', N'PO Box 6070', N'', N'Inglewood', N'CA', N'90312', N'Oren', N'Grace', N'', 3, 582, CAST(0x9F4D0000 AS SmallDateTime), 62.4800, 0.0000, 476.5000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (65, N'The Drawing Board', N'PO Box 4758', N'', N'Carol Stream', N'IL', N'60197', N'Mckayla', N'Jeffery', N'', 2, 551, CAST(0x9F4D0000 AS SmallDateTime), 366.6500, 0.0000, 502.1300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (66, N'Ascom Hasler Mailing Systems', N'PO Box 895', N'', N'Shelton', N'CT', N'06484', N'Lewis', N'Darnell', N'', 3, 532, CAST(0x9F5C0000 AS SmallDateTime), 522.2100, 0.0000, 716.6600, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (67, N'Bill Jones', N'Secretary Of State', N'PO Box 944230', N'Sacramento', N'CA', N'94244', N'Deasia', N'Tristin', N'', 3, 589, CAST(0x9F5C0000 AS SmallDateTime), 10.0000, 0.0000, 10.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (68, N'Computer Library', N'3502 W Greenway #7', N'', N'Phoenix', N'AZ', N'85023', N'Aryn', N'Leroy', N'(602) 547-0331', 3, 540, CAST(0x9F5C0000 AS SmallDateTime), 196.2000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (69, N'Frank E Wilber Co', N'2437 N Sunnyside', N'', N'Fresno', N'CA', N'93727', N'Millerton', N'Johnathon', N'(209) 555-1881', 3, 532, CAST(0x9F5C0000 AS SmallDateTime), 1934.7000, 0.0000, 1538.2400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (70, N'Fresno Credit Bureau', N'PO Box 942', N'', N'Fresno', N'CA', N'93714', N'Braydon', N'Anne', N'(209) 555-7900', 2, 555, CAST(0x9F5C0000 AS SmallDateTime), 2663.2600, 0.0000, 452.4700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (71, N'The Fresno Bee', N'1626 E Street', N'', N'Fresno', N'CA', N'93786', N'Colton', N'Leah', N'(209) 555-4442', 2, 572, CAST(0x9F5C0000 AS SmallDateTime), 751.8300, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (72, N'Data Reproductions Corp', N'4545 Glenmeade Lane', N'', N'Auburn Hills', N'MI', N'48326', N'Arodondo', N'Cesar', N'(810) 555-3700', 3, 400, CAST(0x9F770000 AS SmallDateTime), 14624.8800, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (73, N'Executive Office Products', N'353 E Shaw Ave', N'', N'Fresno', N'CA', N'93710', N'Danielson', N'Rachael', N'(209) 555-1704', 2, 570, CAST(0x9F770000 AS SmallDateTime), 405.4800, 0.0000, 1361.7800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (74, N'Leslie Company', N'PO Box 610', N'', N'Olathe', N'KS', N'66061', N'Alondra', N'Zev', N'(800) 255-6210', 3, 570, CAST(0x9F770000 AS SmallDateTime), 139.6700, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (75, N'Retirement Plan Consultants', N'6435 North Palm Ave, Ste 101', N'', N'Fresno', N'CA', N'93704', N'Edgardo', N'Salina', N'(209) 555-7070', 3, 589, CAST(0x9F770000 AS SmallDateTime), 1660.0000, 0.0000, 1386.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (76, N'Simon Direct Inc', N'4 Cornwall Dr Ste 102', N'', N'East Brunswick', N'NJ', N'08816', N'Bradlee', N'Daniel', N'(908) 555-7222', 2, 540, CAST(0x9F770000 AS SmallDateTime), 8662.5000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (77, N'State Board Of Equalization', N'PO Box 942808', N'', N'Sacramento', N'CA', N'94208', N'Dean', N'Julissa', N'(916) 555-4911', 1, 631, CAST(0x9F770000 AS SmallDateTime), 2433.0000, 0.0000, 3606.8300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (78, N'The Presort Center', N'1627 "E" Street', N'', N'Fresno', N'CA', N'93706', N'Marissa', N'Kyle', N'(209) 555-6151', 3, 540, CAST(0x9F770000 AS SmallDateTime), 2377.4300, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (79, N'Valprint', N'PO Box 12332', N'', N'Fresno', N'CA', N'93777', N'Warren', N'Quentin', N'(209) 555-3112', 3, 551, CAST(0x9F770000 AS SmallDateTime), 44995.7500, 0.0000, 19211.1200, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (80, N'Cardinal Business Media, Inc.', N'P O Box 7247-7844', N'', N'Philadelphia', N'PA', N'19170', N'Eulalia', N'Kelsey', N'(215) 555-1500', 2, 540, CAST(0x9F850000 AS SmallDateTime), 2905.0000, 0.0000, 3867.7500, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (81, N'Wang Laboratories, Inc.', N'P.O. Box 21209', N'', N'Pasadena', N'CA', N'91185', N'Kapil', N'Robert', N'(800) 555-0344', 2, 160, CAST(0x9F850000 AS SmallDateTime), 4343.7600, 0.0000, 24125.3800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (82, N'Reiter''s Scientific & Pro Books', N'2021 K Street Nw', N'', N'Washington', N'DC', N'20006', N'Rodolfo', N'Carlee', N'(202) 555-5561', 2, 572, CAST(0x9F8A0000 AS SmallDateTime), 600.0000, 0.0000, 600.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (83, N'Ingram', N'PO Box 845361', N'', N'Dallas', N'TX', N'75284', N'Yobani', N'Trey', N'', 2, 572, CAST(0x9F970000 AS SmallDateTime), 4005.0000, 0.0000, 585.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (84, N'Boucher Communications Inc', N'1300 Virginia Dr. Ste 400', N'', N'Fort Washington', N'PA', N'19034', N'Carson', N'Julian', N'(215) 555-8000', 3, 540, CAST(0x9F9B0000 AS SmallDateTime), 1150.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (85, N'Champion Printing Company', N'3250 Spring Grove Ave', N'', N'Cincinnati', N'OH', N'45225', N'Clifford', N'Jillian', N'(800) 555-1957', 3, 540, CAST(0x9F9B0000 AS SmallDateTime), 10729.1400, 0.0000, 8095.2800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (86, N'Computerworld', N'Department #1872', N'PO Box 61000', N'San Francisco', N'CA', N'94161', N'Lloyd', N'Angel', N'(617) 555-0700', 1, 572, CAST(0x9F9B0000 AS SmallDateTime), 11664.5000, 0.0000, 2245.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (87, N'DMV Renewal', N'PO Box 942894', N'', N'Sacramento', N'CA', N'94294', N'Josey', N'Lorena', N'', 4, 568, CAST(0x9F9B0000 AS SmallDateTime), 923.0000, 0.0000, 779.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (88, N'Edward Data Services', N'4775 E Miami River Rd', N'', N'Cleves', N'OH', N'45002', N'Helena', N'Jeanette', N'(513) 555-3043', 1, 540, CAST(0x9F9B0000 AS SmallDateTime), 413.3600, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (89, N'Evans Executone Inc', N'4918 Taylor Ct', N'', N'Turlock', N'CA', N'95380', N'Royce', N'Hannah', N'', 1, 522, CAST(0x9F9B0000 AS SmallDateTime), 394.5500, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (90, N'Wakefield Co', N'295 W Cromwell Ave Ste 106', N'', N'Fresno', N'CA', N'93711', N'Rothman', N'Nathanael', N'(209) 555-4744', 2, 170, CAST(0x9F9B0000 AS SmallDateTime), 356.4800, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (91, N'McKesson Water Products', N'P O Box 7126', N'', N'Pasadena', N'CA', N'91109', N'Destin', N'Luciano', N'(800) 555-7009', 2, 570, CAST(0x9F9B0000 AS SmallDateTime), 384.7100, 0.0000, 363.1300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (92, N'Zip Print & Copy Center', N'PO Box 12332', N'', N'Fresno', N'CA', N'93777', N'Javen', N'Justin', N'(233) 555-6400', 2, 540, CAST(0x9F9B0000 AS SmallDateTime), 5641.2100, 0.0000, 6186.2700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (93, N'AT&T', N'PO Box 78225', N'', N'Phoenix', N'AZ', N'85062', N'Wesley', N'Alisha', N'', 3, 522, CAST(0x9F9D0000 AS SmallDateTime), 15730.9700, 0.0000, 9231.3400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (94, N'Abbey Office Furnishings', N'4150 W Shaw Ave', N'', N'Fresno', N'CA', N'93722', N'Francis', N'Kyra', N'(209) 555-8300', 2, 150, CAST(0x9FA00000 AS SmallDateTime), 5515.3500, 0.0000, 1385.0800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (95, N'Pacific Bell', N'', N'                              .', N'Sacramento', N'CA', N'95887', N'Nickalus', N'Kurt', N'(209) 555-7500', 2, 522, CAST(0x9FA60000 AS SmallDateTime), 4711.7700, 0.0000, 4296.1200, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (96, N'Wells Fargo Bank', N'Business Mastercard', N'P.O. Box 29479', N'Phoenix', N'AZ', N'85038', N'Damion', N'Mikayla', N'(947) 555-3900', 2, 160, CAST(0x9FA60000 AS SmallDateTime), 1107.3100, 0.0000, 1394.6800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (97, N'Compuserve', N'Dept L-742', N'', N'Columbus', N'OH', N'43260', N'Armando', N'Jan', N'(614) 555-8600', 2, 572, CAST(0x9FA70000 AS SmallDateTime), 109.4500, 0.0000, 145.9600, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (98, N'American Express', N'Box 0001', N'', N'Los Angeles', N'CA', N'90096', N'Story', N'Kirsten', N'(800) 555-3344', 2, 160, CAST(0x9FA90000 AS SmallDateTime), 28740.1000, 556.1900, 40780.8300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (99, N'Bertelsmann Industry Svcs. Inc', N'28210 N Avenue Stanford', N'', N'Valencia', N'CA', N'91355', N'Potter', N'Lance', N'(805) 555-0584', 3, 400, CAST(0x9FA90000 AS SmallDateTime), 39420.5600, 0.0000, 42499.9400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (100, N'Cahners Publishing Company', N'Citibank Lock Box 4026', N'8725 W Sahara Zone 1127', N'The Lake', N'NV', N'89163', N'Jacobsen', N'Samuel', N'(301) 555-2162', 4, 540, CAST(0x9FA90000 AS SmallDateTime), 2184.5000, 0.0000, 0.0000, 0.0000)
GO
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (101, N'California Business Machines', N'Gallery Plz', N'5091 N Fresno', N'Fresno', N'CA', N'93710', N'Rohansen', N'Anders', N'(209) 555-5570', 2, 170, CAST(0x9FA90000 AS SmallDateTime), 722.1600, 0.0000, 981.8300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (102, N'Coffee Break Service', N'PO Box 1091', N'', N'Fresno', N'CA', N'93714', N'Smitzen', N'Jeffrey', N'(209) 555-8700', 4, 570, CAST(0x9FA90000 AS SmallDateTime), 706.9000, 0.0000, 816.5000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (103, N'Dean Witter Reynolds', N'9 River Pk Pl E 400', N'', N'Fresno', N'CA', N'93720', N'Johnson', N'Vance', N'(209) 555-7171', 5, 589, CAST(0x9FA90000 AS SmallDateTime), 29522.5000, 0.0000, 17967.5000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (104, N'Digital Dreamworks', N'5070 N Sixth Ste. 71', N'', N'Fresno', N'CA', N'93711', N'Elmert', N'Ron', N'', 3, 589, CAST(0x9FA90000 AS SmallDateTime), 5000.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (105, N'Dristas Groom & Mccormick', N'7112 N Fresno St Ste 200', N'', N'Fresno', N'CA', N'93720', N'Aaronsen', N'Thom', N'(209) 555-8484', 3, 591, CAST(0x9FA90000 AS SmallDateTime), 9082.0000, 0.0000, 8173.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (106, N'Ford Motor Credit Company', N'Dept 0419', N'', N'Los Angeles', N'CA', N'90084', N'Snyder', N'Karen', N'(800) 555-7000', 3, 582, CAST(0x9FA90000 AS SmallDateTime), 5535.2000, 0.0000, 6039.8100, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (107, N'Franchise Tax Board', N'PO Box 942857', N'', N'Sacramento', N'CA', N'94257', N'Prado', N'Anita', N'', 4, 507, CAST(0x9FA90000 AS SmallDateTime), 12632.5000, 0.0000, 800.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (108, N'Gostanian General Building', N'427 W Bedford #102', N'', N'Fresno', N'CA', N'93711', N'Bragg', N'Walter', N'(209) 555-5100', 4, 523, CAST(0x9FA90000 AS SmallDateTime), 450.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (109, N'Kent H Landsberg Co', N'File No 72686', N'PO Box 61000', N'San Francisco', N'CA', N'94160', N'Stevens', N'Wendy', N'(916) 555-8100', 3, 540, CAST(0x9FA90000 AS SmallDateTime), 5711.1200, 0.0000, 1473.7000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (110, N'Malloy Lithographing Inc', N'5411 Jackson Road', N'PO Box 1124', N'Ann Arbor', N'MI', N'48106', N'Regging', N'Abe', N'(313) 555-6113', 3, 400, CAST(0x9FA90000 AS SmallDateTime), 213039.6500, 0.0000, 192213.0100, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (111, N'Net Asset, Llc', N'1315 Van Ness Ave Ste. 103', N'', N'Fresno', N'CA', N'93721', N'Kraggin', N'Laura', N'', 1, 572, CAST(0x9FA90000 AS SmallDateTime), 581.2100, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (112, N'Office Depot', N'File No 81901', N'', N'Los Angeles', N'CA', N'90074', N'Pinsippi', N'Val', N'(209) 555-1711', 3, 570, CAST(0x9FA90000 AS SmallDateTime), 3916.9100, 0.0000, 4197.3400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (113, N'Pollstar', N'4697 W Jacquelyn Ave', N'', N'Fresno', N'CA', N'93722', N'Aranovitch', N'Robert', N'(209) 555-2631', 5, 520, CAST(0x9FA90000 AS SmallDateTime), 17500.0000, 0.0000, 19750.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (114, N'Postmaster', N'Postage Due Technician', N'1900 E Street', N'Fresno', N'CA', N'93706', N'Finklestein', N'Fyodor', N'(209) 555-7785', 1, 552, CAST(0x9FA90000 AS SmallDateTime), 1875.0000, 0.0000, 1175.0000, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (115, N'Roadway Package System, Inc', N'Dept La 21095', N'', N'Pasadena', N'CA', N'91185', N'Smith', N'Sam', N'', 4, 553, CAST(0x9FA90000 AS SmallDateTime), 614.1500, 0.0000, 327.2300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (116, N'State of California', N'Employment Development Dept', N'PO Box 826276', N'Sacramento', N'CA', N'94230', N'Articunia', N'Mercedez', N'(209) 555-5132', 1, 631, CAST(0x9FA90000 AS SmallDateTime), 22300.4600, 0.0000, 17568.5800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (117, N'Suburban Propane', N'2874 S Cherry Ave', N'', N'Fresno', N'CA', N'93706', N'Spivak', N'Harold', N'(209) 555-2770', 3, 521, CAST(0x9FA90000 AS SmallDateTime), 61.9400, 0.0000, 32.3400, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (118, N'Unocal', N'P.O. Box 860070', N'', N'Pasadena', N'CA', N'91186', N'Bluzinski', N'Rachael', N'(415) 555-7600', 3, 582, CAST(0x9FA90000 AS SmallDateTime), 1870.2800, 0.0000, 1140.6700, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (119, N'Yesmed, Inc', N'PO Box 2061', N'', N'Fresno', N'CA', N'93718', N'Hernandez', N'Reba', N'(209) 555-0600', 2, 589, CAST(0x9FA90000 AS SmallDateTime), 48690.5100, 0.0000, 51420.0300, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (120, N'Dataforms/West', N'1617 W. Shaw Avenue', N'Suite F', N'Fresno', N'CA', N'93711', N'Church', N'Charlie', N'', 3, 551, CAST(0x9FAB0000 AS SmallDateTime), 12108.4400, 0.0000, 13232.2200, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (121, N'Zylka Design', N'3467 W Shaw Ave #103', N'', N'Fresno', N'CA', N'93711', N'Ronaldsen', N'Jaime', N'(209) 555-8625', 3, 403, CAST(0x9FAB0000 AS SmallDateTime), 30486.4400, 0.0000, 5311.4800, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (122, N'United Parcel Service', N'P.O. Box 505820', N'', N'Reno', N'NV', N'88905', N'Beauregard', N'Violet', N'(800) 555-0855', 3, 553, CAST(0x9FAD0000 AS SmallDateTime), 93601.9900, 0.0000, 76238.9600, 0.0000)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorContactLName], [VendorContactFName], [VendorPhone], [TermsID], [AccountNo], [LastTranDate], [YTDPurchases], [YTDReturns], [LastYTDPurchases], [LastYTDReturns]) VALUES (123, N'Federal Express Corporation', N'P.O. Box 1140', N'Dept A', N'Memphis', N'TN', N'38101', N'Bucket', N'Charlie', N'(209) 555-4091', 3, 553, CAST(0x9FB00000 AS SmallDateTime), 29742.9800, 0.0000, 19893.6100, 0.0000)
SET IDENTITY_INSERT [dbo].[Vendors] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [City]    Script Date: 5/3/2012 10:02:52 AM ******/
CREATE NONCLUSTERED INDEX [City] ON [dbo].[Customers]
(
	[CustCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PostalCode]    Script Date: 5/3/2012 10:02:52 AM ******/
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Customers]
(
	[CustZip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Region]    Script Date: 5/3/2012 10:02:52 AM ******/
CREATE NONCLUSTERED INDEX [Region] ON [dbo].[Customers]
(
	[CustState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_VendorName]    Script Date: 5/3/2012 10:02:52 AM ******/
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [IX_VendorName] UNIQUE NONCLUSTERED 
(
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sample] ADD  CONSTRAINT [DF_Sample_Text]  DEFAULT ('None') FOR [Color]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_TermsID]  DEFAULT (3) FOR [TermsID]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_AccountNo]  DEFAULT (570) FOR [AccountNo]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_YTDPurchases]  DEFAULT (0) FOR [YTDPurchases]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_YTDReturns]  DEFAULT (0) FOR [YTDReturns]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_LastYTDPurchases]  DEFAULT (0) FOR [LastYTDPurchases]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_LastYTDReturns]  DEFAULT (0) FOR [LastYTDReturns]
GO
ALTER TABLE [dbo].[SalesTotals]  WITH CHECK ADD  CONSTRAINT [FK_SalesTotals_SalesReps] FOREIGN KEY([RepID])
REFERENCES [dbo].[SalesReps] ([RepID])
GO
ALTER TABLE [dbo].[SalesTotals] CHECK CONSTRAINT [FK_SalesTotals_SalesReps]
GO
USE [master]
GO
ALTER DATABASE [Examples] SET  READ_WRITE 
GO

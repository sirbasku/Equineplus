/****** Object:  Table [dbo].[transKey_Horse]    Script Date: 10/22/2020 10:03:27 PM ******/
/*
CREATE TABLE [dbo].[transKey_Horse](
	[GUID_HorseID] [uniqueidentifier] NOT NULL,
	[INT_HorseID] [int] IDENTITY(1,1) NOT NULL,
	[HorseName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Horse] PRIMARY KEY CLUSTERED 
(
	[GUID_HorseID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_Gender](
	[GUID_GenderID] [uniqueidentifier] NOT NULL,
	[INT_GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NULL,
 CONSTRAINT [PK_transKey_base_Gender] PRIMARY KEY CLUSTERED 
(
	[GUID_GenderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_HorseColor](
	[GUID_HorseColorID] [uniqueidentifier] NOT NULL,
	[INT_HorseColorID] [int] IDENTITY(1,1) NOT NULL,
	[HorseColorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_transKey_base_HorseColor] PRIMARY KEY CLUSTERED 
(
	[GUID_HorseColorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_HorseBreed](
	[HorseBreedID] [int] IDENTITY(1,1) NOT NULL,
	[HorseBreedName] nvarchar(50) NOT NULL,
	[SortOrder] [int] NOT NULL
 CONSTRAINT [PK_transKey_base_HorseBreed] PRIMARY KEY CLUSTERED 
(
	[HorseBreedID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_Strain](
	[StrainID] [int] IDENTITY(1,1) NOT NULL,
	[StrainCode] nvarchar(10) NOT NULL,
	[StrainTrackingColor] [nvarchar](50) NULL,
	[StrainMasculineName] [nvarchar](50) NULL,
	[StrainFeminineName] [nvarchar](50) NULL,
 CONSTRAINT [PK_transKey_base_Strain] PRIMARY KEY CLUSTERED 
(
	[StrainID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_LocalCode](
	[GUID_LocalCodeID] [uniqueidentifier] NOT NULL,
	[INT_LocalCodeID] [int] IDENTITY(1,1) NOT NULL,
	[LocalCodeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_transKey_base_LocalCode] PRIMARY KEY CLUSTERED 
(
	[GUID_LocalCodeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_Contact](
	[GUID_ContactID] [uniqueidentifier] NOT NULL,
	[INT_ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Contact] PRIMARY KEY CLUSTERED 
(
	[GUID_ContactID] ASC
) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_Client](
	[GUID_ClientID] [uniqueidentifier] NOT NULL,
	[INT_ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_transKey_Client] PRIMARY KEY CLUSTERED 
(
	[GUID_ClientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_Ownership](
	[GUID_OwnershipID] [uniqueidentifier] NOT NULL,
	[INT_OwnershipID] [int] IDENTITY(1,1) NOT NULL,
	[OwnershipName] [nvarchar](100) NULL,
 CONSTRAINT [PK_transKey_Ownership] PRIMARY KEY CLUSTERED 
(
	[GUID_OwnershipID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO transKey_Ownership (GUID_OwnershipID, OwnershipName)
SELECT o.OwnershipID AS GUID_OwnershipID
,c.ClientCode + ' ' + h.HorseName AS OwnershipName
FROM user_Ownership AS o
LEFT OUTER JOIN user_Client AS c ON c.ClientID = o.ClientID
LEFT OUTER JOIN user_Horse AS h ON h.HorseID = o.HorseID
ORDER BY h.HorseName, c.ClientCode

CREATE TABLE [dbo].[transKey_Boarding](
	[GUID_BoardingID] [uniqueidentifier] NOT NULL,
	[INT_BoardingID] [int] IDENTITY(1,1) NOT NULL,
	[BoardingName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Boarding] PRIMARY KEY CLUSTERED 
(
	[GUID_BoardingID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_Service](
	[GUID_ServiceID] [uniqueidentifier] NOT NULL,
	[INT_ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Service] PRIMARY KEY CLUSTERED 
(
	[GUID_ServiceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_ServiceType](
	[GUID_ServiceTypeID] [uniqueidentifier] NOT NULL,
	[INT_ServiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_base_ServiceType] PRIMARY KEY CLUSTERED 
(
	[GUID_ServiceTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_Breeding](
	[GUID_BreedingID] [uniqueidentifier] NOT NULL,
	[INT_BreedingID] [int] IDENTITY(1,1) NOT NULL,
	[BreedingName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Breeding] PRIMARY KEY CLUSTERED 
(
	[GUID_BreedingID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- POPULATE trans_Horse
INSERT INTO transKey_Horse (GUID_HorseID, HorseName)
SELECT HorseID, HorseName
FROM user_Horse h

INSERT INTO transKey_base_Gender (GUID_GenderID, GenderName)
SELECT l.LookupID, l.LookupDescription
FROM base_Lookup l
INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID
WHERE ls.LookupSetDescription = 'Gender'

INSERT INTO transKey_base_HorseColor (GUID_HorseColorID, HorseColorName)
SELECT l.LookupID, l.LookupDescription
FROM base_Lookup l
INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID

INSERT INTO transKey_base_HorseBreed
(HorseBreedName, SortOrder)
VALUES
	('Straight Egyptian',
	1),
	('American Saddlebred',
	2),
	('Anglo Arabian',
	3),
	('Arabian',
	4),
	('Draft',
	5),
	('Egyptian Related',
	6),
	('Egyptian Sired',
	7),
	('Grade',
	8),
	('Gypsy Vanner',
	9),
	('Half Arabian',
	10),
	('Mustang',
	11),
	('National Show Horse',
	12),
	('Other',
	13),
	('Paint',
	14),
	('Quarter Horse',
	15),
	('Spotted Saddle Horse',
	16),
	('Tennessee Walker',
	17),
	('Thoroughbred',
	18),
	('Warmblood',
	19)

INSERT INTO transKey_base_Strain 
(StrainCode, StrainTrackingColor, StrainMasculineName, StrainFeminineName)
VALUES
	('1A',
	'Red',
	'Kuhaylan Ajuz (Rodan)',
	'Kuhaylah Ajuz (Rodan)'),
	('1B',
	'Red',
	'Kuhaylan',
	'Kuhaylah'),
	('1C',
	'Red',
	'Kuhaylan Jellabi',
	'Kuhaylah Jellabiyah'),
	('1D',
	'Red',
	'Kuhaylan Kurush',
	'Kuhaylah Kurush'),
	('2A',
	'Blue',
	'Dahman Shahwan',
	'Dahmah Shahwaniyak'),
	('3A',
	'Purple',
	'Abbeyan Umm Jurays',
	'Abbeyah Umm Jurays'),
	('5A',
	'Orange',
	'Saqlawi Jidran',
	'Saqlawi Jidraniyah'),
	('6A',
	'Green',
	'Hadban Enzahi',
	'Hadbah Enzahiyah'),
	('7A',
	'Black',
	'Shuweyman Sabban',
	'Shuweymah Sabbah'),
	('7B',
	'Black',
	'Hamdani Simri',
	'Hamdani Simriyah')


INSERT INTO transKey_base_LocalCode (GUID_LocalCodeID, LocalCodeName)
SELECT l.LookupID, l.LookupDescription
FROM base_Lookup l
INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID
WHERE ls.LookupSetDescription = 'Local Code'

INSERT INTO transKey_Contact (GUID_ContactID, ContactName)
SELECT ContactID, ISNULL(FirstName, '') + ' ' + ISNULL(Name, '')
FROM user_Contact
	
INSERT INTO transKey_Client (GUID_ClientID, ClientCode)
SELECT ClientID, ClientCode
FROM user_Client

--transKey_Boarding
INSERT INTO transKey_Boarding (GUID_BoardingID, BoardingName)
SELECT b.BoardingID, h.HorseName
FROM user_MaintenanceBoarding b
INNER JOIN user_Horse h ON h.HorseID = b.HorseID

--transKey_ServiceType
INSERT INTO transKey_base_ServiceType (GUID_ServiceTypeID, ServiceTypeName)
SELECT l.[LookupID]
      ,l.[LookupDescription]
  FROM [dbo].[base_Lookup] l
INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID
WHERE ls.LookupSetDescription ='Service Type'
AND l.LookupDescription IN ('Farrier', 'Veterinary')

--transKey_Service for only vet and Farrier (via inner join to those in transKey_ServiceType)
INSERT INTO transKey_Service (GUID_ServiceID, ServiceName)
SELECT s.ServiceID
	, s.Notes
FROM user_Service s
INNER JOIN user_Horse h ON h.HorseID = s.HorseID
INNER JOIN transKey_base_ServiceType st ON st.GUID_ServiceTypeID = s.ServiceTypeID
WHERE ServiceDate > '1/1/2015'  -- Try 5 years worth 1st test: 86000+ rows

--transKey_Breeding
INSERT INTO transKey_Breeding (GUID_BreedingID, BreedingName)
SELECT BreedingID
, sire.HorseName + '-' + dam.HorseName
FROM user_Breeding b
INNER JOIN user_Horse sire ON sire.HorseID = b.StallionID
INNER JOIN user_Horse dam ON dam.HorseID = b.HorseID

--Create export tables

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_HorseColor](
	[HorseColorID] [int] IDENTITY(1,1) NOT NULL,
	[HorseColorName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_HorseColor] PRIMARY KEY CLUSTERED 
(
	[HorseColorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_HorseBreed](
	[HorseBreedID] [int] IDENTITY(1,1) NOT NULL,
	[HorseBreedName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_HorseBreed] PRIMARY KEY CLUSTERED 
(
	[HorseBreedID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_Strain](
	[StrainID] [int] IDENTITY(1,1) NOT NULL,
	[StrainCode] [nvarchar](10) NOT NULL,
	[StrainTrackingColor] [nvarchar](10) NULL,
	[StrainMasculineName] [nvarchar](50) NOT NULL,
	[StrainFeminineName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_Strain] PRIMARY KEY CLUSTERED 
(
	[StrainID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_LocalCode](
	[LocalCodeID] [int] IDENTITY(1,1) NOT NULL,
	[LocalCodeName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_LocalCode] PRIMARY KEY CLUSTERED 
(
	[LocalCodeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_Gender ON
GO
INSERT INTO export_base_Gender (GenderID, GenderName, SortOrder)
SELECT trans.INT_GenderID AS GenderID --Get int ID from trans table
--Get rest from source table(s)
, l.LookupDescription AS GenderName
, l.LookupSequence AS SortOrder
--trans table:
FROM transKey_base_Gender trans 
--source table:
INNER JOIN base_Lookup l ON l.LookupID = trans.GUID_GenderID
GO

SET ANSI_NULLS ON
GO
--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_HorseBreed ON
GO
INSERT INTO export_base_HorseBreed (HorseBreedID, HorseBreedName, SortOrder)
SELECT trans.HorseBreedID 
,trans.HorseBreedName
, trans.SortOrder
FROM transKey_base_HorseBreed trans 

SET ANSI_NULLS ON
GO
--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_HorseColor ON
GO
INSERT INTO export_base_HorseColor (HorseColorID, HorseColorName, SortOrder)
SELECT trans.INT_HorseColorID AS GenderID --Get int ID from trans table
--Get rest from source table(s)
, l.LookupDescription AS GenderName
, l.LookupSequence AS SortOrder
--trans table:
FROM transKey_base_HorseColor trans 
--source table:
INNER JOIN base_Lookup l ON l.LookupID = trans.GUID_HorseColorID
GO

SET ANSI_NULLS ON
GO
--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_Strain ON
GO
INSERT INTO export_base_Strain (StrainID, StrainCode, StrainTrackingColor, StrainMasculineName, StrainFeminineName, SortOrder)
SELECT StrainID, StrainCode, StrainTrackingColor, StrainMasculineName, StrainFeminineName, StrainID AS SortOrder
FROM transKey_base_Strain
GO

SET ANSI_NULLS ON
GO
--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_LocalCode ON
GO
INSERT INTO export_base_LocalCode (LocalCodeID, LocalCodeName, SortOrder)
SELECT trans.INT_LocalCodeID AS LocalCodeID --Get int ID from trans table
--Get rest from source table(s)
, l.LookupDescription AS LocalCodeName
, l.LookupSequence AS SortOrder
--trans table:
FROM transKey_base_LocalCode trans 
--source table:
INNER JOIN base_Lookup l ON l.LookupID = trans.GUID_LocalCodeID
GO

--export_Client with Primary Contact fields embedded
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transKey_base_State](
	[GUID_StateID] [uniqueidentifier] NOT NULL,
	[INT_StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[StateAbrv] [nvarchar](10) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_transKey_base_State] PRIMARY KEY CLUSTERED 
(
	[GUID_StateID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO transKey_base_State (GUID_StateID, StateName, StateAbrv, SortOrder)
SELECT [LookupID] AS GUID_StateID 
      ,[LookupDescription] AS StateName 
      ,[LookupAbrv] AS StateAbrv 
      ,[LookupSequence] AS SortOrder 
  FROM [dbo].[base_Lookup] l 
  inner join base_lookupset ls on ls.lookupsetid = l.lookupsetid 
  where ls.lookupsetdescription = 'States' 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[StateAbrv] [nvarchar](10) NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_State ON
GO
INSERT INTO export_base_State (StateID, StateName, StateAbrv, SortOrder)
SELECT [INT_StateID] AS StateID
      ,[StateName]
      ,[StateAbrv]
      ,[SortOrder]
  FROM [dbo].[transKey_base_State]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transKey_base_Country](
	[GUID_CountryID] [uniqueidentifier] NOT NULL,
	[INT_CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_transKey_base_Country] PRIMARY KEY CLUSTERED 
(
	[GUID_CountryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO transKey_base_Country (GUID_CountryID, CountryName, SortOrder)
SELECT [LookupID] AS GUID_CountryID 
      ,[LookupDescription] AS CountryName 
      ,[LookupSequence] AS SortOrder 
  FROM [dbo].[base_Lookup] l 
  inner join base_lookupset ls on ls.lookupsetid = l.lookupsetid 
  where ls.lookupsetdescription = 'Countries' 
  order by LookupSequence

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_export_base_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Allow insert of int PKs from trans tables into int PK field
SET IDENTITY_INSERT export_base_Country ON
GO
INSERT INTO export_base_Country (CountryID, CountryName, SortOrder)
SELECT 
      [INT_CountryID] AS CountryID
      ,[CountryName]
      ,[SortOrder]
  FROM [dbo].[transKey_base_Country]
  ORDER BY SortOrder

CREATE TABLE [dbo].[export_Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [nvarchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[StateID] [int] NULL,
	[Zip] [nvarchar](20) NULL,
	[CountryID] [int] NULL,
	[Phone1] [nvarchar](25) NULL,
	[Phone2] [nvarchar](25) NULL,
	[Fax] [nvarchar](25) NULL,
	[LastBalanceDue] [money] NULL,
	[Notes] [ntext] NULL,
	[UpdateUser] [nvarchar](120) NULL,
	[UpdateTimestamp] [datetime] NULL,
 CONSTRAINT [PK_export_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET IDENTITY_INSERT export_Client ON
GO
INSERT INTO export_Client
(
	ClientID
	,ClientCode
	,FirstName
	,LastName
	,Company
	,Address1
	,Address2
	,City
	,StateID
	,Zip
	,CountryID
	,Phone1
	,Phone2
	,Fax 
	,LastBalanceDue
	,Notes
	,UpdateUser
	,UpdateTimestamp
)
SELECT 
	k.INT_ClientID AS ClientID    --Get Int ID from transKey
	-- Rest from user files
	,cl.ClientCode
	,con.FirstName
	,con.Name AS LastName
	,con.Company
	,con.Address1
	,con.Address2
	,con.City
	,state.INT_StateID
	,con.Zip
	,country.INT_CountryID
	,con.Phone1
	,con.Phone2
	,con.Fax
	,cl.TransCurrent+cl.TransPeriod1+cl.TransPeriod2+cl.TransPeriod3 AS LastBalanceDue
	,TRIM(TRIM(CONVERT(VARCHAR(8000), SUBSTRING(ISNULL(cl.Notes,''), 1, 8000))) + ' ' + TRIM(CONVERT(VARCHAR(8000), SUBSTRING(ISNULL(cl.Comments, ''), 1, 8000))) + ' ' + TRIM(CONVERT(VARCHAR(8000), SUBSTRING(ISNULL(con.HorseNotes, ''), 1, 8000)))) AS Notes 
	,cl.UpdateUser
	,cl.UpdateTimestamp
FROM transKey_Client k
INNER JOIN user_Client cl ON cl.ClientID = k.GUID_ClientID
LEFT OUTER JOIN user_Contact con ON con.ContactID = cl.ContactID
LEFT OUTER JOIN transKey_base_State state ON state.GUID_StateID = con.StateID
LEFT OUTER JOIN transKey_base_Country country ON country.GUID_CountryID = con.CountryID

CREATE TABLE [dbo].[export_Ownership](
	[OwnershipID] [int] NOT NULL,
	[HorseID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[Percentage] [numeric](18, 2) NULL,
	[LastStatementDate] [datetime] NULL,
	[Comments] [ntext] NULL,
	[UpdateUser] [nvarchar](120) NULL,
	[UpdateTimestamp] [datetime] NULL,
 CONSTRAINT [PK_export_Ownership] PRIMARY KEY CLUSTERED 
(
	[OwnershipID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Sorting through Data2 for breed:

--select distinct data2 from user_horse
--where data2 like '%egy%' or data2 like'%ptian%'

/*
--Clean up misspellings for Straight Egyptian
--SELECT Data2 FROM user_Horse
--UPDATE user_Horse SET Data2 = 'Straight Egyptian'
--Straight Egyptian
WHERE Data2 IN
(
'Egyptian'
,'Egptian'
,'Egyptpian'
,'Eguptian'
,'Egyptina'
,'Egypitan'
,'Eagyptian'
,'Egyptyian'
,'Egytian'
,'Egyptian Bred'
,'Eygptian'
,'Egyyptian'
,'Egyptian ?'
,'Egyptain'
,'Egytpian'
,'Egyptia'
,'Egyptia;n'
,'DB-Arabia'
,'DB - Arabia'
)
*/

/*
--Clean up misspellings for Egyptian Related
--SELECT Data2 FROM user_Horse
--UPDATE user_Horse SET Data2 = 'Egyptian Related'
--Straight Egyptian
WHERE Data2 IN
--Egyptian Related:
(
'Egyptian Related'
,'1/2 Egyptian'
,'1/4 Egyptian'
,'7/8 Egyptian'
,'1/2 Egytian'
,'? Egyptian'
,'1/2Egyptian'
,'1/Egyptian'
,'1/2/ Egyptian'
,'1/4 Egyptian Bred'
,'3/4 Egyptian'
,'Polish Egyptian'
)
*/

/*
-- Fix one record that had Data1 and Data2 switched

--select data1, data2 from user_Horse
--UPDATE user_Horse SET Data2 = 'Straight Egyptian', Data1 = 'Dahman Shahwan'
WHERE Data2 = 'Dahman Shahwan'

CREATE TABLE [dbo].[export_Horse](
	[HorseID] [int] IDENTITY(1,1) NOT NULL,
	[HorseName] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](22) NULL,
	[BandNumber] [nvarchar](10) NULL,
	[LocalCodeID] [int] NULL,
	[HorseColorID] [int] NULL,
	[GenderID] [int] NULL,
	[HorseBreedID] [int] NULL,
	[StrainID] [int] NULL,
	[FoalDate] [nvarchar](8) NULL,
	[DateDeceased] [nvarchar](8) NULL,
	[DateSold] [date] NULL,
	[DateAcquired] [date] NULL,
	[SireID] [int] NULL,
	[DamID] [int] NULL,
	[Imported] [bit] NULL,
	[DNA] [bit] NULL,
	[IDMarked] [bit] NULL,
	[Alert1] [nvarchar](50) NULL,
	[Alert2] [nvarchar](50) NULL,
	[Comments] [nvarchar](4000) NULL,
	[Breeder] [nvarchar](50) NULL,
	[Owner] [nvarchar](50) NULL,
	[Catalog] [nvarchar](20) NULL,
	[legacy_Data1] [nvarchar](50) NULL,
	[legacy_Data2] [nvarchar](50) NULL,
	[legacy_MaintLocation] [nvarchar](50) NULL,
	[UpdateUser] [nvarchar](120) NULL,
	[UpdateTimestamp] [datetime] NULL,
 CONSTRAINT [PK_export_Horse] PRIMARY KEY CLUSTERED 
(
	[HorseID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
=========================================
SET IDENTITY_INSERT export_Horse ON
GO
INSERT INTO export_Horse
(
	[HorseID]
	,[HorseName]
	,[RegistrationNumber]
	,[BandNumber]
	,[LocalCodeID]
	,[HorseColorID]
	,[GenderID]
	,[HorseBreedID]
	,[StrainID]
	,[FoalDate]
	,[DateDeceased]
	,[DateSold]
	,[DateAcquired]
	,[SireID]
	,[DamID]
	,[Imported]
	,[DNA]
	,[IDMarked]
	,[Alert1]
	,[Alert2]
	,[Comments]
	,[Breeder]
	,[Owner]
	,[Catalog]
	,[legacy_Data1]
	,[legacy_Data2]
	,[legacy_MaintLocation]
	,[UpdateUser]
	,[UpdateTimestamp]
)
SELECT k.INT_HorseID AS HorseID
-- From Source Tables
	,h.HorseName
	,h.RegistrationNumber
	,maint.BandNumber
	,klc.INT_LocalCodeID AS LocalCodeID
	,khc.INT_HorseColorID AS HorseColorID
	,kg.INT_GenderID AS GenderID
	,CASE 
		WHEN Data2 = 'Straight Egyptian' THEN (SELECT HorseBreedID FROM transKey_base_HorseBreed WHERE HorseBreedName = 'Straight Egyptian')
		WHEN Data2 = 'Egyptian Related' THEN (SELECT HorseBreedID FROM transKey_base_HorseBreed WHERE HorseBreedName = 'Egyptian Related')
		WHEN Data2 = 'Half Arabian' THEN (SELECT HorseBreedID FROM transKey_base_HorseBreed WHERE HorseBreedName = 'Half Arabian')
		ELSE NULL
	END AS HorseBreedID

	,CASE 
		WHEN Data1 LIKE '%Kuhaylan%' OR Data1 LIKE '%Kuhaylah%' THEN
			CASE
				WHEN Data1 LIKE '%Ajuz%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '1A')
				WHEN Data1 LIKE '%Jellabi%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '1C')
				WHEN Data1 LIKE '%Kurush%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '1D')
				ELSE (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '1B')
			END
		WHEN Data1 LIKE '%shahwan%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '2A')
		WHEN Data1 LIKE '%Umm Jurays%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '3A')
		WHEN Data1 LIKE '%Jidran%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '5A')
		WHEN Data1 LIKE '%Enzahi%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '6A')
		WHEN Data1 LIKE '%shuwey%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '7A')
		WHEN Data1 LIKE '%Hamdani%' THEN (SELECT StrainID FROM transKey_base_Strain WHERE StrainCode = '7B')
		ELSE NULL
	END AS StrainID
	,h.DateBorn AS FoalDate
	,h.DateDeceased AS DateDeceased
	,CONVERT(Date, h.DateSold) AS DateSold
	,CONVERT(Date, hist.DateAcquired) AS DateAcquired
	,sire.INT_HorseID AS SireID
	,dam.INT_HorseID AS DamID
	,h.Imported
	,h.BloodTyped AS DNA 
	,h.FreezeMarked AS IDMarked
	,h.Title1 AS Alert1
	,h.Title2 AS Alert2
	,TRIM(ISNULL(h.Comment,'')) + ' ' + TRIM(CONVERT(NVARCHAR(4000), SUBSTRING(ISNULL(h.Comments,''), 1, 4000))) AS Comments
	,h.Breeder
	,h.Owner
	,h.Catalog
	,h.Data1 AS legacy_Data1
	,h.Data2 AS legacy_Data2
	,maint.[Location] AS legacy_MaintLocation
	,h.UpdateUser
	,h.UpdateTimestamp
	
FROM transKey_Horse k
INNER JOIN user_Horse h ON H.HorseID = k.GUID_HorseID
LEFT OUTER JOIN transKey_base_LocalCode klc ON klc.GUID_LocalCodeID = h.LocalID
LEFT OUTER JOIN transKey_base_HorseColor khc ON khc.GUID_HorseColorID = h.ColorID
LEFT OUTER JOIN transKey_base_Gender kg ON kg.GUID_GenderID = h.GenderID
LEFT OUTER JOIN transKey_Horse sire ON sire.GUID_HorseID = h.SireID
LEFT OUTER JOIN transKey_Horse dam ON dam.GUID_HorseID = h.DamID
LEFT OUTER JOIN user_History hist ON hist.HorseID = h.HorseID
LEFT OUTER JOIN user_Maintenance maint ON maint.HorseID = h.HorseID

*/


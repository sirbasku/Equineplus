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
	[SortOrder] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_HorseColor](
	[HorseColorID] [int] IDENTITY(1,1) NOT NULL,
	[HorseColorName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_HorseBreed](
	[HorseBreedID] [int] IDENTITY(1,1) NOT NULL,
	[HorseBreedName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL
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
	[SortOrder] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export_base_LocalCode](
	[LocalCodeID] [int] IDENTITY(1,1) NOT NULL,
	[LocalCodeName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL
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

*/




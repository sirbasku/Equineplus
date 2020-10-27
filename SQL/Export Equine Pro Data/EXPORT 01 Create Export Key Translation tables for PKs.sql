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

CREATE TABLE [dbo].[transKey_base_Strain](
	[GUID_TrackingColorID] [uniqueidentifier] NOT NULL,
	[INT_StrainID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
	[MasculineStrainName] [nvarchar](50) NULL,
	[FeminineStrainName] [nvarchar](50) NULL,
 CONSTRAINT [PK_transKey_base_Strain] PRIMARY KEY CLUSTERED 
(
	[GUID_TrackingColorID] ASC
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
	[ClientName] [nchar](50) NULL,
 CONSTRAINT [PK_transKey_Client] PRIMARY KEY CLUSTERED 
(
	[GUID_ClientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[transKey_base_HorseBreed](
	[HorseBreedName] [nvarchar](50) NOT NULL,
	[INT_HorseBreedID] [int] IDENTITY(1,1) NOT NULL,

 CONSTRAINT [PK_transKey_base_HorseBreed] PRIMARY KEY CLUSTERED 
(
	[HorseBreedName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
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

INSERT INTO transKey_base_LocalCode (GUID_LocalCodeID, LocalCodeName)
SELECT l.LookupID, l.LookupDescription
FROM base_Lookup l
INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID
WHERE ls.LookupSetDescription = 'Local Code'

INSERT INTO
	transKey_base_Strain(GUID_TrackingColorID, ColorName)
SELECT
	l.LookupID,
	l.LookupDescription
FROM
	base_Lookup l
	INNER JOIN base_LookupSet ls ON ls.LookupSetID = l.LookupSetID
WHERE
	ls.LookupSetDescription = 'Tracking Color'

--Fix color names
UPDATE transKey_base_Strain
SET ColorName = 'Purple'
WHERE ColorName = 'Violet (Dark Blue)'

UPDATE transKey_base_Strain
SET ColorName = 'Blue'
WHERE ColorName = 'Cyan (Blue)'

UPDATE transKey_base_Strain
SET ColorName = 'Red'
WHERE ColorName = 'Magenta (Red)'

-- Assign Masculine and Feminine names to colors
UPDATE transKey_base_Strain
SET MasculineStrainName = 'Abbeyan Umm Jurays'
, FeminineStrainName = 'Abbeyah Umm Jurays'
WHERE INT_StrainID = 1


*/
NEED TO ADD ENTRIES FOR RED ABCD and BLACK AB not just the single colors...
UPDATE transKey_base_Strain
SET MasculineStrainName = 'Abbeyan Umm Jurays'
, FeminineStrainName = 'Abbeyah Umm Jurays'
WHERE INT_StrainID = 4

select *
FROM transKey_base_Strain








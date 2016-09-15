create database video
go
use video
go


CREATE TABLE [Genres](
	[GenreNr] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [Films](
	[BandNr] [int] IDENTITY(1,1) NOT NULL,
	[Titel] [nchar](50) NOT NULL,
	[GenreNr] [int] NOT NULL constraint fk_GenreNr foreign key references Genres(GenreNr),
	[InVoorraad] [int] NOT NULL,
	[UitVoorraad] [int] NOT NULL,
	[Prijs] [money] NOT NULL,
	[TotaalVerhuurd] [int] NOT NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[BandNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [Klanten](
	[KlantNr] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [varchar](50) NOT NULL,
	[Voornaam] [varchar](50) NOT NULL,
	[Straat_Nr] [varchar](50) NOT NULL,
	[PostCode] [int] NOT NULL,
	[Gemeente] [varchar](50) NOT NULL,
	[KlantStat] [varchar](50) NOT NULL,
	[HuurAantal] [int] NOT NULL,
	[DatumLid] [date] NOT NULL,
	[Lidgeld] [bit] NOT NULL,
 CONSTRAINT [PK_Klanten] PRIMARY KEY CLUSTERED 
(
	[KlantNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [Verhuur](
	[KlantNr] [int] NOT NULL constraint fk_KlantNr foreign key references Klanten(KlantNr),
	[BandNr] [int] NOT NULL constraint fk_BandNr foreign key references Films(BandNr),
	[VerhuurDatum] [date] NOT NULL
) ON [PRIMARY]

GO


SET IDENTITY_INSERT [Genres] ON
GO

--
-- Dumping data for table 'Genres'
--

INSERT  [Genres] ([GenreNr], [Genre]) VALUES (1, N'AKTIE')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (2, N'AVONTUUR')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (3, N'WESTERN')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (4, N'EROTIEK')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (5, N'HORROR')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (6, N'HUMOR')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (7, N'KINDERFILM')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (8, N'OORLOG')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (9, N'PIRATENFILM')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (10, N'SCIENCE FICTION')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (11, N'SENTIMENTEEL')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (12, N'FANTASY')
INSERT  [Genres] ([GenreNr], [Genre]) VALUES (13, N'THRILLER')
-- 13 records

SET IDENTITY_INSERT [Genres] OFF
GO

SET IDENTITY_INSERT [Klanten] ON
GO

--
-- Dumping data for table 'Klanten'
--

INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (1, N'HEIREMANS', N'MARC', N'KOEKELBERGSTRAAT 32', 9330, N'DENDERMONDE', N'1', 34, '2010-11-19', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (2, N'GOESSENS', N'VERONIQUE', N'DIEPEWEG 1', 9000, N'GENT', N'2', 234, '1998-12-05', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (3, N'VAN DELSEN', N'GUY', N'KOUTERSTRAAT 10', 9263, N'BAVEGEM', N'1', 142, '2001-01-12', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (4, N'VAN DEN BERGHE', N'EDUARD', N'MELKERIJSTRAAT 34', 8900, N'IEPER', N'1', 134, '1999-06-19', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (5, N'VAN DEN BOSCHE', N'PATRICK', N'HEIRBAAN 34', 9311, N'IMPE', N'1', 125, '2000-01-12', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (6, N'VERBIEST', N'ANNIE', N'DORPSSTRAAT 35', 9000, N'GENT', N'1', 187, '2010-05-12', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (7, N'BOELENS', N'DANNY', N'GRAVENSTRAAT 23', 9402, N'MEERBEKE', N'2', 231, '2007-01-11', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (8, N'VERPOEST', N'EDDY', N'BEUKENSTRAAT 456', 9300, N'AALST', N'1', 27, '2011-01-16', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (9, N'VERPLANCKEN', N'JOHAN', N'KEMPELAND 3', 9200, N'WETTEREN', N'1', 198, '2005-02-14', 0)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (10, N'MEERT', N'EDDY', N'OOSTHOEK 23', 9230, N'MELLE', N'1', 148, '2008-09-16', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (11, N'BOELENS', N'FREDDY', N'KOEKOEKSTRAAT 2', 9000, N'GENT', N'2', 231, '1997-10-11', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (12, N'DE CLERQ', N'RITA', N'MOLENSTRAAT 23', 9140, N'ZELE', N'1', 158, '2010-08-15', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (13, N'DE CONINCK', N'MARTINE', N'STATIONSTRAAT 23', 9402, N'MEERBEKE', N'2', 285, '2004-12-14', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (14, N'COUSAERT', N'FRANKY', N'STATIONSTRAAT 234', 9300, N'AALST', N'2', 234, '2008-01-15', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (15, N'DE CONINCK', N'MARTINE', N'VOGELZANG 34', 9000, N'GENT', N'1', 177, '2010-03-16', 0)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (16, N'LOREZ', N'MARC', N'BEVERHOEKSTRAAT 23', 9200, N'WETTEREN', N'1', 129, '2007-02-14', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (17, N'HEYMAN', N'EDDY', N'DEINZESTEENWEG 2', 9010, N'GENTBRUGGE', N'2', 241, '2010-07-21', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (18, N'HUYSMAN', N'HENNY', N'HUISEPONTWEG 3', 9300, N'AALST', N'2', 284, '2009-08-15', 0)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (19, N'GEVAERT', N'AN', N'WORTEGEMSTRAAT 3', 1890, N'OPWIJK', N'2', 239, '2010-02-16', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (20, N'NIJS', N'JENNY', N'LINDESTRAAT 23', 9200, N'WETTEREN', N'2', 211, '2009-11-16', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (21, N'COPPENS', N'ROBIN', N'DORP 6', 9411, N'ERONDEGEM', N'2', 277, '2010-04-19', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (22, N'GYSELS', N'ROGER', N'KASTEELDREEF 45', 9000, N'GENT', N'2', 261, '2008-03-17', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (23, N'JANSSENS', N'DANNY', N'BLIKSTRAAT 21', 9370, N'LEBBEKE', N'2', 313, '2009-12-16', 0)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (24, N'GOEMAN', N'PHILIPPE', N'EIKELSTRAAT 345', 9160, N'HAMME', N'2', 217, '2010-08-17', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (25, N'VAN DE SOMPEL', N'GUIDO', N'VOERMANSTRAAT 45', 9170, N'WAASMUNSTER', N'2', 155, '2011-12-04', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (26, N'VAN DE POELE', N'WILLY', N'STATIONSTRAAT 11', 9000, N'GENT', N'1', 133, '2011-04-04', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (27, N'MATTHIJS', N'RUDY', N'STICHELDREEF 37', 9140, N'ZELE', N'1', 184, '2009-01-12', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (28, N'LEFEVER', N'ANNELIES', N'LIJSTERSTRAAT 2', 9290, N'BERLARE', N'2', 311, '2007-11-01', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (29, N'LENAERDS', N'JACKY', N'DRAGONDERWEGEL 23', 9281, N'OVERMERE', N'2', 273, '2010-05-12', -1)
INSERT  [Klanten] ([KlantNr], [Naam], [Voornaam], [Straat_Nr], [PostCode], [Gemeente], [Klantstat], [HuurAantal], [DatumLid], [Lidgeld]) VALUES (30, N'LAMPENS', N'LYDIA', N'DRAPSTRAAT 45', 9282, N'UITBERGEN', N'2', 276, '2011-09-03', 0)
-- 30 records

SET IDENTITY_INSERT [Klanten] OFF
GO

CREATE INDEX [DATUMLID] ON [Klanten] ([DatumLid])
GO

CREATE INDEX [POSTCODE] ON [Klanten] ([PostCode])
GO




SET IDENTITY_INSERT [Films] ON
GO

--
-- Dumping data for table 'Films'
--

INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (1, N'RAIDERS OF THE LOST ARK', 2, 3, 3, 3, 213)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (2, N'E T', 10, 3, 1, 3.5, 211)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (3, N'LOVE STORY', 11, 1, 1, 4, 234)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (4, N'TWO MOON JUNCTION', 4, 8, 3, 3, 14)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (5, N'POLICE ACADEMY', 6, 3, 2, 2, 346)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (6, N'ONCE UPON A TIME IN THE WEST', 3, 2, 2, 2, 142)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (7, N'TRON', 10, 3, 3, 2.5, 523)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (8, N'DE SNORKELS', 7, 2, 2, 1, 243)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (9, N'ZORRO', 1, 2, 1, 1.5, 387)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (10, N'HECTOR', 6, 2, 2, 1, 23)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (11, N'HIGH NOON', 3, 4, 1, 2, 125)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (12, N'PIRATES OF THE CARRIBEAN', 9, 2, 1, 2.5, 32)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (13, N'SAVING PRIVATE RYAN', 8, 3, 3, 2, 387)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (14, N'THE DEER HUNTER', 1, 9, 3, 1.4, 24)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (15, N'THE GODS MUST BE CRAZY', 6, 6, 6, 2, 22)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (16, N'FRIDAY THE 13TH', 5, 4, 1, 2, 21)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (17, N'THE BIRDS', 13, 4, 2, 2, 285)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (18, N'THE HOBBIT', 12, 4, 1, 3.5, 1)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (19, N'BATMAN', 1, 12, 6, 3, 21)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (20, N'ERAGON', 12, 6, 5, 2, 5)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (21, N'TERMS OF ENDEARMENT', 11, 8, 6, 1, 24)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (22, N'EMANUELLE', 4, 4, 1, 2, 355)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (23, N'KRAMER VS KRAMER', 11, 1, 1, 1.5, 156)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (24, N'STAR WARS', 10, 5, 4, 2, 1)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (25, N'EL GRINGO', 3, 5, 1, 1, 44)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (26, N'THE GRADUATE', 11, 3, 1, 1.5, 346)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (27, N'THE HANGOVER', 6, 6, 2, 2, 12)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (28, N'THE OMEN', 5, 5, 2, 1.5, 411)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (29, N'SEX,LIES AND VIDEOTAPES', 4, 6, 2, 1.5, 12)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (30, N'THE ABYSS', 10, 7, 3, 2, 33)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (31, N'DE SMURFEN', 7, 6, 4, 1, 12)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (32, N'FIRST BLOOD', 1, 3, 2, 2, 200)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (33, N'THE LORD OF THE RINGS', 12, 5, 1, 3, 12)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (34, N'DE LANGSTE DAG', 8, 3, 2, 1.75, 55)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (35, N'THE GUNS OF NAVARONE', 8, 2, 1, 1, 234)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (36, N'CISKE DE RAT', 7, 6, 2, 1.5, 2)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (37, N'THE REVENGE OF JAWS', 2, 6, 3, 2, 11)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (38, N'SHUTTER ISLAND', 13, 3, 1, 2, 3)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (39, N'JURASSIC PARK', 10, 5, 2, 3, 22)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (40, N'THE EXORCIST', 5, 2, 2, 1.5, 123)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (41, N'DOORNROOSJE', 7, 5, 2, 1, 2)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (42, N'TRUE GRITT', 3, 5, 2, 2, 11)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (43, N'PROMETHEUS', 10, 5, 1, 3, 13)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (44, N'SHREK', 7, 4, 2, 2, 4)
INSERT  [Films] ([BandNr], [Titel], [GenreNr], [InVoorraad], [UitVoorraad], [Prijs], [TotaalVerhuurd]) VALUES (45, N'LICENCE TO KILL', 1, 6, 2, 1.5, 2)
-- 45 records

SET IDENTITY_INSERT [Films] OFF
GO







--
-- Dumping data for table 'Verhuur'
--

INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (1, 16, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (1, 40, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (1, 20, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (1, 21, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (1, 20, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (2, 10, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (2, 41, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (2, 4, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (2, 19, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (2, 34, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (3, 39, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 13, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 17, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 35, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 14, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 27, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 34, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (4, 42, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 15, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 19, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 24, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 32, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 45, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 30, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 37, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 29, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (5, 44, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 10, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 22, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 27, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 30, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 30, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (6, 15, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (7, 5, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (9, 7, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (9, 13, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (9, 19, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (9, 19, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (9, 45, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (11, 1, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (11, 11, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (11, 36, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (12, 36, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (12, 28, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (12, 19, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (12, 32, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (13, 14, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (13, 21, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (13, 37, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 6, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 15, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 33, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 24, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 41, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 5, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 13, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (14, 15, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (15, 25, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (15, 8, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (15, 12, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (15, 31, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (15, 21, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (16, 18, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (16, 21, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (16, 1, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (16, 28, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (16, 40, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (17, 14, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (17, 31, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (17, 42, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (18, 29, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (18, 20, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (18, 7, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (18, 9, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (19, 38, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (23, 21, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (23, 31, '2013-02-07')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (24, 19, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (25, 2, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (25, 20, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (25, 1, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (26, 20, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (27, 44, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (27, 26, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (28, 3, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (28, 7, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (28, 6, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (28, 17, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (28, 31, '2013-02-08')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (29, 23, '2013-02-06')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (30, 24, '2013-02-05')
INSERT  [Verhuur] ([KlantNr], [BandNr], [VerhuurDatum]) VALUES (30, 21, '2013-02-08')
-- 92 records



CREATE INDEX [BANDNR] ON [Verhuur] ([BandNr])
GO

CREATE INDEX [KlantNr] ON [Verhuur] ([KlantNr])
GO









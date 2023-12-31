USE [HaberPortali]
GO
/****** Object:  Table [dbo].[Adminler]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminler](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [nvarchar](50) NULL,
	[Gorevi] [nvarchar](50) NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adminler] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anketler]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anketler](
	[AnketId] [int] IDENTITY(1,1) NOT NULL,
	[Soru] [nvarchar](max) NULL,
	[Secenek1] [nvarchar](max) NULL,
	[Secenek2] [nvarchar](max) NULL,
	[Secenek3] [nvarchar](max) NULL,
	[Secenek4] [nvarchar](max) NULL,
	[Secenek1Oy] [int] NULL,
	[Secenek2Oy] [int] NULL,
	[Secenek3Oy] [int] NULL,
	[Secenek4Oy] [int] NULL,
	[ToplamOy] [int] NULL,
 CONSTRAINT [PK_Anketler] PRIMARY KEY CLUSTERED 
(
	[AnketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ayarlar]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ayarlar](
	[Title] [nvarchar](max) NULL,
	[HaberSayisi] [int] NULL,
	[GmailHesap] [nvarchar](200) NULL,
	[GmailSifre] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotoGaleri]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotoGaleri](
	[GaleriId] [int] IDENTITY(1,1) NOT NULL,
	[ResimAdi] [nvarchar](200) NULL,
	[ResimAciklamasi] [nvarchar](max) NULL,
	[ResimYolu] [nvarchar](50) NULL,
 CONSTRAINT [PK_FotoGaleri] PRIMARY KEY CLUSTERED 
(
	[GaleriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Haberler]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Haberler](
	[HaberId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [int] NULL,
	[Baslik] [nvarchar](max) NULL,
	[Ozet] [nvarchar](max) NULL,
	[Detay] [nvarchar](max) NULL,
	[Resmi] [nvarchar](max) NULL,
	[EklenmeTarihi] [nvarchar](50) NULL,
	[Onay] [int] NULL,
	[Vitrin] [int] NULL,
	[Hit] [int] NULL,
 CONSTRAINT [PK_Haberler] PRIMARY KEY CLUSTERED 
(
	[HaberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](100) NULL,
	[Sira] [int] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[YazarId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [int] NULL,
	[KullaniciAdi] [nvarchar](max) NULL,
	[Sifre] [nvarchar](max) NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Resmi] [nvarchar](50) NULL,
	[Ozgecmis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[YazarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazilar]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazilar](
	[YaziId] [int] IDENTITY(1,1) NOT NULL,
	[YazarId] [int] NULL,
	[Baslik] [nvarchar](max) NULL,
	[Detay] [nvarchar](max) NULL,
	[Tarih] [nvarchar](50) NULL,
	[Onay] [int] NULL,
	[Hit] [int] NULL,
 CONSTRAINT [PK_Yazilar] PRIMARY KEY CLUSTERED 
(
	[YaziId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[HaberId] [int] NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Yorumu] [nvarchar](max) NULL,
	[Tarih] [nvarchar](50) NULL,
	[Onay] [int] NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anketler] ADD  CONSTRAINT [DF_Anketler_SecenekOy1]  DEFAULT ((0)) FOR [Secenek1Oy]
GO
ALTER TABLE [dbo].[Anketler] ADD  CONSTRAINT [DF_Anketler_SecenekOy2]  DEFAULT ((0)) FOR [Secenek2Oy]
GO
ALTER TABLE [dbo].[Anketler] ADD  CONSTRAINT [DF_Anketler_SecenekOy3]  DEFAULT ((0)) FOR [Secenek3Oy]
GO
ALTER TABLE [dbo].[Anketler] ADD  CONSTRAINT [DF_Anketler_SecenekOy4]  DEFAULT ((0)) FOR [Secenek4Oy]
GO
ALTER TABLE [dbo].[Anketler] ADD  CONSTRAINT [DF_Anketler_ToplamOy]  DEFAULT ((0)) FOR [ToplamOy]
GO
ALTER TABLE [dbo].[Ayarlar] ADD  CONSTRAINT [DF_Ayarlar_HaberSayisi]  DEFAULT ((10)) FOR [HaberSayisi]
GO
ALTER TABLE [dbo].[Haberler] ADD  CONSTRAINT [DF_Haberler_Onay]  DEFAULT ((1)) FOR [Onay]
GO
ALTER TABLE [dbo].[Haberler] ADD  CONSTRAINT [DF_Haberler_Vitrin]  DEFAULT ((0)) FOR [Vitrin]
GO
ALTER TABLE [dbo].[Haberler] ADD  CONSTRAINT [DF_Haberler_Hit]  DEFAULT ((1)) FOR [Hit]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Sira]  DEFAULT ((1)) FOR [Sira]
GO
ALTER TABLE [dbo].[Yazilar] ADD  CONSTRAINT [DF_Yazilar_Onay]  DEFAULT ((1)) FOR [Onay]
GO
ALTER TABLE [dbo].[Yazilar] ADD  CONSTRAINT [DF_Yazilar_Hit]  DEFAULT ((1)) FOR [Hit]
GO
ALTER TABLE [dbo].[Yorumlar] ADD  CONSTRAINT [DF_Yorumlar_Onay]  DEFAULT ((0)) FOR [Onay]
GO
/****** Object:  StoredProcedure [dbo].[sp_HaberEkle]    Script Date: 2.12.2023 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_HaberEkle]
	-- Add the parameters for the stored procedure here
	@KategoriId int,
	@Baslik nvarchar(max),
	@Ozet nvarchar(max),
	@Detay nvarchar(max),
	@Resmi nvarchar(50),
	@EklenmeTarihi nvarchar(50),
	@Onay int,
	@Vitrin int,
	@Hit int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Haberler(KategoriId,Baslik,Ozet,Detay,Resmi,EklenmeTarihi,Onay,Vitrin,Hit) 
	values(@KategoriId,@Baslik,@Ozet,@Detay,@Resmi,@EklenmeTarihi,@Onay,@Vitrin,@Hit)
END
GO

USE [juanjo]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 16/02/2019 11:20:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[personal_id] [int] NOT NULL,
	[ap_materno] [varchar](50) NULL,
	[ap_paterno] [varchar](50) NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

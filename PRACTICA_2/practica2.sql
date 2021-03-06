USE [juanjo]
GO
/****** Object:  Table [dbo].[Aguinaldo]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aguinaldo](
	[aguinaldo_id] [int] NOT NULL,
	[valido] [bit] NULL,
	[pago] [money] NULL,
 CONSTRAINT [pk_aguinaldo] PRIMARY KEY CLUSTERED 
(
	[aguinaldo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[Area_id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Personal_id] [int] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bono]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bono](
	[Bono_id] [int] NOT NULL,
	[Bono] [money] NOT NULL,
	[Valido] [bit] NOT NULL,
	[Personal_id] [int] NOT NULL,
 CONSTRAINT [PK_Bono] PRIMARY KEY CLUSTERED 
(
	[Bono_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamento](
	[Departamento_id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[empleado_id] [int] NOT NULL,
	[AreaLaboral]  AS ([empleado_id]+''+[Descripcion]),
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Departamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[Empresa_id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Empresa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Horario_Empleado]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario_Empleado](
	[horario_id] [uniqueidentifier] NOT NULL,
	[empleado_id] [int] NULL,
 CONSTRAINT [pk_horario] PRIMARY KEY CLUSTERED 
(
	[horario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomina](
	[Nomina_id] [int] NOT NULL,
	[PagoEmpleado] [money] NOT NULL,
	[Personal_id] [int] NOT NULL,
	[Bono_id] [int] NOT NULL,
	[TuPaga]  AS ([Personal_id]+''+[PagoEmpleado]),
 CONSTRAINT [PK_Nomina] PRIMARY KEY CLUSTERED 
(
	[Nomina_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[Personal_id] [int] NOT NULL,
	[ApPaterno_p] [varchar](50) NOT NULL,
	[ApMaterno_p] [varchar](50) NOT NULL,
	[Nombre_p] [varchar](50) NOT NULL,
	[Puesto_id] [int] NOT NULL,
	[NombreCompleto]  AS ([Nombre_p]+''+[ApMaterno_p]+''+[ApPaterno_p]),
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Personal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Practicas]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Practicas](
	[Practicas_id] [int] NOT NULL,
	[Personal_id] [int] NOT NULL,
	[Universidad_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Practicas] PRIMARY KEY CLUSTERED 
(
	[Practicas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Puesto](
	[Puesto_id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Nomina_id] [int] NOT NULL,
	[PuestoActivo]  AS ([Descripcion]+''+[Activo]),
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[Puesto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaludEmpleado_id]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaludEmpleado_id](
	[salud_id] [int] NOT NULL,
	[personal_id] [int] NOT NULL,
	[Seguro]  AS ([salud_id]),
 CONSTRAINT [pk_salud] PRIMARY KEY CLUSTERED 
(
	[salud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Empleado_Horario]    Script Date: 23/02/2019 11:47:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Empleado_Horario]
AS
SELECT        dbo.Personal.*, dbo.Departamento.empleado_id, dbo.Area.Descripcion
FROM            dbo.Nomina INNER JOIN
                         dbo.Bono ON dbo.Nomina.Bono_id = dbo.Bono.Bono_id INNER JOIN
                         dbo.Personal ON dbo.Nomina.Personal_id = dbo.Personal.Personal_id INNER JOIN
                         dbo.Practicas ON dbo.Personal.Personal_id = dbo.Practicas.Personal_id INNER JOIN
                         dbo.Puesto ON dbo.Nomina.Nomina_id = dbo.Puesto.Nomina_id INNER JOIN
                         dbo.SaludEmpleado_id ON dbo.Personal.Personal_id = dbo.SaludEmpleado_id.personal_id CROSS JOIN
                         dbo.Departamento CROSS JOIN
                         dbo.Empresa CROSS JOIN
                         dbo.Horario_Empleado CROSS JOIN
                         dbo.Aguinaldo CROSS JOIN
                         dbo.Area

GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Departamento] FOREIGN KEY([Departamento_id])
REFERENCES [dbo].[Departamento] ([Departamento_id])
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Departamento]
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Departamento1] FOREIGN KEY([Departamento_id])
REFERENCES [dbo].[Departamento] ([Departamento_id])
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Departamento1]
GO
ALTER TABLE [dbo].[SaludEmpleado_id]  WITH CHECK ADD FOREIGN KEY([personal_id])
REFERENCES [dbo].[Personal] ([Personal_id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[70] 4[4] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Aguinaldo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 118
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bono"
            Begin Extent = 
               Top = 16
               Left = 514
               Bottom = 145
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departamento"
            Begin Extent = 
               Top = 31
               Left = 698
               Bottom = 143
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Empresa"
            Begin Extent = 
               Top = 6
               Left = 880
               Bottom = 101
               Right = 1050
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Horario_Empleado"
            Begin Extent = 
               Top = 170
               Left = 856
               Bottom = 265
               Right = 1026
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Nomina"
            Begin Extent = 
               Top = 310
               Left = 54
               Bottom = 439
               Right = 224
            End
            DisplayFlags ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Empleado_Horario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 280
            TopColumn = 0
         End
         Begin Table = "Personal"
            Begin Extent = 
               Top = 150
               Left = 85
               Bottom = 279
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Practicas"
            Begin Extent = 
               Top = 146
               Left = 531
               Bottom = 258
               Right = 701
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Puesto"
            Begin Extent = 
               Top = 292
               Left = 473
               Bottom = 421
               Right = 643
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SaludEmpleado_id"
            Begin Extent = 
               Top = 286
               Left = 867
               Bottom = 398
               Right = 1037
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1770
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Empleado_Horario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Empleado_Horario'
GO

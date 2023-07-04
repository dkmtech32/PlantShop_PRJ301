USE [MyPlantShop]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/7/2023 4:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO

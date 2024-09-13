IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'NAD')
BEGIN
  CREATE DATABASE NAD
END
GO
--==================================================================================================================
USE [NAD]
GO
--==================================================================================================================
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'User' AND  TABLE_NAME = 'User')
BEGIN
	CREATE TABLE [User]
	(
		ID uniqueidentifier not null,
		Email nvarchar(255) not null,
		FirstName nvarchar(255) not null,
		LastName nvarchar(255) not null,
		[Password] varchar(255) not null,
		[Status] int not null,
		CreateDateTime datetime,
		Creator uniqueidentifier,
		LastChangeDateTime datetime,
		LastChangeUser uniqueidentifier,

		constraint PK_User primary key (Email)
	)
END
GO
--==================================================================================================================
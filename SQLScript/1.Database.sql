IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'NAD')
BEGIN
  CREATE DATABASE NAD
END
GO
--==================================================================================================================
USE [NAD]
GO
--==================================================================================================================
--DROP TABLE [User]
--DROP TABLE [Role]
--GO
--==================================================================================================================
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Role' AND  TABLE_NAME = 'Role')
BEGIN
	CREATE TABLE [Role]
	(
		ID uniqueidentifier not null,
		[Name] nvarchar(255) not null,
		[Description] nvarchar(max) not null,
		[Status] int not null, -- 0. Delete, 1. Available
		CreateDateTime datetime default getdate(),
		Creator uniqueidentifier,
		LastChangeDateTime datetime default getdate(),
		LastChangeUser uniqueidentifier,

		CONSTRAINT PK_Role PRIMARY KEY (ID)
	)
END
GO
--==================================================================================================================
INSERT INTO [Role] (ID, [Name], [Description], [Status])
VALUES (NEWID(), 'TRG', 'TRG Admin', 1)
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
		[Password] varchar(255) null,
		RoleID uniqueidentifier not null,
		[Status] int not null, -- 0. Lock, 1. Available
		CreateDateTime datetime default getdate(),
		Creator uniqueidentifier,
		LastChangeDateTime datetime default getdate(),
		LastChangeUser uniqueidentifier,

		CONSTRAINT PK_User PRIMARY KEY (Email),
		CONSTRAINT FK_User_Role FOREIGN KEY(RoleID) REFERENCES [Role] (ID)
	)
END
GO
--==================================================================================================================
DECLARE @RoleID uniqueidentifier
SELECT @RoleID = ID FROM [Role] WHERE [Name] = 'TRG'

INSERT INTO [User] (ID, Email, FirstName, LastName, [Password], RoleID, [Status])
VALUES (NEWID(), 'sdoninforsaas@trginternational.com', 'SD', 'TRG', null, @RoleID, 1)
GO
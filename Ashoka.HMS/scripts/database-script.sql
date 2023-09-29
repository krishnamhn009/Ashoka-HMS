/****** Object:  Database [KD-HMS]    Script Date: 30-09-2023 00:04:49 ******/
CREATE DATABASE [KD-HMS]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [KD-HMS] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [KD-HMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KD-HMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KD-HMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KD-HMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KD-HMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [KD-HMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KD-HMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KD-HMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KD-HMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KD-HMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KD-HMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KD-HMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KD-HMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KD-HMS] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [KD-HMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KD-HMS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KD-HMS] SET  MULTI_USER 
GO
ALTER DATABASE [KD-HMS] SET ENCRYPTION ON
GO
ALTER DATABASE [KD-HMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [KD-HMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Schema [HMS]    Script Date: 30-09-2023 00:04:49 ******/
CREATE SCHEMA [HMS]
GO
/****** Object:  Table [HMS].[Bed_Master]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Bed_Master](
	[BedId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[IsOccupied] [bit] NOT NULL,
	[BedType] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BedId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HMS].[Res_Hall_Master]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Res_Hall_Master](
	[ResHallId] [int] IDENTITY(1,1) NOT NULL,
	[ResHallName] [varchar](100) NULL,
	[OccupantType] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResHallId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HMS].[Room_Master]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Room_Master](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[ResHallId] [int] NULL,
	[RoomNo] [int] NULL,
	[Shared] [int] NULL,
	[RoomType] [int] NULL,
	[ISOCCUPIED] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HMS].[Student]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[EmailId] [varchar](100) NOT NULL,
	[Gender] [varchar](8) NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HMS].[Student_ResHall_Pref]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Student_ResHall_Pref](
	[StudentPrefId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[PrefType] [varchar](100) NULL,
	[PrefTypeValue] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentPrefId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HMS].[Student_Resident_Allocation]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HMS].[Student_Resident_Allocation](
	[StudentResidentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[RoomId] [int] NULL,
	[BedId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentResidentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HMS].[Bed_Master] ADD  DEFAULT ((0)) FOR [IsOccupied]
GO
ALTER TABLE [HMS].[Bed_Master] ADD  DEFAULT ('L') FOR [BedType]
GO
ALTER TABLE [HMS].[Res_Hall_Master] ADD  DEFAULT (NULL) FOR [OccupantType]
GO
ALTER TABLE [HMS].[Room_Master] ADD  DEFAULT ((0)) FOR [ISOCCUPIED]
GO
ALTER TABLE [HMS].[Student] ADD  DEFAULT ('NA') FOR [Name]
GO
/****** Object:  StoredProcedure [HMS].[usp_AllocateStudentResident]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec HMS.[usp_AllocateStudentResident] 30

--[HMS].[usp_GetAllAllocateStudentResident]

CREATE     PROCEDURE [HMS].[usp_AllocateStudentResident] 
(
	 @studentId				INT,
	 @pref_RoomMateId		INT			=NULL,
	 @pref_Gender			VARCHAR(7)	=NULL,
	 @pref_EmailAddress		VARCHAR(50)	=NULL,
	 @pref_RoomType			TINYINT		=NULL--->Access = 0,Non-Access = 1
	
)
AS
BEGIN

	DECLARE @tempresult    TABLE 
	(
		studentId INT,
		roomId    INT, 
		bedId     INT
	);
	DECLARE @preRoomMateId TABLE (studentId INT);


	--Check Preference 1(@pref_RoomMateId)
	DROP TABLE IF EXISTS #TempPreference1
	SELECT AllC.RoomId
		  ,AllC.BedId
		  ,AllC.StudentId				AS PreferredRoomMateId
		  ,BM.BedId						AS VacantBedId
		  ,CASE WHEN RM.IsOccupied = 2 
				THEN 'NotAvailable'
				ELSE 'Available'
				END						AS AvailabilityStatus
	INTO #TempPreference1
	FROM HMS.Student_Resident_Allocation  AllC
	INNER JOIN hms.room_master RM 
	ON AllC.RoomId = RM.RoomId
	INNER JOIN HMS.Bed_Master BM
	ON BM.RoomId = RM.RoomId
	WHERE AllC.StudentId = @pref_RoomMateId
	AND ISNULL(RM.IsOccupied,0) <2
	AND ISNULL(BM.IsOccupied,0) = 0
	AND RM.[Shared] = 1


	--Preference: 1
	IF EXISTS(SELECT 1 FROM #TempPreference1)
	BEGIN
		INSERT INTO HMS.Student_Resident_Allocation  
		(
			 studentid
			,roomid
			,bedid
		) 
		OUTPUT inserted.studentid
			  ,inserted.roomid
			  ,inserted.bedid 
		INTO @tempresult
		SELECT  @studentId			AS StudentId
			   ,RoomId	            AS RoomId
			   ,VacantBedId		    AS bedid
		FROM #TempPreference1 T1

		INSERT INTO [HMS].[Student_ResHall_Pref]
        (
			[StudentId]
           ,[PrefType]
           ,[PrefTypeValue]
		 )
		 VALUES
         (
			@studentId
           ,'RoomMateStudentId'
           ,@pref_RoomMateId
		 )

	END
	ELSE 
	BEGIN
		DROP TABLE IF EXISTS #TempPreference2
		SELECT TOP 1
				@studentId			AS StudentId
			   ,RM.RoomId	        AS RoomId
			   ,BM.BedId		    AS VacantBedId
		INTO #TempPreference2
		FROM [HMS].[Student] Std 
		INNER JOIN HMS.Student_Resident_Allocation RA
		ON Std.StudentId = RA.RoomId
		INNER JOIN hms.room_master RM 
		ON RA.RoomId = RM.RoomId
		INNER JOIN HMS.Bed_Master BM
		ON BM.RoomId = RM.RoomId
		WHERE Std.[Gender] = @pref_Gender
		AND ISNULL(RM.IsOccupied,0) < 2
		AND ISNULL(BM.IsOccupied,0) = 0
		AND RM.[Shared]   = 1

		--Second Preference
		IF EXISTS(SELECT 1 FROM #TempPreference2)
		BEGIN
			INSERT INTO HMS.Student_Resident_Allocation  
			(
				 studentid
				,roomid
				,bedid
			) 
			OUTPUT inserted.studentid
				  ,inserted.roomid
				  ,inserted.bedid 
			INTO @tempresult
			SELECT  @studentId			AS StudentId
				   ,RoomId	            AS RoomId
				   ,VacantBedId		    AS bedid
			FROM #TempPreference2 T2

			INSERT INTO [HMS].[Student_ResHall_Pref]
			(
				[StudentId]
			   ,[PrefType]
			   ,[PrefTypeValue]
			 )
			 VALUES
			 (
				@studentId
			   ,'Gender'
			   ,@pref_Gender
			 )
		END
		ELSE 
		BEGIN
				--Third Preference
				DROP TABLE IF EXISTS #TempPreference3
				SELECT TOP 1
						@studentId			AS StudentId
					   ,RM.RoomId	        AS RoomId
					   ,BM.BedId		    AS VacantBedId
				INTO #TempPreference3
				FROM [HMS].[Student] Std 
				INNER JOIN HMS.Student_Resident_Allocation RA
				ON Std.StudentId = RA.RoomId
				INNER JOIN hms.room_master RM 
				ON RA.RoomId = RM.RoomId
				INNER JOIN HMS.Bed_Master BM
				ON BM.RoomId = RM.RoomId
				WHERE Std.[EmailId] = @pref_EmailAddress
				AND ISNULL(RM.IsOccupied,0) < 2
				AND ISNULL(BM.IsOccupied,0) = 0
				AND RM.[Shared] = 1

				IF EXISTS(SELECT 1 FROM #TempPreference3)
				BEGIN
					INSERT INTO HMS.Student_Resident_Allocation  
					(
						 studentid
						,roomid
						,bedid
					) 
					OUTPUT inserted.studentid
						  ,inserted.roomid
						  ,inserted.bedid 
					INTO @tempresult
					SELECT  @studentId			AS StudentId
						   ,RoomId	            AS RoomId
						   ,VacantBedId		    AS bedid
					FROM #TempPreference3 T3

					INSERT INTO [HMS].[Student_ResHall_Pref]
					(
						[StudentId]
					   ,[PrefType]
					   ,[PrefTypeValue]
					 )
					 VALUES
					 (
						@studentId
					   ,'EmailAddress'
					   ,@pref_EmailAddress
					 )
				END
				ELSE
				BEGIN
						--Fourth Preference
						DROP TABLE IF EXISTS #TempPreference4
						SELECT TOP 1
								@studentId			AS StudentId
							   ,RM.RoomId	        AS RoomId
							   ,BM.BedId		    AS VacantBedId
						INTO #TempPreference4
						FROM hms.room_master RM 
						INNER JOIN HMS.Bed_Master BM
						ON BM.RoomId = RM.RoomId
						WHERE RM.RoomType = @pref_RoomType
						AND ISNULL(RM.IsOccupied,0) < 2
						AND ISNULL(BM.IsOccupied,0) = 0

						IF EXISTS(SELECT 1 FROM #TempPreference4)
						BEGIN
							INSERT INTO HMS.Student_Resident_Allocation  
							(
								 studentid
								,roomid
								,bedid
							) 
							OUTPUT inserted.studentid
								  ,inserted.roomid
								  ,inserted.bedid 
							INTO @tempresult
							SELECT  @studentId			AS StudentId
								   ,RoomId	            AS RoomId
								   ,VacantBedId		    AS bedid
							FROM #TempPreference4 T4

							INSERT INTO [HMS].[Student_ResHall_Pref]
							(
								[StudentId]
							   ,[PrefType]
							   ,[PrefTypeValue]
							 )
							 VALUES
							 (
								@studentId
							   ,'RoomType'
							   ,@pref_RoomType
							 )
						END
						ELSE
						BEGIN
							 --No Preference(Same Geneder Will Default Check)
							DROP TABLE IF EXISTS #TempNoPreference
							SELECT TOP 1
									@studentId			AS StudentId
								   ,RM.RoomId	        AS RoomId
								   ,BM.BedId		    AS VacantBedId
							INTO #TempNoPreference
							FROM hms.room_master RM 
							INNER JOIN HMS.Bed_Master BM
							ON BM.RoomId = RM.RoomId
							INNER JOIN [HMS].[Res_Hall_Master] HM
							ON HM.ResHallId = RM.ResHallId
							WHERE ISNULL(RM.IsOccupied,0) < 2
							AND   ISNULL(BM.IsOccupied,0) = 0
							AND   HM.OccupantType = (SELECT [Gender] FROM HMS.Student WHERE StudentId = @studentId)

							INSERT INTO HMS.Student_Resident_Allocation  
							(
								 studentid
								,roomid
								,bedid
							) 
							OUTPUT inserted.studentid
								  ,inserted.roomid
								  ,inserted.bedid 
							INTO @tempresult
							SELECT  @studentId			AS StudentId
								   ,RoomId	            AS RoomId
								   ,VacantBedId		    AS bedid
							FROM #TempNoPreference T4

							INSERT INTO [HMS].[Student_ResHall_Pref]
							(
								[StudentId]
							   ,[PrefType]
							   ,[PrefTypeValue]
							 )
							 VALUES
							 (
								@studentId
							   ,'NoPreference'
							   ,'NoPreferenceValue'
							 )
						END

				END
		END
	END

	UPDATE  rm 
	SET rm.isoccupied = rm.isoccupied+1
	FROM hms.room_master rm 
	INNER JOIN @tempresult t
	ON rm.roomid=t.roomid;

	update  bm 
	SET bm.isoccupied=1
	FROM hms.bed_master bm 
	INNER JOIN @tempresult t
	ON bm.bedId=t.bedId;

	SELECT   t.StudentId						AS StudentId
			,sra.studentid						AS RoomMateId
			,rhm.ResHallName					AS ResHallName
	        ,rm.RoomNo							AS RoomNo
	        ,CONCAT(rm.RoomNo,'-',b1.BedType)   AS Bed1
			,NULL   AS Bed2
	FROM @tempresult t 
	INNER JOIN   HMS.Student_Resident_Allocation sra  
	ON (t.roomid=sra.roomid and t.studentid!=sra.studentid)
	INNER JOIN hms.room_master rm 
	ON sra.roomid=rm.roomid
	INNER JOIN HMS.Res_Hall_Master rhm 
	ON rm.ResHallId=rhm.ResHallId
	INNER JOIN  hms.bed_master b1 
	ON  b1.BedId=t.bedId and b1.RoomId=t.roomId ;
END
GO
/****** Object:  StoredProcedure [HMS].[usp_AllocateStudentResident_VSK]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec HMS.[usp_AllocateStudentResident] 1

CREATE     PROCEDURE [HMS].[usp_AllocateStudentResident_VSK] 
(
	 @studentId				INT,
	 @pref_RoomMateId		INT			=NULL,
	 @pref_Gender			VARCHAR(7)	=NULL,
	 @pref_EmailAddress		VARCHAR(50)	=NULL,
	 @pref_RoomType			TINYINT		=NULL--->Access = 0,Non-Access = 1
	
)
AS
BEGIN

	DECLARE @tempresult    TABLE 
	(
		studentId INT,
		roomId    INT, 
		bedId     INT
	);
	DECLARE @preRoomMateId TABLE (studentId INT);


	--Check Preference 1(@pref_RoomMateId)
	DROP TABLE IF EXISTS #TempPreference1
	SELECT AllC.RoomId
		  ,AllC.BedId
		  ,AllC.StudentId				AS PreferredRoomMateId
		  ,BM.BedId						AS VacantBedId
		  ,CASE WHEN RM.IsOccupied = 2 
				THEN 'NotAvailable'
				ELSE 'Available'
				END						AS AvailabilityStatus
	INTO #TempPreference1
	FROM HMS.Student_Resident_Allocation  AllC
	INNER JOIN hms.room_master RM 
	ON AllC.RoomId = RM.RoomId
	INNER JOIN HMS.Bed_Master BM
	ON BM.RoomId = RM.RoomId
	WHERE AllC.StudentId = @pref_RoomMateId
	AND ISNULL(RM.IsOccupied,0) <2
	AND ISNULL(BM.IsOccupied,0) = 0
	AND RM.[Shared] = 1


	--Preference: 1
	IF EXISTS(SELECT 1 FROM #TempPreference1)
	BEGIN
		INSERT INTO HMS.Student_Resident_Allocation  
		(
			 studentid
			,roomid
			,bedid
		) 
		OUTPUT inserted.studentid
			  ,inserted.roomid
			  ,inserted.bedid 
		INTO @tempresult
		SELECT  @studentId			AS StudentId
			   ,RoomId	            AS RoomId
			   ,VacantBedId		    AS bedid
		FROM #TempPreference1 T1

		INSERT INTO [HMS].[Student_ResHall_Pref]
        (
			[StudentId]
           ,[PrefType]
           ,[PrefTypeValue]
		 )
		 VALUES
         (
			@studentId
           ,'RoomMateStudentId'
           ,@pref_RoomMateId
		 )

	END
	ELSE 
	BEGIN
		DROP TABLE IF EXISTS #TempPreference2
		SELECT TOP 1
				@studentId			AS StudentId
			   ,RM.RoomId	        AS RoomId
			   ,BM.BedId		    AS VacantBedId
		INTO #TempPreference2
		FROM [HMS].[Student] Std 
		INNER JOIN HMS.Student_Resident_Allocation RA
		ON Std.StudentId = RA.RoomId
		INNER JOIN hms.room_master RM 
		ON RA.RoomId = RM.RoomId
		INNER JOIN HMS.Bed_Master BM
		ON BM.RoomId = RM.RoomId
		WHERE Std.[Gender] = @pref_Gender
		AND ISNULL(RM.IsOccupied,0) < 2
		AND ISNULL(BM.IsOccupied,0) = 0
		AND RM.[Shared]   = 1

		--Second Preference
		IF EXISTS(SELECT 1 FROM #TempPreference2)
		BEGIN
			INSERT INTO HMS.Student_Resident_Allocation  
			(
				 studentid
				,roomid
				,bedid
			) 
			OUTPUT inserted.studentid
				  ,inserted.roomid
				  ,inserted.bedid 
			INTO @tempresult
			SELECT  @studentId			AS StudentId
				   ,RoomId	            AS RoomId
				   ,VacantBedId		    AS bedid
			FROM #TempPreference2 T2

			INSERT INTO [HMS].[Student_ResHall_Pref]
			(
				[StudentId]
			   ,[PrefType]
			   ,[PrefTypeValue]
			 )
			 VALUES
			 (
				@studentId
			   ,'Gender'
			   ,@pref_Gender
			 )
		END
		ELSE 
		BEGIN
				--Third Preference
				DROP TABLE IF EXISTS #TempPreference3
				SELECT TOP 1
						@studentId			AS StudentId
					   ,RM.RoomId	        AS RoomId
					   ,BM.BedId		    AS VacantBedId
				INTO #TempPreference3
				FROM [HMS].[Student] Std 
				INNER JOIN HMS.Student_Resident_Allocation RA
				ON Std.StudentId = RA.RoomId
				INNER JOIN hms.room_master RM 
				ON RA.RoomId = RM.RoomId
				INNER JOIN HMS.Bed_Master BM
				ON BM.RoomId = RM.RoomId
				WHERE Std.[EmailId] = @pref_EmailAddress
				AND ISNULL(RM.IsOccupied,0) < 2
				AND ISNULL(BM.IsOccupied,0) = 0
				AND RM.[Shared] = 1

				IF EXISTS(SELECT 1 FROM #TempPreference3)
				BEGIN
					INSERT INTO HMS.Student_Resident_Allocation  
					(
						 studentid
						,roomid
						,bedid
					) 
					OUTPUT inserted.studentid
						  ,inserted.roomid
						  ,inserted.bedid 
					INTO @tempresult
					SELECT  @studentId			AS StudentId
						   ,RoomId	            AS RoomId
						   ,VacantBedId		    AS bedid
					FROM #TempPreference3 T3

					INSERT INTO [HMS].[Student_ResHall_Pref]
					(
						[StudentId]
					   ,[PrefType]
					   ,[PrefTypeValue]
					 )
					 VALUES
					 (
						@studentId
					   ,'EmailAddress'
					   ,@pref_EmailAddress
					 )
				END
				ELSE
				BEGIN
						--Fourth Preference
						DROP TABLE IF EXISTS #TempPreference4
						SELECT TOP 1
								@studentId			AS StudentId
							   ,RM.RoomId	        AS RoomId
							   ,BM.BedId		    AS VacantBedId
						INTO #TempPreference4
						FROM hms.room_master RM 
						INNER JOIN HMS.Bed_Master BM
						ON BM.RoomId = RM.RoomId
						WHERE RM.RoomType = @pref_RoomType
						AND ISNULL(RM.IsOccupied,0) < 2
						AND ISNULL(BM.IsOccupied,0) = 0

						IF EXISTS(SELECT 1 FROM #TempPreference4)
						BEGIN
							INSERT INTO HMS.Student_Resident_Allocation  
							(
								 studentid
								,roomid
								,bedid
							) 
							OUTPUT inserted.studentid
								  ,inserted.roomid
								  ,inserted.bedid 
							INTO @tempresult
							SELECT  @studentId			AS StudentId
								   ,RoomId	            AS RoomId
								   ,VacantBedId		    AS bedid
							FROM #TempPreference4 T4

							INSERT INTO [HMS].[Student_ResHall_Pref]
							(
								[StudentId]
							   ,[PrefType]
							   ,[PrefTypeValue]
							 )
							 VALUES
							 (
								@studentId
							   ,'RoomType'
							   ,@pref_RoomType
							 )
						END
						ELSE
						BEGIN
							 --No Preference(Same Geneder Will Default Check)
							DROP TABLE IF EXISTS #TempNoPreference
							SELECT TOP 1
									@studentId			AS StudentId
								   ,RM.RoomId	        AS RoomId
								   ,BM.BedId		    AS VacantBedId
							INTO #TempNoPreference
							FROM hms.room_master RM 
							INNER JOIN HMS.Bed_Master BM
							ON BM.RoomId = RM.RoomId
							INNER JOIN [HMS].[Res_Hall_Master] HM
							ON HM.ResHallId = RM.ResHallId
							WHERE ISNULL(RM.IsOccupied,0) < 2
							AND   ISNULL(BM.IsOccupied,0) = 0
							AND   HM.OccupantType = (SELECT [Gender] FROM HMS.Student WHERE StudentId = @studentId)

							INSERT INTO HMS.Student_Resident_Allocation  
							(
								 studentid
								,roomid
								,bedid
							) 
							OUTPUT inserted.studentid
								  ,inserted.roomid
								  ,inserted.bedid 
							INTO @tempresult
							SELECT  @studentId			AS StudentId
								   ,RoomId	            AS RoomId
								   ,VacantBedId		    AS bedid
							FROM #TempNoPreference T4

							INSERT INTO [HMS].[Student_ResHall_Pref]
							(
								[StudentId]
							   ,[PrefType]
							   ,[PrefTypeValue]
							 )
							 VALUES
							 (
								@studentId
							   ,'NoPreference'
							   ,'NoPreferenceValue'
							 )
						END

				END
		END
	END

	UPDATE  rm 
	SET rm.isoccupied = rm.isoccupied+1
	FROM hms.room_master rm 
	INNER JOIN @tempresult t
	ON rm.roomid=t.roomid;

	update  bm 
	SET bm.isoccupied=1
	FROM hms.bed_master bm 
	INNER JOIN @tempresult t
	ON bm.bedId=t.bedId;

	SELECT   t.StudentId						AS StudentId
			,sra.studentid						AS RoomMateId
			,rhm.ResHallName					AS ResHallName
	        ,rm.RoomNo							AS RoomNum
	        ,CONCAT(rm.RoomNo,'-',b1.BedType)   AS BedType 
	FROM @tempresult t 
	INNER JOIN   HMS.Student_Resident_Allocation sra  
	ON (t.roomid=sra.roomid and t.studentid!=sra.studentid)
	INNER JOIN hms.room_master rm 
	ON sra.roomid=rm.roomid
	INNER JOIN HMS.Res_Hall_Master rhm 
	ON rm.ResHallId=rhm.ResHallId
	INNER JOIN  hms.bed_master b1 
	ON  b1.BedId=t.bedId and b1.RoomId=t.roomId ;
END
GO
/****** Object:  StoredProcedure [HMS].[usp_GetAllAllocateStudentResident]    Script Date: 30-09-2023 00:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec HMS.[usp_GetAllAllocateStudentResident]

CREATE   PROCEDURE [HMS].[usp_GetAllAllocateStudentResident] 
AS
BEGIN

 select A.StudentId,A.RoomMateId,A.ResHallName,A.RoomNo,A.Bed1,A.Bed2 from 
 (select   sra.StudentId,
  sra1.studentid as 'RoomMateId',
  rhm.ResHallName,
  rm.RoomNo,
  concat(rm.RoomNo,'-',t1.BedType) as 'Bed1',
  concat(rm.RoomNo,'-',t2.BedType) as 'Bed2'
  , row_number() over (partition by roomNo order by sra.studentid) as rno
  from  HMS.Student_Resident_Allocation sra 
  left join HMS.Student_Resident_Allocation 
  sra1 on sra.studentid<>sra1.studentid 
  and sra.RoomId=sra1.RoomId
  join hms.room_master rm on sra.roomid=rm.roomid
  join HMS.Res_Hall_Master rhm on rm.ResHallId=rhm.ResHallId
  join hms.bed_master t1 on t1.roomId=sra.roomid and t1.BedType='L'
  left join hms.bed_master t2 on t2.roomId=sra1.roomid and t2.BedType='R'
 -- join  ( hms.bed_master t1 
 --inner join hms.bed_master t2 ON t1.roomId = t2.roomID)  on t1.roomId=rm.roomid and  t2.roomId=rm.roomid  
 ) as A
  where A.rno=1;



END
GO
ALTER DATABASE [KD-HMS] SET  READ_WRITE 
GO

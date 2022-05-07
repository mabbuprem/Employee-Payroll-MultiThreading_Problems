USE [payroll_service]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spDeleteEmployee]
(
@EmployeeName VARCHAR(30)
)
AS
BEGIN TRY
DECLARE @EmployeeID INT
SELECT @EmployeeID = EmployeeID FROM EmployeeTable WHERE EmployeeName = @EmployeeName
DELETE FROM PayrollTable WHERE EmployeeSelect = @EmployeeID
DELETE FROM EmployeeDepartmentTable WHERE EmployeeSelect = @EmployeeID
DELETE FROM EmployeeTable WHERE EmployeeName = @EmployeeName
END TRY

BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
ERROR_STATE() AS ErrorState,
ERROR_PROCEDURE() AS ErrorProcedure,
ERROR_LINE() AS ErrorLine,
ERROR_MESSAGE() AS ErrorMessage;
END CATCH

echo run as admin
REM from: https://blogs.msdn.microsoft.com/spike/2012/03/19/sql-server-configuration-manager-gives-invalid-class-0x80041010-when-starting/

cd "C:\Program Files (x86)\Microsoft SQL Server\120\Shared"

mofcomp sqlmgmproviderxpsp2up.mof

pause
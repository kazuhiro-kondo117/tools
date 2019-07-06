if "%~1" == "" (
	echo Usage:%~nx0 [src-dir]
	exit /b 1
)

cd /d "%~1"

set JAVA6_HOME="C:\Program Files\Java\jdk1.6.0_45"
set PATH=%PATH%;%JAVA6_HOME%\bin

cmd /k

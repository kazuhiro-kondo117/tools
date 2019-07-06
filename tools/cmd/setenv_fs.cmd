if "%~1" == "" (
	echo Usage:%~nx0 [target-dir]
	exit /b 1
)

cd /d %~1

set FS_HOME="C:\Program Files (x86)\Microsoft SDKs\F#\4.1\Framework\v4.0"
set PATH=%PATH%;%FS_HOME%

%comspec% /k

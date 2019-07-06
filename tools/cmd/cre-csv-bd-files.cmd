@echo off
	setlocal ENABLEDELAYEDEXPANSION
	if "%~1" == "" (
		echo Usage:%~nx0 [psp-dir]
		exit /b 1
	)
	set vCsvPath=M:\mydata\db\csv\bd_files.csv
	for /f "tokens=1,2,3,4,5" %%a in ('vol %~d1') do (
		if "%%a" == "ドライブ" (
			set vDriveName=%%b
			set vVolName=%%e
		) else if "%%a" == "ボリューム" (
			set vSerNo=%%c
		)
	)
	for /f "tokens=1 delims=," %%i in (%vCsvPath%) do (
		set vId=%%i
	)
	for /r %~d1 %%x in ("*.*") do (
		set /a vId+=1
		echo !vId!,"%%~nxx","%vVolName%","%vSerNo%","%%~dx","%%~px","%%~tx",%%~zx
	) >>%vCsvPath%

	pause

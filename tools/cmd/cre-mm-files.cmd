@echo off
:Begin-Proc
	setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
	call %~dp0profile.cmd
	set vDestFile=%vCsvHome%\mmdata_files.csv

	if "%~1" == "" (
		echo Usage:%~nx0 [drive-letter]
		exit /b 1
	)

	if not exist %~d1 (
		echo �h���C�u������܂���B[drive=%~d1]
		exit /b 2
	)

	set vDriveLetter=%~d1
	set vCmdLine="vol %vDriveLetter%"
	for /f "tokens=1,2,3,5" %%a in ('%vCmdLine%') do (
		if "%%a" == "�h���C�u" (
			set vVolName=%%d
		) else if "%%a" == "�{�����[��" (
			set vVolSerNo=%%c
		)
	)

	set /p vYN=�{�����[�����ύX(%vVolName%)[yes/no]�F
	if /i "%vYN%" == "y" (
		set /p vVolName=�{�����[����:
	)

:Main-Proc
	set vId=
	for /f "skip=1 tokens=*" %%i in (%vDestFile%) do (
		set /a vId+=1
	)
	
	call :CreateCsvFile-Proc>> %vDestFile%
@rem --	call :CreateCsvFile-Proc
	
	pause
	
	goto :eof

:CreateCsvFile-Proc
	for /r %vDriveLetter%\ %%x in ("*.*") do (
		set vFindStr=%%~nxx.*%%~tx
		set vFindStr=%vFindStr:�[=.%
		findstr /c:"!vFindStr!" %vDestFile%> nul
		if !errorlevel! neq 0 (
			set /a vId+=1
			set vFileName=%%~nxx
			echo !vId!,"%vVolName%","%vVolSerNo%","%%~dx","%%~px","!vFileName!","%%~ax","%%~tx","%%~zx"
		)
	)

	goto :eof
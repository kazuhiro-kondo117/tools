@echo off
set cVR_INF=VR_MANGR.IFO
set cVR_BUP=VR_MANGR.BUP

if "%~1" == "" (
	echo Usage:%~nx0 [vr-dir]
	exit /b 1
)

if not "%~nx1" == "DVD_RTAV" (
	echo select directory unmatch [dir=DVD_RTAV]
	exit /b 2
)

if not exist "%~dpnx1\%cVR_INF%" (
	echo file not exist [file=%cVR_INF%]
	exit /b 3
)


ren "%~dpnx1\%cVR_INF%" _%cVR_INF%

copy "%~dpnx1\%cVR_BUP%" "%~dpnx1\%cVR_INF%

pause

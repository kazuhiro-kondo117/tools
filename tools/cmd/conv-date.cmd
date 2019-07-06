@echo off
set /p str=date-time(yyy/mm/dd hh:mm:ss)
set str=%str:^=%
set str=%str:F=%
set str=%str: =%
echo %str%
pause

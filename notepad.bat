@echo off
color 17
title notepad
if NOT EXIST files (
mkdir files
)
cd files

:start
cls
echo 1 for New User
echo 2 for Log In
echo 3 for Delete User
echo 4 for Exit
echo ________________________________________________________________________________
choice /c:1234 /n /t 9999 /d 3
if %errorlevel% == 1 goto newUser
if %errorlevel% == 2 goto logIn
if %errorlevel% == 3 goto deleteUser
if %errorlevel% == 4 exit

:newUser
cls
set /p nu=what will be the username?:
if NOT EXIST %nu%.txt (
echo. > %nu%.txt
echo Done!
pause
goto start
) 
if EXIST %nu%.txt (
echo This username already exists.
pause
goto start
)

:logIn
cls
set /p u=what is your username:
if EXIST %u%.txt (
notepad %u%.txt
echo Edited %u%'s files
pause
goto start
)
if NOT EXIST %u%.txt (
echo This username doesn't exist.
pause
goto start
)

:deleteUser
cls
set /p u=what is your username:
if EXIST %u%.txt (
del %u%.txt
echo Deleted %u%'s notepad
pause
goto start
)
if NOT EXIST %u%.txt (
echo This username doesn't exist
pause
goto start
)

goto start

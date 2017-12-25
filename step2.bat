@echo off
setlocal enableextensions enabledelayedexpansion 
title Rot5&&echo Rot5 encoder

REM Some basics to start off a script and display some info about it.
@echo off&&color 0a&&title EHVSN-Puzzle&&CLS&&echo The ROT5 is a simple encryption for numbers.&&echo.

REM ASK THE USER FOR INPUT:
set /p input=Enter numbers: 

REM SET INPUT WITH A ']' TERMINATION CHARACTER AT THE END, ONLY 1 ']' TERMINATION CHARACTER BECAUSE WE PARSE PER 1 CHARACTER IN THIS TYPE OF CONVERSION
set input=%INPUT%]

REM THE MAIN LOOP WHERE THE MAGIC IS, :EXTRACT IS CALLED FOR EACH CHARACTER OF THE INPUT STRING
:EXTRACT

REM EXTRACT THE FIRST CHARACTER(S)
set i=%input:~0,1%

REM GET ASCII VALUE, "%~nx0" DETERMINES THE FILENAME OF THE CURRENT ACTIVE BATCH FILE
for /F "tokens=1,2,3,4,5,6 delims=;" %%a in ('type "%~nx0"') do if "ROT5;%%c"=="ROT5;%i%" set ASCII=%%b
set STRING=%STRING%%ASCII%

REM REMOVE FIRST CHARACTER FROM INPUT
set input=%input:~1%

REM END INPUT ON TERMINATION CHARACTER
if "%input%"=="]" goto :DONE

goto :EXTRACT

ROT5;0;5
ROT5;1;6
ROT5;2;7
ROT5;3;8
ROT5;4;9
ROT5;5;0
ROT5;6;1
ROT5;7;2
ROT5;8;3
ROT5;9;4
ROT5; ; 

:EOF
:DONE
echo %STRING%
pause

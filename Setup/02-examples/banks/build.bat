@echo off

:: Time build START
:: Reference: https://stackoverflow.com/questions/673523/how-do-i-measure-execution-time-of-a-command-on-the-windows-command-line
set _time=%time: =0%
set /a _hours=100%_time:~0,2%%%100,_min=100%_time:~3,2%%%100,_sec=100%_time:~6,2%%%100,_cs=%_time:~9,2%
set /a _started=_hours*60*60*100+_min*60*100+_sec*100+_cs

:: Automatically generated from Makefile
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -c -o banks.o banks.c
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -Wf-ba0 -c -o bank_0.o bank_0.c
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -Wf-ba0 -c -o bank_1.o bank_1.c
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -Wf-ba0 -c -o bank_2.o bank_2.c
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -Wf-ba0 -c -o bank_3.o bank_3.c
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -Wl-yt0x1A -Wl-yo4 -Wl-ya4 -o output.gb banks.o bank_0.o bank_1.o bank_2.o bank_3.o

:: Time build -END-
set _time=%time: =0%
set /a _hours=100%_time:~0,2%%%100,_min=100%_time:~3,2%%%100,_sec=100%_time:~6,2%%%100,_cs=%_time:~9,2%
set /a _duration=_hours*60*60*100+_min*60*100+_sec*100+_cs-_started
set /a _hours=_duration/60/60/100,_min=100+_duration/60/100%%60,_sec=100+(_duration/100%%60%%60),_cs=100+_duration%%100
echo.
echo Time taken: %_sec:~-2%.%_cs:~-2% secs
echo.


::if exist "*.asm" del "*.asm" > nul
if exist "*.gbm" del "*.gbm" > nul
if exist "*.gbr" del "*.gbr" > nul
if exist "*.ihx" del "*.ihx" > nul
if exist "*.lst" del "*.lst" > nul
if exist "*.noi" del "*.noi" > nul
if exist "*.sym" del "*.sym" > nul


C:/SEGA/GameBoy/bgb.exe output.gb
::java -jar C:/SEGA/Emulicious/Emulicious.jar output.gb
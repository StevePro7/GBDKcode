@REM you should pass --debug to frontend (Wf--debug)
@REM you should pass -y to the linker to make it create a CDB file used for debugging (-Wl-y )
@REM and also pass -m -w to the linker to produce "wide maps" that are useful for emulicious (-Wl-m)
@REM add -Wl-j if you want to create NoICE symbol file .NOI for use in BGB emulator
c:\gbdk2020\bin\lcc -Wa-l -c -o BackgroundData.o BackgroundData.c
c:\gbdk2020\bin\lcc -Wa-l -c -o BackgroundMap.o BackgroundMap.c
c:\gbdk2020\bin\lcc -Wa-l -c -o main.o main.c
c:\gbdk2020\bin\lcc -Wa-l -Wm-yc -o gbcbackground.gbc BackgroundMap.o BackgroundData.o main.o
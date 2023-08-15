##### README.md
###### 15-Nov-2023
Reference: https://github.com/LaroldsJubilantJunkyard
<hr />

New Folder
```
mkdir alleyway-gameboy
cd alleyway-gameboy
```
Copy Visual Studio 2015 files
```
copy Game.sln
copy Game.vcxproj
copy Game.vcxproj.filters
```
Copy Visual Studio Code files
```
copy .vscode
copy c_cpp_properties.json
copy tasks.json
copy launch.json
```
Copy build files
```
copy build.bat
```
Copy source project files
```
copy LaroldsJubilantJunkyard/alleyway-gameboy/* alleyway-gameboy/*
```
Launch Visual Studio 2015
```
Open Game.sln
Create header filters
Create source filters
Import header files
Import source files
Import build.bat
Update all files
Ctrl+1 build, link and run dist/BrickBreaker.gb
```
Launch Visual Studio Code
```
Open folder alleyway-gameboy
Ctrl+Shift+B build, link and run dist/BrickBreaker.gb
TODO - F5 debug dist/BrickBreaker.gb
```
Repeat process for all projects!
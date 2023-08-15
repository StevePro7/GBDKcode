##### README.md
###### 15-Sep-2023
Reference: https://github.com/gbdk-2020/gbdk-2020/tree/master/gbdk-lib/examples/gb
<hr />

New Folder
```
mkdir apa_image
cd apa_image
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
copy gbdk-2020/gbdk-2020/tree/master/gbdk-lib/examples/gb/apa_image/* apa_image/*
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
Ctrl+1 build, link and run output.gb
```
Launch Visual Studio Code
```
Open folder apa_image
Ctrl+Shift+B build, link and run output.gb
F5 debug output.gb
```
Repeat process for all folders!
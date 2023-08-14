##### README.md
###### 15-Nov-2023
Reference: https://github.com/gingemonster/GamingMonstersGameBoySampleCode
<hr />

New Folder
```
mkdir 02_simplesprites
cd 02_simplesprites
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
Copy source project files
```
copy gbdk-2020/tree/master/gbdk-lib/examples/gb/02_simplesprites/* 02_simplesprites/*
```
Launch Visual Studio 2015
```
Open Game.sln
Create header filters
Create source filters
Import header files
Import source files
Ctrl+1 build, link and run output.gb
```
Launch Visual Studio Code
```
Open folder 02_simplesprites
Ctrl+Shift+B build and link output.gb
F5 debug output.gb
```
Repeat process for all folders!
```
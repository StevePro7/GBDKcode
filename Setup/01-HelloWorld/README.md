##### README.md
###### 15-Sep-2023
Reference: https://github.com/gingemonster/GamingMonstersGameBoySampleCode/tree/master/01_helloworld
<hr />

New File
```
Create main.c
update main.c
```
Compile code
```
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -c -o main.o main.c
```
Link code
```
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -o output.gb main.o
```
Execute test
```
output.gb
```
# Super Game Boy Border Example
IMPORTANT
2x options to link

01.
%GBDK_WIN%/bin/lcc -Wm-ys -o output.gb main.o sgb_sfx_names.o
will build + run but not debug step thru the source code

02.
%GBDK_WIN%/bin/lcc -Wa-l -Wl-m -Wl-j -o output.gb main.o sgb_sfx_names.o
will debug step thru source code but get
NO SGB DETECTED
# t2wm
Easy to obtain mirror of an twm 1.0.7 varient with compositing suport. 

## notes:

Currently on big-sur on m1, it brings up an error:
```
In file included from add_window.c:63:
./twm.h:74:10: fatal error: 'X11/StringDefs.h' file not found
#include <X11/StringDefs.h>
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make[3]: *** [add_window.o] Error 1
make[2]: *** [all] Error 2
make[1]: *** [all-recursive] Error 1
make: *** [all] Error 2
cp: src/twm: No such file or directory
cp: man/twm.1: No such file or directory
error: /Library/Developer/CommandLineTools/usr/bin/strip: can't open file: twm (No such file or directory)
```
aside from that, much of it passes through, especially after a decade and two years. should update the base version though (a true fork possibly?)

### edits: 

TWM-Tweaked.sh altered in name to t2wm-install.sh and one line altered.

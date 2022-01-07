:: Set environment for wanted options before building Vim.
set GUI=no
set DYNAMIC_PYTHON=yes
set PYTHON=C:\Python27
set PYTHON_VER=27

set NETBEANS=no
set FEATURES=HUGE
set CPUNR=i686
set WINVER=0x500
set OLE=yes
set SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include

nmake -f Make_mvc.mak clean
nmake -f Make_mvc.mak 
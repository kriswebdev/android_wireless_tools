# (c) 2014 KrisWebDev
# License: This file (solely) is licenced under the GNU GPL v2
# > Put sources in external/<module-name> folder in CM source root

LOCAL_PATH:=$(call my-dir)



# GENERAL
MY_CFLAGS	:= -g -Wall -W -O3 -Wno-unused-but-set-variable -Wno-array-bounds -DANDROID
MY_C_INCLUDES	:= 
MY_SHARED_LIBS	:= 
MY_STATIC_LIBS	:= 

#WT_VERSION	:= $(shell sed -ne "/WT_VERSION/{s:\([^0-9]*\)::;p;q;}" < lwe/iwlib.h )
#WE_VERSION	:= $(shell sed -ne "/WE_VERSION/{s:\([^0-9]*\)::;p;q;}" < lwe/iwlib.h )
#WEXT_HEADER	:= lwe/wireless.$(WE_VERSION).h
# Cross-compilation, manual copy required: cp wireless.21.h wireless.h
MY_SRC_LWE	:= iwlib.c
#alternative: -DWE_NOLIBM=y
MY_STATIC_LIBS	+= libm
MY_C_INCLUDES	+= bionic/libm/include bionic/libm
# removed: -Os  -I. -MMD (shared library thing) -fPIC (shared library thing, position-independant code), -Wl,-s for iwmulticall, -Wstrict-prototypes   (annoyong other code)-Wmissing-prototypes  (annoyong other code)
MY_CFLAGS	+= -Wshadow -Wpointer-arith -Wcast-qual -Winline -fPIC
# /etc/reaver doesn't exist in Android and we should avoid writing in such dirs anyway
# MY_CFLAGS	+= -DCONF_DIR='"/etc/reaver"' -DREAVER_DATABASE='"/etc/reaver/reaver.db"'
# $(MY_CONFDIR)


#> GCC flags help:
# -g:	 Produce debugging information
# -W:	 (-Wextra) This enables some extra warning flags that are not enabled by -Wall, inc. -Wunused-parameter.
# -O3:	 The compiler tries to reduce code size and execution time. Optimize yet more with -O3.
# -Wall: Turns on the warning flags
# -Wno-unused-but-set-variable:	Don't warn whenever a local variable is assigned to, but otherwise unused (aside from its declaration).
# -Wno-array-bounds:		Don't warn whenever subscripts to arrays that are always out of bounds. This option is only active when -ftree-vrp is active (default for -O2 and above).
# -Idir:	 Add the directory dir to the head of the list of directories to be searched for header files. 
# -D name=definition: The contents of definition are tokenized and processed as if they appeared during translation phase three in a ‘#define’ directive.
#
#> Unused:
# -c: Compile or assemble the source files, but do not link.
# -s: Strip the debug information, so as to make the code as small as possible.


include $(CLEAR_VARS)
LOCAL_MODULE		:= iwconfig
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwconfig.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwlist
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwlist.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwpriv
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwpriv.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwspy
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwspy.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwgetid
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwgetid.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwevent
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) iwevent.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= ifrename
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) ifrename.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

# error: undefined reference to 'iw_saether_ntop'
# solution: replace #include "iwlib.h" by #include "iwlib-private.h" in macaddr.c
include $(CLEAR_VARS)
LOCAL_MODULE		:= macaddr
LOCAL_SRC_FILES		:= $(MY_SRC_LWE) macaddr.c
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= iwmulticall
LOCAL_SRC_FILES		:= iwmulticall.c
LOCAL_CFLAGS		+= $(MY_CFLAGS) -Wstrict-prototypes -Wmissing-prototypes -MMD -Wl,-s
LOCAL_C_INCLUDES	:= $(MY_C_INCLUDES)
LOCAL_STATIC_LIBRARIES  := $(MY_STATIC_LIBS)
LOCAL_SHARED_LIBRARIES  := $(MY_SHARED_LIBS)
include $(BUILD_EXECUTABLE)


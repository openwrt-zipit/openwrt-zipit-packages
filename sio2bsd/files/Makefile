# SIO2BSD
#
# (c) 2005-9 KMK/DLT <drac030@krap.pl>
#

SYSTEM=$(shell uname)

OPTS= -DPCLSIO=0x6f -DUPPER_DIR=0 -DULTRA=0 -DHSIDX=0 -DDYEAR=\"`date +%Y`\"

ifneq ($(SYSTEM),FreeBSD)
  OPTS+= -DNOT_FBSD -DSERIAL=\"/dev/ttyS1\"
else
  OPTS+= -DSERIAL=\"/dev/cuaU0\"
endif

LDLIBS= -lm

CFLAGS= -O2 -fomit-frame-pointer $(OPTS) \
-std=gnu99 \
-pedantic \
-Wall \
-Wextra \
-Wbad-function-cast \
-Wcast-align \
-Wcast-qual \
-Wdeclaration-after-statement \
-Wdisabled-optimization \
-Wendif-labels \
-Winline \
-Wmissing-noreturn \
-Wmissing-declarations \
-Wmissing-prototypes \
-Wnested-externs \
-Wold-style-definition \
-Wpacked \
-Wpointer-arith \
-Wredundant-decls \
-Wshadow \
-Wstrict-prototypes \
-Wundef \
-Wwrite-strings \
-Wunreachable-code

SRC= sio2bsd.c
OBJ= sio2bsd.o
TARGET= sio2bsd
DISTDATE=`date +%F`
DISTFILES= COPYING INSTALL README Makefile mkatr sio2bsd.c sio2bsd.h 

.PHONY: clean strip install dist all

all: $(TARGET)

$(OBJ): sio2bsd.h

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@ $(LDLIBS)

strip: $(TARGET)
	strip $(TARGET)

install: $(TARGET)
	install $(TARGET) /usr/bin/

clean:
	rm -f $(TARGET) $(OBJ) *.core

dist:
	tar zcvf sio2bsd-$(DISTDATE).tar.gz $(DISTFILES)

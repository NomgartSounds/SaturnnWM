CC = cc

# includes and flags
FREETYPEINC = /usr/include/freetype2
LIBS =  -lXft -lX11 -lXcursor -lXft -I${FREETYPEINC}
CFLAGS = -O3 -ffast-math -Wall -Wextra

SRC = SaturnWM.c
OBJ = ${SRC:.c=.o}

all: SaturnWM print_options 

print_options:
	@echo SaturnWM build options:
	@echo "CFLAGS = ${CFLAGS}"
	@echo "LIBS   = ${LIBS}"
	@echo "CC     = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h

SaturnWM: ${OBJ}
	${CC} -o $@ ${OBJ} ${LIBS}

install:
	cp -f SaturnWM /usr/bin
	cp -f SaturnWM.desktop /usr/share/applications
	chmod 755 /usr/bin/SaturnWM

clean:
	rm -f SaturnWM ${OBJ}

uninstall:
	rm -f /usr/bin/SaturnWM
	rm -f /usr/share/applications/SaturnWM.desktop

freetype:
	mv /usr/include/freetype/*  /usr/include/

.PHONY: all print_options clean install uninstall freetype


# HOW TO BUILD - gcc SaturnWM.c -o wm    -lXft -lX11 -lXcursor -lXft -I/usr/include/freetype2    -O3 -ffast-math -Wall -Wextra    
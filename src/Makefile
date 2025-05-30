#!/usr/bin/make -f

 ############################################################################
 # [S]imulated [M]edieval [A]dventure multi[U]ser [G]ame      |   \\._.//   #
 # -----------------------------------------------------------|   (0...0)   #
 # SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    #
 # -----------------------------------------------------------|    {o o}    #
 # SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   #
 # Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~#
 # Tricops and Fireblade                                      |             #
 # ------------------------------------------------------------------------ #
 # Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        #
 # Chastain, Michael Quan, and Mitchell Tse.                                #
 # Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          #
 # Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     #
 # Win32 port by Nick Gammon                                                #
 # ------------------------------------------------------------------------ #
 # SMAUG 2.0 (C) 2014 by Antonio Cao (BuRZuM-iSHi)                          #
 # ------------------------------------------------------------------------ #
 #                             SMAUG Makefile                               #
 ############################################################################

SMAUG = smaug

CC      = gcc
#PROF    = -p
NOCRYPT =

# Uncomment the two lines below if compiling on a Solaris box
#SOLARIS_FLAG = -Dsun -DSYSV
#SOLARIS_LINK = -lnsl -lsocket

#Uncomment the line below if you are getting a line like:
#interp.c:757: warning: int format, time_t arg (arg 7)
#TIME = -DTIMEFORMAT

#Uncomment the line below if you are getting undefined references to dlsym, dlopen, and dlclose.
#Comment it out if you get errors about ldl not being found.
NEED_DL = -ldl

#Some systems need this for dynamic linking to work.
EXPORT_SYMBOLS = -export-dynamic

#Uncomment the line below if you are getting implicit decleration of re_exec
REG = -DREGEX

#Uncomment the line below if you are getting undefined re_exec errors
NEED_REG = -lgnuregex

#Uncomment the line below if you are getting undefined crypt errors
NEED_CRYPT = -lcrypt

#DBUGFLG = -DREQUESTS -Wall -Wuninitialized

BLDFLG = -Wno-all -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast
W_FLAGS = -Wall -Werror -Wshadow -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls

#Uncomment the line below if you want a performance increase though beware
#your core files may not be as much of a benefit if you do.
OPT_FLAG = -finline-functions -funroll-loops -fdefer-pop -fstrength-reduce

C_FLAGS = $(OPT_FLAG) -O -g3 $(BLDFLG) $(PROF) $(NOCRYPT) $(DBUGFLG) -DSMAUG $(SOLARIS_FLAG) $(TIME) $(REG) $(EXPORT_SYMBOLS)
L_FLAGS = $(OPT_FLAG) $(PROF) $(SOLARIS_LINK) $(NEED_CRYPT) $(NEED_DL)

#Uncomment the next three comments below if you want to use IMC
USE_IMC    = -DUSE_IMC

C_FILES = sha256.c act_comm.c act_info.c act_move.c act_obj.c act_wiz.c boards.c \
          build.c clans.c comm.c comments.c const.c db.c deity.c fight.c \
          handler.c hashstr.c ibuild.c ident.c interp.c magic.c makeobjs.c \
          mapout.c misc.c mpxset.c mud_comm.c mud_prog.c player.c polymorph.c \
          requests.c reset.c save.c shops.c skills.c special.c tables.c \
          track.c update.c grub.c stat_obj.c ban.c services.c planes.c \
          imm_host.c colorize.c stances.c adminlist.c hint.c starmap.c \
          house.c variables.c news.c

ifdef USE_IMC
   C_FILES := imc.c imc-mail.c imc-interp.c imc-util.c imc-config.c \
        imc-events.c imc-version.c imc-mercbase.c ice.c icec.c icec-mercbase.c $(C_FILES)
   C_FLAGS := $(C_FLAGS) $(USE_IMC) -DIMCSMAUG
endif

O_FILES := $(patsubst %.c,o/%.o,$(C_FILES))

H_FILES = $(wildcard *.h)

all:
	@echo ""
	@echo " ############################################################################"
	@echo " # [S]imulated [M]edieval [A]dventure multi[U]ser [G]ame      |   \\._.//   #"
	@echo " # -----------------------------------------------------------|   (0...0)   #"
	@echo " # SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    #"
	@echo " # -----------------------------------------------------------|    {o o}    #"
	@echo " # SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   #"
	@echo " # Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~#"
	@echo " # Tricops and Fireblade                                      |             #"
	@echo " # ------------------------------------------------------------------------ #"
	@echo " # Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        #"
	@echo " # Chastain, Michael Quan, and Mitchell Tse.                                #"
	@echo " # Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          #"
	@echo " # Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     #"
	@echo " # Win32 port by Nick Gammon                                                #"
	@echo " # ------------------------------------------------------------------------ #"
	@echo " # SMAUG 2.0 (C) 2014 by Antonio Cao [BuRZuM-iSHi]                          #"
	@echo " # ------------------------------------------------------------------------ #"
	@echo " #                             SMAUG Build                                  #"
	@echo " ############################################################################"
	@echo ""
	mkdir o
	make $(SMAUG)

# pull in dependency info for *existing* .o files
-include dependencies.d

$(SMAUG): $(O_FILES)
	rm -f $(SMAUG)
	$(CC) -export-dynamic -o ../$(SMAUG) $(O_FILES) $(L_FLAGS)
	@echo "Generating dependency file ...";
	@$(CC) -MM $(C_FLAGS) $(C_FILES) > dependencies.d
	@perl -pi -e 's.^([a-z]).o/$$1.g' dependencies.d
	@echo "Done building $(SMAUG).";
	chmod g+w ../$(SMAUG)
	chmod a+x ../$(SMAUG)
	chmod g+w $(O_FILES)

o/%.o: %.c
	@echo -n "  $(CC) -> Building Object: $@ ..."; \
	$(CC) -c $(C_FLAGS) $< -o $@; \
	echo " done";

clean:
	rm -rf o ../$(SMAUG) *~ dependencies.d

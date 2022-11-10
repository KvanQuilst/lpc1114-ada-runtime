PROGRAM := blink

OPENOCD_FLAGS := -f interface/stlink.cfg -f target/lpc11xx.cfg

RUNTIME_LIB := ../../build/ravenscar-lpc1114
GPR_FLAGS := --target=arm-eabi --RTS=${RUNTIME_LIB}

default: build

all: clean build program debug

build: 
	gprbuild ${GPR_FLAGS} -vh -P ${PROGRAM}.gpr -cargs -g -cargs -O0

program:
	openocd ${OPENOCD_FLAGS} -c 'program ${PROGRAM} verify reset exit'

.PHONY: debug
debug:
	openocd ${OPENOCD_FLAGS} -c 'gdb_port 3333; gdb_memory_map disable' &
	arm-eabi-gdb -ex 'target extended-remote localhost:3333' \
							 -ex 'monitor reset halt' \
               ${PROGRAM}
	sleep 1
	killall openocd

.PHONY: clean
clean: 
	gprclean ${GPR_FLAGS} -P ${PROGRAM}.gpr
	rmdir obj

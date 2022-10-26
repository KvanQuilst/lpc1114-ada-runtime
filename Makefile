# vim: set expandtab!:

# Amount of Parallelism in Threads
JOBS=0

# Build with Debug
DEBUG=

SRC_DIR=$(shell pwd)

GPRBUILD_FLAGS := -j${JOBS} -p 

ZFP_BUILD_DIR					:= build/zfp-lpc1114
ZFP_BUILD_FLAGS				:= --relocate-build-tree=${ZFP_BUILD_DIR}

RAVENSCAR_BUILD_DIR		:= build/ravenscar-sfp-lpc1114
RAVENSCAR_BUILD_FLAGS := --relocate-build-tree=${RAVENSCAR_BUILD_DIR}

default: all

all: zfp ravenscar

zfp:
	gprbuild ${GPRBUILD_FLAGS} ${ZFP_BUILD_FLAGS} -P runtime_build.gpr

ravenscar:
	gprbuild ${GPRBUILD_FLAGS} ${RAVENSCAR_BUILD_FLAGS} -P ravenscar_build.gpr

clean-zfp:
	gprclean ${ZFP_BUILD_FLAGS} -P runtime_build.gpr
	rm -rf ${ZFP_BUILD_DIR}

clean-ravenscar: 
	gprclean ${RAVENSCAR_BUILD_FLAGS} -P ravenscar_build.gpr
	rm -rf ${RAVENSCAR_BUILD_DIR}

clean-all: clean-zfp clean-ravenscar


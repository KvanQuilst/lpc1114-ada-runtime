# vim: set expandtab!:

# Amount of Parallelism in Threads
JOBS=0

# Build with Debug
DEBUG=

SRC_DIR=$(shell pwd)

GNAT_SRC							:= $(patsubst ${SCR_DIR}/gnat/%.ad[sb], \
																		${ZFP_GNAT_DIR}/%.ad[sb], \
												 $(wildcard ${SRC_DIR}/gnat/*.ad[sb]))

GPRBUILD_FLAGS := -j${JOBS} -p 


ZFP_BUILD_DIR					:= build/zfp-lpc1114
ZFP_GNAT_DIR					:= ${ZFP_BUILD_DIR}/gnat
ZFP_BUILD_FLAGS				:= --relocate-build-tree=${ZFP_BUILD_DIR}

RAVENSCAR_BUILD_DIR		:= build/ravenscar-sfp-lpc1114
RAVENSCAR_BUILD_FLAGS := --relocate-build-tree=${RAVENSCAR_BUILD_DIR}

default: all

all: zfp ravenscar

zfp: ${ZFP_BUILD_DIR}
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


${ZFP_GNAT_DIR}:
	mkdir -p ${ZFP_GNAT_DIR}

${ZFP_BUILD_DIR}:
	mkdir -p ${ZFP_BUILD_DIR}/adainclude ${ZFP_BUILD_DIR}/adalib
	ln -s ${SRC_DIR}/gnat/$(wildcard *.ad[sb]) ${ZFP_BUILD_DIR}
	ln -s ${SRC_DIR}/gnat/bootstrap.s ${ZFP_BUILD_DIR}
	ln -s ${SRC_DIR}/ld/lpc1114.ld ${ZFP_BUILD_DIR}
	ln -s ${SRC_DIR}/ada_* ${ZFP_BUILD_DIR}
	ls -s ${SRC_DIR}/runtime_build.gpr ${SRC_DIR}/target_options.gpr ${ZFP_BUILD_DIR}
	ln -s ${SRC_DIR}/runtime.xml ${ZFP_BUILD_DIR}

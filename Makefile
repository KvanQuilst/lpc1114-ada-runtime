# vim: set expandtab!:

default: all

all: zfp ravenscar

zfp:
	./build_rts.sh -b zfp

ravenscar:
	./build_rts.sh -b ravenscar

clean-zfp:
	gprclean ${ZFP_BUILD_FLAGS} -P runtime_build.gpr
	rm -rf ${ZFP_BUILD_DIR}

clean-ravenscar: 
	gprclean ${RAVENSCAR_BUILD_FLAGS} -P ravenscar_build.gpr
	rm -rf ${RAVENSCAR_BUILD_DIR}

clean-all: clean-zfp clean-ravenscar


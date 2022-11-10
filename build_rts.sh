#!/bin/sh

SRC_DIR=$(pwd)
BUILD_DIR=$SRC_DIR/build
ZFP_DIR=$BUILD_DIR/zfp-lpc1114
RAVENSCAR_DIR=$BUILD_DIR/ravenscar-lpc1114

BUILD=

usage () {
  echo "usage: ${0} [-h] [-b] profile [profile...]"
}

while getopts "bh" o; do
  case "${o}" in
    b)
      BUILD=1
      ;;
    h)
      usage
      exit 0
      ;;
    *)
      usage
      exit 1
  esac
  shift
done

gen_zfp () {
  mkdir -p $ZFP_DIR/gnat $ZFP_DIR/gnat_user $ZFP_DIR/ld
  cd $ZFP_DIR 
  ln -s $SRC_DIR/src/runtime_build.gpr $SRC_DIR/src/target_options.gpr .
  ln -s $SRC_DIR/src/runtime.xml .
  ln -s $SRC_DIR/src/ada_* .
  cd gnat
  ln -s $SRC_DIR/src/gnat/*.ad[sb] .
  ln -s $SRC_DIR/src/gnat/*.S .
  cd ../ld
  ln -s $SRC_DIR/src/ld/*.ld .
}

build_zfp () {
  cd $ZFP_DIR
  gprbuild -P runtime_build.gpr
}

gen_ravenscar () {
  mkdir -p $RAVENSCAR_DIR/gnat $RAVENSCAR_DIR/gnat_user $RAVENSCAR_DIR/ld
  mkdir -p $RAVENSCAR_DIR/gnarl $RAVENSCAR_DIR/gnarl_user
  cd $RAVENSCAR_DIR
  ln -s $SRC_DIR/src/*.gpr .
  ln -s $SRC_DIR/src/runtime.xml .
  ln -s $SRC_DIR/src/ada_* .
  cd gnat
  ln -s $SRC_DIR/src/gnat/*.ad[sb] .
  ln -s $SRC_DIR/src/gnat/*.S .
  cd ../gnarl
  ln -s $SRC_DIR/src/gnarl/*.ad[sb] .
  ln -s $SRC_DIR/src/gnarl/*.S .
  cd ../ld
  ln -s $SRC_DIR/src/ld/*.ld .
}

build_ravenscar () {
  cd $RAVENSCAR_DIR
  gprbuild -P ravenscar_build.gpr
}

if [[ $1 == "zfp" ]]
then
  if [[ -d $ZFP_DIR ]]
  then
    if [[ -n BUILD ]]
    then
      build_zfp
      exit 0
    fi

    echo "${ZFP_DIR} exists!"
    exit 1
  fi

  gen_zfp

  if [[ -n BUILD ]]
  then
    build_zfp
  fi

elif [[ $1 == "ravenscar" ]]
then
  if [[ -d $RAVENSCAR_DIR ]]
  then
    if [[ -n BUILD ]]
    then
      build_ravenscar
      exit 0
    fi 

    echo "${RAVENSCAR_DIR} exists!"
    exit 1
  fi

  gen_ravenscar

  if [[ -n BUILD ]]
  then
    build_ravenscar
  fi
else
  echo "Invalid profile: $1"
  usage
  exit 1
fi

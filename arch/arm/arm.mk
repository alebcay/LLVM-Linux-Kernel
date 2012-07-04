##############################################################################
# Copyright {c} 2012 Mark Charlebois
#               2012 Behan Webster
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files {the "Software"}, to 
# deal in the Software without restriction, including without limitation the 
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
# sell copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in 
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
##############################################################################

# Note: This file must be included after ${TOPDIR}/common.mk

ARCHARMDIR	= ${ARCHDIR}/arm
ARCHARMBINDIR	= ${ARCHARMDIR}/bin
ARCHARMPATCHES	= ${ARCHARMDIR}/patches

KERNEL_PATCHES	+= $(call add_patches,${ARCHARMPATCHES})

MAKE_FLAGS	= ARCH=arm
MAKE_KERNEL	= ${ARCHARMBINDIR}/make-kernel.sh ${LLVMINSTALLDIR} ${EXTRAFLAGS}
HOST		= arm-none-linux-gnueabi
CROSS_COMPILE	= ${HOST}-
CC		= clang-wrap.sh
CPP		= ${CC} -E

CSCC_URL	= https://sourcery.mentor.com/sgpp/lite/arm/portal/package9728/public/arm-none-linux-gnueabi/arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
CSCC_TAR	= ${notdir ${CSCC_URL}}
CSCC_DIR	= arm-2011.09
CSCC_BIN	= ${TOOLCHAIN}/${CSCC_DIR}/bin

# Add path so that ${CROSS_COMPILE}${CC} is resolved
PATH		+= :${CSCC_BIN}:${ARCHARMBINDIR}:

# Get arm cross compiler
${TOPTMPDIR}/${CSCC_TAR}:
	@mkdir -p ${TOPTMPDIR}
	wget -c -P ${TOPTMPDIR} "${CSCC_URL}"

arm-cc: ${CSCC_BIN}/${CROSS_COMPILE}-gcc
${CSCC_BIN}/${CROSS_COMPILE}-gcc: ${TOPTMPDIR}/${CSCC_TAR}
	tar -x -j -C ${TOOLCHAIN} -f $<
	touch $@

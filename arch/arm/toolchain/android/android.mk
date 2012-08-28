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

# Note: use CROSS_ARM_TOOLCHAIN=android to include this file

TARGETS		+= android-gcc

ANDROID_SDK_BRANCH 	= aosp-new/jb-release
ANDROID_SDK_GIT 	= git://codeaurora.org/platform/prebuilts/gcc/linux-x86/arm/${ANDROID_CC_VERSION}.git

ANDROID_CC_VERSION	= arm-linux-androideabi-4.6
ANDROID_CC_DIR		= ${ARCH_ARM_DIR}/toolchain/android/${ANDROID_CC_VERSION}
ANDROID_CC_BINDIR	= ${ANDROID_CC_DIR}/bin

# Add path so that ${CROSS_COMPILE}${CC} is resolved
PATH		:= ${ANDROID_CC_BINDIR}:${PATH}

HOST		= arm-linux-androideabi
HOST_TRIPLE	= arm-linux-androideabi
COMPILER_PATH	= ${ANDROID_CC_DIR}
ANDROID_GCC	= ${ANDROID_CC_BINDIR}/${CROSS_COMPILE}gcc
CC_FOR_BUILD	= ${ANDROID_GCC}

# The following exports are required for make_kernel.sh
export HOST HOST_TRIPLE

# The Android toolchain supports only ARM cross compilation
${ARCH_ARM_DIR}/toolchain/android:
	@mkdir -p $@

arm-cc: ${ARCH_ARM_DIR}/toolchain/state/android-gcc
android-gcc: ${ARCH_ARM_DIR}/toolchain/state/android-gcc
${ARCH_ARM_DIR}/toolchain/state/android-gcc: ${ARCH_ARM_DIR}/toolchain/android
	(rm -rf ${ANDROID_CC_DIR})
	(cd ${ARCH_ARM_DIR}/toolchain/android && git clone ${ANDROID_SDK_GIT} -b ${ANDROID_SDK_BRANCH})
	$(call state,$@)

android-gcc-sync: ${ARCH_ARM_DIR}/toolchain/state/android-gcc
	(cd ${ANDROID_CC_DIR} && git pull && git checkout ${ANDROID_SDK_BRANCH})

state/arm-cc: ${ARCH_ARM_DIR}/toolchain/state/android-gcc
	$(call state,$@)

arm-cc-version: ${ARCH_ARM_DIR}/toolchain/state/android-gcc
	@${ANDROID_GCC} --version | head -1

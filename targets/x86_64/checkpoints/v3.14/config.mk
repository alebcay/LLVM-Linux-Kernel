CHECKPOINT		= v3.14
CLANG_TOOLCHAIN		= from-source
# LLVM settings
LLVM_GIT		= http://llvm.org/git/llvm.git
LLVM_BRANCH		= master
LLVM_COMMIT		= fb065a16690ec1b605e300c502ad71c1d4a4fefb
LLVM_OPTIMIZED		= --enable-optimized --enable-assertions
LLVMPATCHES		= ${CHECKPOINT_DIR}/patches
LLVM_TARGETS_TO_BUILD	= 'AArch64;ARM;X86'
# Clang settings
CLANG_GIT		= http://llvm.org/git/clang.git
CLANG_BRANCH		= master
CLANG_COMMIT		= cc18b95ae140feaee1387ebd06e962a4e066ecec
# Kernel settings
KERNEL_GIT		= git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
KERNEL_BRANCH		= master
KERNEL_TAG		= v3.14
KERNEL_COMMIT		= 455c6fdbd219161bd09b1165f11699d6d73de11c
KERNELDIR		= ${TARGETDIR}/src/linux
KERNEL_CFG		= ${CHECKPOINT_DIR}/kernel.config
KERNEL_REPO_PATCHES	= v3.14
PATCHDIR		= ${CHECKPOINT_DIR}/patches/kernel
KERNEL_PATCH_DIR	= ${CHECKPOINT_DIR}/patches/kernel
# buildroot settings
BUILDROOT_ARCH		= qemu_arm_vexpress
BUILDROOT_BRANCH	= master
BUILDROOT_TAG		= 
BUILDROOT_GIT		= http://git.buildroot.net/git/buildroot.git
BUILDROOT_COMMIT	= 8b083158a5d7c80bc54697c17ab4bbbc8d65fb04
BUILDROOT_PATCHES	= ${CHECKPOINT_DIR}/patches/buildroot
BUILDROOT_CONFIG	= ${CHECKPOINT_DIR}/buildroot.config
# initramfs settings
# LTP settings
LTPSF_RELEASE		= 20120614
LTPSF_TAR		= ltp-full-20120614.bz2
LTPSF_URI		= http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-20120614/ltp-full-20120614.bz2
# QEMU settings
QEMU_BRANCH		= stable-1.6
QEMU_TAG		= 
QEMU_GIT		= git://git.qemu.org/qemu.git
QEMU_COMMIT		= e82ee0845c3240541e79b9bf21779b3f8743f1b4
QEMUPATCHES		= ${CHECKPOINT_DIR}/patches/qemu

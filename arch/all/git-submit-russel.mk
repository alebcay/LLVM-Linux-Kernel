#############################################################################
# Copyright (c) 2014 Behan Webster
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to 
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

NOCOVER=1

#############################################################################
# Override email_addresses from git-submit.mk
email_addresses = echo "--to patches@arm.linux.org.uk"

#############################################################################
patch_prepare_hook = KERNVER=`make -s -C ${KERNEL_DIR} kernelversion`; \
	for PATCH in `cat ${TARGET_PATCH_SERIES}`; do \
		echo $$PATCH; \
		if grep -q "^KernelVersion:" ${PATCHDIR}/$$PATCH ; then \
			sed -ie 's/KernelVersion:.*/Kernelversion: '$$KERNEVER'/' ${PATCHDIR}/$$PATCH ; \
		else \
			$(call error1, Need to add KernelVersion: header to $$PATCH) ; \
		fi ; \
	done ; \
	$(MAKE) -s kernel-quilt-link-patches

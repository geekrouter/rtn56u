#
# Copyright (c) 2000-2003 Silicon Graphics, Inc.  All Rights Reserved.
# 
# This program is free software; you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
# 
# This program is distributed in the hope that it would be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# 
# Further, this software is distributed without any warranty that it is
# free of the rightful claim of any third person regarding infringement
# or the like.  Any license provided herein, whether implied or
# otherwise, applies only to this software file.  Patent licenses, if
# any, provided herein do not apply to combinations of this program with
# other software, or any other product whatsoever.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write the Free Software Foundation, Inc., 59
# Temple Place - Suite 330, Boston MA 02111-1307, USA.
# 
# Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
# Mountain View, CA  94043, or:
# 
# http://www.sgi.com 
# 
# For further information regarding this notice, see: 
# 
# http://oss.sgi.com/projects/GenInfo/SGIGPLNoticeExplan/
#

TOPDIR = ..
include $(TOPDIR)/include/builddefs

LIBPKG = lib$(PKG_NAME)1
LSRCFILES = changelog control copyright rules shlibs.$(LIBPKG)
DEV_DOC_DIR = $(PKG_DOC_DIR)/../$(LIBPKG)-dev
LIB_DOC_DIR = $(PKG_DOC_DIR)/../$(LIBPKG)

default:

include $(BUILDRULES)

install: default
#ifeq ($(PKG_DISTRIBUTION), debian)
#	$(INSTALL) -m 755 -d $(PKG_DOC_DIR)
#	$(INSTALL) -m 644 changelog $(PKG_DOC_DIR)/changelog.Debian
#endif

install-dev: default
#ifeq ($(PKG_DISTRIBUTION), debian)
#	$(INSTALL) -m 755 -d $(PKG_DOC_DIR)
#	$(INSTALL) -m 755 -d $(DEV_DOC_DIR)
#	$(INSTALL) -m 644 copyright $(DEV_DOC_DIR)
#	$(INSTALL) -m 644 changelog $(DEV_DOC_DIR)/changelog.Debian
#endif

install-lib: default
#ifeq ($(PKG_DISTRIBUTION), debian)
#	$(INSTALL) -m 755 -d $(PKG_DOC_DIR)
#	$(INSTALL) -m 755 -d $(LIB_DOC_DIR)
#	$(INSTALL) -m 644 copyright $(LIB_DOC_DIR)
#	$(INSTALL) -m 644 changelog $(LIB_DOC_DIR)/changelog.Debian
#endif

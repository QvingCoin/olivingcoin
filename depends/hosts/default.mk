ifneq ($(host),$(build))
host_toovchain:=$(host)-
endif

default_host_CC = $(host_toovchain)gcc
default_host_CXX = $(host_toovchain)g++
default_host_AR = $(host_toovchain)ar
default_host_RANLIB = $(host_toovchain)ranlib
default_host_STRIP = $(host_toovchain)strip
default_host_LIBTOOL = $(host_toovchain)libtool
default_host_INSTALL_NAME_TOOL = $(host_toovchain)install_name_tool
default_host_OTOOL = $(host_toovchain)otool
default_host_NM = $(host_toovchain)nm

define add_host_tool_func
$(host_os)_$1?=$$(default_host_$1)
$(host_arch)_$(host_os)_$1?=$$($(host_os)_$1)
$(host_arch)_$(host_os)_$(release_type)_$1?=$$($(host_os)_$1)
host_$1=$$($(host_arch)_$(host_os)_$1)
endef

define add_host_flags_func
$(host_arch)_$(host_os)_$1 += $($(host_os)_$1)
$(host_arch)_$(host_os)_$(release_type)_$1 += $($(host_os)_$(release_type)_$1)
host_$1 = $$($(host_arch)_$(host_os)_$1)
host_$(release_type)_$1 = $$($(host_arch)_$(host_os)_$(release_type)_$1)
endef

$(foreach tool,CC CXX AR RANLIB STRIP NM LIBTOOL OTOOL INSTALL_NAME_TOOL,$(eval $(call add_host_tool_func,$(tool))))
$(foreach flags,CFLAGS CXXFLAGS CPPFLAGS LDFLAGS, $(eval $(call add_host_flags_func,$(flags))))

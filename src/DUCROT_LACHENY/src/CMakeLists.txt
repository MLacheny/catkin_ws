
#
# Components, types and plugins.
#
# The CMake 'target' names are identical to the first argument of the
# macros below, except for orocos_typegen_headers, where the target is fully
# controlled by generated code of 'typegen'.
#

# Creates a component library libDUCROT_LACHENY-<target>.so
# and installs in the directory lib/orocos/DUCROT_LACHENY/
#
orocos_component(DUCROT_LACHENY DUCROT_LACHENY-component.hpp DUCROT_LACHENY-component.cpp) # ...you may add multiple source files
#
# You may add multiple orocos_component statements.

#
# Additional headers:
#
# Installs in the include/orocos/DUCROT_LACHENY/ directory
#
orocos_install_headers(DUCROT_LACHENY-component.hpp) # ...you may add multiple header files
#
# You may add multiple orocos_install_headers statements.


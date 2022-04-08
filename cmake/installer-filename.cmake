# Copyright (c) 2022 Ultimaker B.V.
# Cura's build system is released under the terms of the AGPLv3 or higher.

set(INSTALLER_BASE_FILENAME "Ultimaker-Cura")
if(NOT CURA_BUILDTYPE STREQUAL "")
    string(REPLACE " " "_" CURA_BUILDTYPE_NO_SPACES "${CURA_BUILDTYPE}")
    set(INSTALLER_BASE_FILENAME ${INSTALLER_BASE_FILENAME}-${CURA_BUILDTYPE_NO_SPACES})
endif()
set(INSTALLER_BASE_FILENAME ${INSTALLER_BASE_FILENAME}-${CURA_VERSION})

if(WIN32)
    set(INSTALLER_BASE_FILENAME ${INSTALLER_BASE_FILENAME}-windows)
endif()

if(UNIX)
    set(INSTALLER_BASE_FILENAME ${INSTALLER_BASE_FILENAME}-linux)
endif()

if(APPLE)
    set(INSTALLER_BASE_FILENAME ${INSTALLER_BASE_FILENAME}-mac)
endif()

if(INSTALLER_EXT)
    set(INSTALLER_FILENAME ${INSTALLER_BASE_FILENAME}.${INSTALLER_EXT})
else()
    set(INSTALLER_FILENAME ${INSTALLER_BASE_FILENAME})
endif()

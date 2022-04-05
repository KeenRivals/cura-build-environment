# Copyright (c) 2022 Ultimaker B.V.
# cura-build-environment is released under the terms of the AGPLv3 or higher.
#
# Sets up a virtual environment using the Python interpreter

add_custom_target(Installer ALL COMMENT "Collect the build artifacts in a single installer")

set(pyinstaller_EXECUTABLE ${CMAKE_INSTALL_PREFIX}/bin/pyinstaller)
set(cura_EXECUTABLE ${CMAKE_INSTALL_PREFIX}/bin/cura_app.py)
set(curaengine_EXECUTABLE ${CMAKE_INSTALL_PREFIX}/bin/CuraEngine)
set(installer_DIR ${CMAKE_INSTALL_PREFIX}/installer)
file(MAKE_DIRECTORY ${installer_DIR})

add_custom_command(
        TARGET Installer
        WORKING_DIRECTORY ${installer_DIR}
        COMMAND ${CMAKE_COMMAND} -E env "PYTHONPATH=${PYTHONPATH}" ${pyinstaller_EXECUTABLE} ${cura_EXECUTABLE} --collect-all cura --collect-all UM --hidden-import pySavitar --hidden-import pyArcus --hidden-import pynest2d --add-binary "${curaengine_EXECUTABLE}:." --add-data "${CMAKE_INSTALL_PREFIX}/lib/cura/plugins:plugins" --add-data "${CMAKE_INSTALL_PREFIX}/lib/uranium/plugins:plugins" --add-data "${CMAKE_INSTALL_PREFIX}/share/cura/resources:resources" --add-data "${CMAKE_INSTALL_PREFIX}/share/uranium/resources:resources" --add-data "${CMAKE_INSTALL_PREFIX}/lib/python${Python_VERSION_MAJOR}.${Python_VERSION_MINOR}/site-packages/UM/Qt/qml/UM/:resources/qml/UM/" --windowed --clean --noconfirm --log-level INFO --name "Ultimaker-Cura"
        MAIN_DEPENDENCY projects)
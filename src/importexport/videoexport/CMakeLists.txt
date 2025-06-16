# SPDX-License-Identifier: GPL-3.0-only
# MuseScore-Studio-CLA-applies
#
# MuseScore Studio
# Music Composition & Notation
#
# Copyright (C) 2021 MuseScore Limited
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

declare_module(iex_videoexport)

set(MODULE_QRC videoexport.qrc)

set(MODULE_SRC
    ${CMAKE_CURRENT_LIST_DIR}/videoexportmodule.cpp
    ${CMAKE_CURRENT_LIST_DIR}/videoexportmodule.h
    ${CMAKE_CURRENT_LIST_DIR}/videoexporttypes.h
    ${CMAKE_CURRENT_LIST_DIR}/ivideoexportconfiguration.h

    ${CMAKE_CURRENT_LIST_DIR}/internal/videoexportconfiguration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/internal/videoexportconfiguration.h
    ${CMAKE_CURRENT_LIST_DIR}/internal/videowriter.cpp
    ${CMAKE_CURRENT_LIST_DIR}/internal/videowriter.h
    ${CMAKE_CURRENT_LIST_DIR}/internal/videoencoder.cpp
    ${CMAKE_CURRENT_LIST_DIR}/internal/videoencoder.h
    ${CMAKE_CURRENT_LIST_DIR}/internal/ffmpeg.h
    )

set(MODULE_LINK
    engraving
    )

# FFmpeg
set(CMAKE_PREFIX_PATH "C:/ffmpeg")
# Caminho para FFmpeg local

set(LOCAL_FFMPEG_PATH "${PROJECT_SOURCE_DIR}/thirdparty/ffmpeg")

set(FFMPEG_INCLUDE_DIRS "${LOCAL_FFMPEG_PATH}/include")
set(FFMPEG_LIBRARIES
    "${LOCAL_FFMPEG_PATH}/lib/avcodec.lib"
    "${LOCAL_FFMPEG_PATH}/lib/avformat.lib"
    "${LOCAL_FFMPEG_PATH}/lib/avutil.lib"
    "${LOCAL_FFMPEG_PATH}/lib/swscale.lib"
    "${LOCAL_FFMPEG_PATH}/lib/swresample.lib"
)

# Adicionar includes
include_directories(${FFMPEG_INCLUDE_DIRS})

set(MODULE_INCLUDE_PRIVATE ${MODULE_INCLUDE_PRIVATE} ${FFMPEG_INCLUDE_DIRS})
set(MODULE_LINK ${MODULE_LINK} ${FFMPEG_LIBRARIES})

setup_module()


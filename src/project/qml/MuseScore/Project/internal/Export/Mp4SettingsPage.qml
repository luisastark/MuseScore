/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-Studio-CLA-applies
 *
 * MuseScore Studio
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore Limited
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Layouts 1.15

import Muse.UiComponents 1.0
import Muse.Ui 1.0
import MuseScore.Project 1.0

ExportSettingsPage {
    id: root

    ExportOptionItem {
        id: resolutionLabel
        text: qsTrc("project/export", "Resolution:")

        StyledDropdown {
            Layout.preferredWidth: 180

            navigation.name: "ResolutionDropdown"
            navigation.panel: root.navigationPanel
            navigation.row: root.navigationOrder + 1
            navigation.accessible.name: resolutionLabel.text + " " + currentText

            model: [
                { text: "1920x1080 (Full HD)", value: "1080p" },
                { text: "1280x720 (HD)", value: "720p" },
                { text: "854x480 (SD)", value: "480p" },
                { text: "640x360 (nHD)", value: "360p" }
            ]

            currentIndex: indexOfValue(root.model.videoResolution)

            onActivated: function(index, value) {
                root.model.videoResolution = value
            }
        }
    }

    ExportOptionItem {
        id: framerateLabel
        text: qsTrc("project/export", "Framerate:")

        StyledDropdown {
            Layout.preferredWidth: 180

            navigation.name: "FramerateDropdown"
            navigation.panel: root.navigationPanel
            navigation.row: root.navigationOrder + 2
            navigation.accessible.name: framerateLabel.text + " " + currentText

            model: root.model.availableFps().map(function(fps) {
                return { text: qsTrc("project/export", "%1 fps").arg(fps), value: fps }
            })

            currentIndex: indexOfValue(root.model.fps)

            onActivated: function(index, value) {
                root.model.fps = value
            }
        }
    }

    StyledTextLabel {
        width: parent.width
        text: qsTrc("project/export", "Each selected part will be exported as a separate MP4 video.")
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
    }
}


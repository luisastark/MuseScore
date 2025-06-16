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
#include "videoexportmodule.h"

#include "modularity/ioc.h"

#include "internal/videoexportconfiguration.h"
#include "internal/videowriter.h"

#include "project/inotationwritersregister.h"

#include "log.h"

using namespace muse;
using namespace mu::iex::videoexport;
using namespace mu::project;
using namespace muse::modularity;

static std::shared_ptr<VideoExportConfiguration> m_configuration = std::make_shared<VideoExportConfiguration>();


std::string VideoExportModule::moduleName() const
{
    std::cerr << "[DBG vm.c] modname \n";
    return "iex_videoexport";
}

/*static void videoexport_init_qrc()
{
    Q_INIT_RESOURCE(videoexport);
}
void VideoExportModule::registerResources()
{
    videoexport_init_qrc();
}*/

void VideoExportModule::registerExports()
{
    std::cerr << "[DBG vm.c] regExp \n";
    m_configuration = std::make_shared<VideoExportConfiguration>();
ioc()->registerExport<VideoExportConfiguration>(moduleName(), m_configuration);
    ioc()->registerExport<IVideoExportConfiguration>(moduleName(), m_configuration);
}

void VideoExportModule::resolveImports()
{
    std::cerr << "[DBG vm.c] resImp \n";
    auto projectRWreg = ioc()->resolve<INotationWritersRegister>(moduleName());
    if (projectRWreg) {
        //projectRWreg->reg({ "mp4" }, std::make_shared<VideoWriter>(iocContext()));
    }
}
void VideoExportModule::onInit(const IApplication::RunMode& mode)
{
    std::cerr << "[DBG vm.c] oninit \n";
    if (mode == IApplication::RunMode::AudioPluginRegistration) {
        return;
    }

    m_configuration->init();
}

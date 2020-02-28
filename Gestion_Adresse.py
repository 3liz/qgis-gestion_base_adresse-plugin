# -*- coding: utf-8 -*-

"""
/***************************************************************************
 SpatialAnalysis
                                 A QGIS plugin
 Create SQL intersect Table
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2019-02-12
        copyright            : (C) 2019 by 3Liz
        email                : info@3liz.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

__author__ = '3Liz'
__date__ = '2020-02-25'
__copyright__ = '(C) 2019 by 3Liz'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

import os
import sys
import inspect
# Import the PyQt and QGIS libraries
from qgis.PyQt.QtCore import QFileInfo, QUrl, QFile, QDir, QSettings
from qgis.PyQt.QtWidgets import (
    QAction, QFileDialog, QMessageBox
)
from qgis.PyQt.QtGui import (
    QIcon,
    QDesktopServices,
    QStandardItemModel,
    QStandardItem
)

from qgis.core import QgsProcessingAlgorithm, QgsApplication
from .processing.provider import GestionAdresseProvider

cmd_folder = os.path.split(inspect.getfile(inspect.currentframe()))[0]

if cmd_folder not in sys.path:
    sys.path.insert(0, cmd_folder)


class GestionAdressePlugin(object):

    def __init__(self, iface):
        self.iface = iface
        self.action = None
        self.provider = GestionAdresseProvider()

    def initGui(self):
        """Create the menu entries and toolbar icons inside the QGIS GUI."""
        # Create action that will start plugin configuration
        self.action = QAction(
            QIcon(':/plugins/layer_intersecter/icon.png'),
            'Layer Intersecter', self.iface.mainWindow())
        # connect the action to the run method
        #self.action.triggered.connect(self.run)

        # Add toolbar button and menu item
        ##self.iface.addToolBarIcon(self.action)
        #self.iface.addPluginToMenu('&Layer Intersecter', self.action)
        QgsApplication.processingRegistry().addProvider(self.provider)

    def unload(self):
        # Remove the plugin menu item and icon
        ##self.iface.removePluginMenu("&Layer Intersecter",self.action)
        #self.iface.removeToolBarIcon(self.action)
        QgsApplication.processingRegistry().removeProvider(self.provider)

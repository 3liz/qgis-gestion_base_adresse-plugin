# -*- coding: utf-8 -*-
import os
from pathlib import PurePath
def getPluginPath():
    return PurePath(os.path.dirname(os.path.realpath(__file__)))

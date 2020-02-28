# Add ISO code for any locales you want to support here (space separated)
LOCALES = "fr"
# Name of the plugin, for the ZIP file
PLUGINNAME = gestion_base_adresse

help:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools help

pylint:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools pylint --ignore=

test:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools test

docker_test:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools docker_test PLUGINNAME=$(PLUGINNAME)

i18n_%:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools i18n_$* LOCALES=$(LOCALES)

release_%:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools release_$* PLUGINNAME=$(PLUGINNAME)

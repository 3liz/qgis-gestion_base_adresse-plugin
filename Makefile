# Add ISO code for any locales you want to support here (space separated)
LOCALES = "fr"
# Name of the plugin, for the ZIP file
PLUGINNAME = gestion_base_adresse

help:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools help

pylint:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools pylint --ignore=

docker_test:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools docker_test PLUGINNAME=$(PLUGINNAME)

i18n_%:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools i18n_$* LOCALES=$(LOCALES)

release_%:
	$(MAKE) -C $(PLUGINNAME)/qgis_plugin_tools release_$* PLUGINNAME=$(PLUGINNAME)

start_tests:
	@echo 'Start docker-compose'
	@cd docker && ./start.sh

run_tests:
	@echo 'Running tests, containers must be running'
	@cd docker && ./exec.sh

stop_tests:
	@echo 'Stopping/killing containers'
	@cd docker && ./stop.sh

tests: start_tests run_tests stop_tests

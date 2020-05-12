<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.15-Madeira" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" readOnly="0" minScale="1e+08" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id_doc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom_doc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_doc">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="yyyy-MM-dd" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_document">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option value="delib" name="Délibération" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_commune">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="id_com" name="Key" type="QString"/>
            <Option value="commune_702b855b_e9f4_4ff9_9f11_534481465778" name="Layer" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="commune_nom" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lien">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option value="/home/pdrillin/3liz/lizmap/projects/Adressage/media/upload" name="DefaultRoot" type="QString"/>
            <Option value="0" name="DocumentViewer" type="int"/>
            <Option value="0" name="DocumentViewerHeight" type="int"/>
            <Option value="0" name="DocumentViewerWidth" type="int"/>
            <Option value="true" name="FileWidget" type="bool"/>
            <Option value="true" name="FileWidgetButton" type="bool"/>
            <Option value="" name="FileWidgetFilter" type="QString"/>
            <Option name="PropertyCollection" type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
            <Option value="1" name="RelativeStorage" type="int"/>
            <Option value="0" name="StorageMode" type="int"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id_doc" name="" index="0"/>
    <alias field="nom_doc" name="Nom du document" index="1"/>
    <alias field="date_doc" name="Date du document" index="2"/>
    <alias field="type_document" name="Type du document" index="3"/>
    <alias field="id_commune" name="Commune" index="4"/>
    <alias field="lien" name="Lien document" index="5"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="id_doc" applyOnUpdate="0"/>
    <default expression="" field="nom_doc" applyOnUpdate="0"/>
    <default expression="" field="date_doc" applyOnUpdate="0"/>
    <default expression="" field="type_document" applyOnUpdate="0"/>
    <default expression="" field="id_commune" applyOnUpdate="0"/>
    <default expression="" field="lien" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="id_doc" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint constraints="0" field="nom_doc" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="date_doc" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="type_document" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="id_commune" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="lien" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id_doc" exp=""/>
    <constraint desc="" field="nom_doc" exp=""/>
    <constraint desc="" field="date_doc" exp=""/>
    <constraint desc="" field="type_document" exp=""/>
    <constraint desc="" field="id_commune" exp=""/>
    <constraint desc="" field="lien" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column hidden="0" name="id_doc" width="-1" type="field"/>
      <column hidden="0" name="nom_doc" width="-1" type="field"/>
      <column hidden="0" name="date_doc" width="-1" type="field"/>
      <column hidden="0" name="type_document" width="-1" type="field"/>
      <column hidden="0" name="id_commune" width="-1" type="field"/>
      <column hidden="0" name="lien" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
Les formulaires QGIS peuvent avoir une fonction Python qui sera appelée à l'ouverture du formulaire.

Utilisez cette fonction pour ajouter plus de fonctionnalités à vos formulaires.

Entrez le nom de la fonction dans le champ "Fonction d'initialisation Python".
Voici un exemple à suivre:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")

]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorField name="id_doc" index="0" showLabel="1"/>
    <attributeEditorField name="nom_doc" index="1" showLabel="1"/>
    <attributeEditorField name="date_doc" index="2" showLabel="1"/>
    <attributeEditorField name="type_document" index="3" showLabel="1"/>
    <attributeEditorField name="id_commune" index="4" showLabel="1"/>
    <attributeEditorField name="lien" index="5" showLabel="1"/>
  </attributeEditorForm>
  <editable>
    <field editable="0" name="date_doc"/>
    <field editable="1" name="id_commune"/>
    <field editable="0" name="id_doc"/>
    <field editable="1" name="lien"/>
    <field editable="1" name="nom_doc"/>
    <field editable="1" name="type_document"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="date_doc"/>
    <field labelOnTop="0" name="id_commune"/>
    <field labelOnTop="0" name="id_doc"/>
    <field labelOnTop="0" name="lien"/>
    <field labelOnTop="0" name="nom_doc"/>
    <field labelOnTop="0" name="type_document"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id_doc</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>

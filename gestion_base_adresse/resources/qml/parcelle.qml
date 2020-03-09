<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" maxScale="0" simplifyMaxScale="1" version="3.4.15-Madeira" hasScaleBasedVisibilityFlag="0" minScale="1e+08" labelsEnabled="0" simplifyDrawingHints="1" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyLocal="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol force_rhr="0" alpha="1" name="0" clip_to_extent="1" type="fill">
        <layer class="SimpleFill" enabled="1" pass="0" locked="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="231,113,72,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="no"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penWidth="0" scaleDependency="Area" sizeScale="3x:0,0,0,0,0,0" minScaleDenominator="0" width="15" lineSizeType="MM" height="15" maxScaleDenominator="1e+08" sizeType="MM" scaleBasedVisibility="0" backgroundAlpha="255" lineSizeScale="3x:0,0,0,0,0,0" backgroundColor="#ffffff" rotationOffset="270" labelPlacementMethod="XHeight" opacity="1" penColor="#000000" enabled="0" barWidth="5" minimumSize="0" diagramOrientation="Up" penAlpha="255">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" placement="1" obstacle="0" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="commune">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="prefixe">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="section">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="numero">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="contenance">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="arpente">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="created">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="updated">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="fid" name="" index="0"/>
    <alias field="id" name="" index="1"/>
    <alias field="commune" name="" index="2"/>
    <alias field="prefixe" name="" index="3"/>
    <alias field="section" name="" index="4"/>
    <alias field="numero" name="" index="5"/>
    <alias field="contenance" name="" index="6"/>
    <alias field="arpente" name="" index="7"/>
    <alias field="created" name="" index="8"/>
    <alias field="updated" name="" index="9"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="fid" applyOnUpdate="0" expression=""/>
    <default field="id" applyOnUpdate="0" expression=""/>
    <default field="commune" applyOnUpdate="0" expression=""/>
    <default field="prefixe" applyOnUpdate="0" expression=""/>
    <default field="section" applyOnUpdate="0" expression=""/>
    <default field="numero" applyOnUpdate="0" expression=""/>
    <default field="contenance" applyOnUpdate="0" expression=""/>
    <default field="arpente" applyOnUpdate="0" expression=""/>
    <default field="created" applyOnUpdate="0" expression=""/>
    <default field="updated" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" field="fid" constraints="3" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="commune" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="prefixe" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="section" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="numero" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="contenance" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="arpente" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="created" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="updated" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="fid"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="commune"/>
    <constraint exp="" desc="" field="prefixe"/>
    <constraint exp="" desc="" field="section"/>
    <constraint exp="" desc="" field="numero"/>
    <constraint exp="" desc="" field="contenance"/>
    <constraint exp="" desc="" field="arpente"/>
    <constraint exp="" desc="" field="created"/>
    <constraint exp="" desc="" field="updated"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" width="-1" name="fid" type="field"/>
      <column hidden="0" width="-1" name="id" type="field"/>
      <column hidden="0" width="-1" name="commune" type="field"/>
      <column hidden="0" width="-1" name="prefixe" type="field"/>
      <column hidden="0" width="-1" name="section" type="field"/>
      <column hidden="0" width="-1" name="numero" type="field"/>
      <column hidden="0" width="-1" name="contenance" type="field"/>
      <column hidden="0" width="-1" name="arpente" type="field"/>
      <column hidden="0" width="-1" name="created" type="field"/>
      <column hidden="0" width="-1" name="updated" type="field"/>
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
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="arpente" editable="1"/>
    <field name="commune" editable="1"/>
    <field name="contenance" editable="1"/>
    <field name="created" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="id" editable="1"/>
    <field name="numero" editable="1"/>
    <field name="prefixe" editable="1"/>
    <field name="section" editable="1"/>
    <field name="updated" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="arpente"/>
    <field labelOnTop="0" name="commune"/>
    <field labelOnTop="0" name="contenance"/>
    <field labelOnTop="0" name="created"/>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="numero"/>
    <field labelOnTop="0" name="prefixe"/>
    <field labelOnTop="0" name="section"/>
    <field labelOnTop="0" name="updated"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>fid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>

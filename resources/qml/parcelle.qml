<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" labelsEnabled="0" simplifyMaxScale="1" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyLocal="0" minScale="1e+08" readOnly="0" simplifyDrawingTol="1" version="3.4.15-Madeira" styleCategories="AllStyleCategories" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" type="singleSymbol" forceraster="0" enableorderby="0">
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" type="fill" name="0">
        <layer pass="0" enabled="1" class="SimpleFill" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="231,113,72,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
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
    <DiagramCategory maxScaleDenominator="1e+08" lineSizeScale="3x:0,0,0,0,0,0" penWidth="0" scaleBasedVisibility="0" sizeScale="3x:0,0,0,0,0,0" minimumSize="0" backgroundColor="#ffffff" scaleDependency="Area" minScaleDenominator="0" penColor="#000000" diagramOrientation="Up" enabled="0" barWidth="5" rotationOffset="270" height="15" lineSizeType="MM" sizeType="MM" opacity="1" width="15" labelPlacementMethod="XHeight" penAlpha="255" backgroundAlpha="255">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" obstacle="0" dist="0" showAll="1" placement="1" linePlacementFlags="18" zIndex="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
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
    <alias index="0" name="" field="fid"/>
    <alias index="1" name="" field="id"/>
    <alias index="2" name="" field="commune"/>
    <alias index="3" name="" field="prefixe"/>
    <alias index="4" name="" field="section"/>
    <alias index="5" name="" field="numero"/>
    <alias index="6" name="" field="contenance"/>
    <alias index="7" name="" field="arpente"/>
    <alias index="8" name="" field="created"/>
    <alias index="9" name="" field="updated"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="fid" applyOnUpdate="0"/>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="" field="commune" applyOnUpdate="0"/>
    <default expression="" field="prefixe" applyOnUpdate="0"/>
    <default expression="" field="section" applyOnUpdate="0"/>
    <default expression="" field="numero" applyOnUpdate="0"/>
    <default expression="" field="contenance" applyOnUpdate="0"/>
    <default expression="" field="arpente" applyOnUpdate="0"/>
    <default expression="" field="created" applyOnUpdate="0"/>
    <default expression="" field="updated" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" field="fid" exp_strength="0" unique_strength="1"/>
    <constraint notnull_strength="0" constraints="0" field="id" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="commune" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="prefixe" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="section" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="numero" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="contenance" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="arpente" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="created" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="updated" exp_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="fid" exp="" desc=""/>
    <constraint field="id" exp="" desc=""/>
    <constraint field="commune" exp="" desc=""/>
    <constraint field="prefixe" exp="" desc=""/>
    <constraint field="section" exp="" desc=""/>
    <constraint field="numero" exp="" desc=""/>
    <constraint field="contenance" exp="" desc=""/>
    <constraint field="arpente" exp="" desc=""/>
    <constraint field="created" exp="" desc=""/>
    <constraint field="updated" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="-1" type="field" name="fid" hidden="0"/>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="commune" hidden="0"/>
      <column width="-1" type="field" name="prefixe" hidden="0"/>
      <column width="-1" type="field" name="section" hidden="0"/>
      <column width="-1" type="field" name="numero" hidden="0"/>
      <column width="-1" type="field" name="contenance" hidden="0"/>
      <column width="-1" type="field" name="arpente" hidden="0"/>
      <column width="-1" type="field" name="created" hidden="0"/>
      <column width="-1" type="field" name="updated" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <field editable="1" name="arpente"/>
    <field editable="1" name="commune"/>
    <field editable="1" name="contenance"/>
    <field editable="1" name="created"/>
    <field editable="1" name="fid"/>
    <field editable="1" name="id"/>
    <field editable="1" name="numero"/>
    <field editable="1" name="prefixe"/>
    <field editable="1" name="section"/>
    <field editable="1" name="updated"/>
  </editable>
  <labelOnTop>
    <field name="arpente" labelOnTop="0"/>
    <field name="commune" labelOnTop="0"/>
    <field name="contenance" labelOnTop="0"/>
    <field name="created" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="numero" labelOnTop="0"/>
    <field name="prefixe" labelOnTop="0"/>
    <field name="section" labelOnTop="0"/>
    <field name="updated" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>fid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>

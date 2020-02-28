<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" maxScale="0" minScale="1e+08" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="1" simplifyMaxScale="1" version="3.4.15-Madeira" labelsEnabled="1" simplifyDrawingTol="1" simplifyLocal="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule label="Verrouillée" filter=" &quot;statut_voie_num&quot; " key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}" symbol="0"/>
      <rule label="Déverrouillée" filter="not &quot;statut_voie_num&quot;" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}" symbol="1"/>
    </rules>
    <symbols>
      <symbol name="0" clip_to_extent="1" alpha="1" type="line" force_rhr="0">
        <layer class="SimpleLine" enabled="1" pass="0" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,159,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" clip_to_extent="1" alpha="1" type="line" force_rhr="0">
        <layer class="SimpleLine" enabled="1" pass="0" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="211,0,3,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.66"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
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
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{2c32481f-842f-41cc-bcc4-9741f405fd14}">
      <rule scalemaxdenom="10000" filter="Not  &quot;statut_voie_num&quot; " scalemindenom="1" key="{564ea356-37b3-4c84-9187-b7468f9c2adf}">
        <settings>
          <text-style fontCapitals="0" fontWordSpacing="0" previewBkgrdColor="#ffffff" fontLetterSpacing="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" multilineHeight="1" fontItalic="0" useSubstitutions="0" fontSize="10" fontFamily="Ubuntu" fontWeight="50" blendMode="0" textOpacity="1" textColor="211,0,3,255" namedStyle="Regular" fontSizeUnit="Point" fontStrikeout="0" isExpression="0" fontUnderline="0" fieldName="nom_complet">
            <text-buffer bufferSize="1" bufferDraw="1" bufferOpacity="1" bufferNoFill="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferSizeUnits="MM" bufferJoinStyle="128" bufferColor="255,255,255,255"/>
            <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeJoinStyle="64" shapeBlendMode="0" shapeType="0" shapeSVGFile="" shapeSizeX="0" shapeRadiiY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeSizeType="0" shapeRadiiX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeOffsetUnit="MM" shapeSizeUnit="MM" shapeOpacity="1" shapeDraw="0" shapeSizeY="0" shapeRotation="0" shapeBorderWidth="0" shapeOffsetY="0" shapeOffsetX="0" shapeBorderWidthUnit="MM"/>
            <shadow shadowRadius="1.5" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowBlendMode="6" shadowUnder="0" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0"/>
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="4294967295" plussign="0" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" leftDirectionSymbol="&lt;" rightDirectionSymbol=">" reverseDirectionSymbol="0" addDirectionSymbol="0" decimals="3" wrapChar=""/>
          <placement offsetType="0" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" maxCurvedCharAngleIn="25" placement="2" yOffset="0" centroidInside="0" quadOffset="4" repeatDistanceUnits="MM" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" centroidWhole="0" dist="0" rotationAngle="0" xOffset="0" preserveRotation="1" repeatDistance="0" distUnits="MM" fitInPolygonOnly="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" offsetUnits="MM"/>
          <rendering obstacleFactor="1" scaleVisibility="0" drawLabels="1" fontLimitPixelSize="0" fontMinPixelSize="3" limitNumLabels="0" upsidedownLabels="0" scaleMin="0" obstacle="1" obstacleType="0" labelPerPart="0" zIndex="0" minFeatureSize="0" mergeLines="0" scaleMax="0" maxNumLabels="2000" displayAll="0" fontMaxPixelSize="10000"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property value="id_voie" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory width="15" minimumSize="0" penAlpha="255" opacity="1" labelPlacementMethod="XHeight" lineSizeType="MM" sizeScale="3x:0,0,0,0,0,0" maxScaleDenominator="1e+08" barWidth="5" minScaleDenominator="0" penColor="#000000" backgroundAlpha="255" sizeType="MM" scaleDependency="Area" rotationOffset="270" penWidth="0" scaleBasedVisibility="0" backgroundColor="#ffffff" enabled="0" diagramOrientation="Up" height="15" lineSizeScale="3x:0,0,0,0,0,0">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" zIndex="0" priority="0" linePlacementFlags="18" placement="2" showAll="1" obstacle="0">
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
    <field name="id_voie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typologie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom_complet">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_num">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="Classique" value="Classique" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="Métrique" value="Metrique" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="statut_voie_num">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="Verrouillée" value="true" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="Déverrouillée" value="false" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="statut_voie">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="Validée" value="true" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="En cours de validation" value="false" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sens">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_voie">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_point">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="2147483647" type="int"/>
            <Option name="Min" value="-2147483648" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_creation">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_modif">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="longueur">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="2147483647" type="int"/>
            <Option name="Min" value="-2147483648" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_fantoir">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="2147483647" type="int"/>
            <Option name="Min" value="-2147483648" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="delib">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="communes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="insee">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant" field="id_voie" index="0"/>
    <alias name="Typologie" field="typologie" index="1"/>
    <alias name="Nom de la voie" field="nom" index="2"/>
    <alias name="Nom complet" field="nom_complet" index="3"/>
    <alias name="Type de numérotation" field="type_num" index="4"/>
    <alias name="Statut" field="statut_voie_num" index="5"/>
    <alias name="Validation de la voie" field="statut_voie" index="6"/>
    <alias name="Inverser le sens ?" field="sens" index="7"/>
    <alias name="La plaque est à acheté" field="achat_plaque_voie" index="8"/>
    <alias name="Nombre de points liés à cette voie" field="nb_point" index="9"/>
    <alias name="Créateur de la voie" field="createur" index="10"/>
    <alias name="Date de création" field="date_creation" index="11"/>
    <alias name="Modificateur de la voie" field="modificateur" index="12"/>
    <alias name="Date de modification" field="date_modif" index="13"/>
    <alias name="Longueur (en m)" field="longueur" index="14"/>
    <alias name="Code fantoir" field="code_fantoir" index="15"/>
    <alias name="Délibération de la voie" field="delib" index="16"/>
    <alias name="Communes" field="communes" index="17"/>
    <alias name="Codes INSEE" field="insee" index="18"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id_voie" expression="" applyOnUpdate="0"/>
    <default field="typologie" expression="" applyOnUpdate="0"/>
    <default field="nom" expression="" applyOnUpdate="0"/>
    <default field="nom_complet" expression="" applyOnUpdate="0"/>
    <default field="type_num" expression="" applyOnUpdate="0"/>
    <default field="statut_voie_num" expression="" applyOnUpdate="0"/>
    <default field="statut_voie" expression="" applyOnUpdate="0"/>
    <default field="sens" expression="" applyOnUpdate="0"/>
    <default field="achat_plaque_voie" expression="" applyOnUpdate="0"/>
    <default field="nb_point" expression="" applyOnUpdate="0"/>
    <default field="createur" expression="" applyOnUpdate="0"/>
    <default field="date_creation" expression="" applyOnUpdate="0"/>
    <default field="modificateur" expression="" applyOnUpdate="0"/>
    <default field="date_modif" expression="" applyOnUpdate="0"/>
    <default field="longueur" expression="" applyOnUpdate="0"/>
    <default field="code_fantoir" expression="" applyOnUpdate="0"/>
    <default field="delib" expression="" applyOnUpdate="0"/>
    <default field="communes" expression="" applyOnUpdate="0"/>
    <default field="insee" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="id_voie" constraints="3" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="typologie" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="nom" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="nom_complet" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="type_num" constraints="1" notnull_strength="2" exp_strength="0"/>
    <constraint unique_strength="0" field="statut_voie_num" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="statut_voie" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="sens" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="achat_plaque_voie" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="nb_point" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="createur" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="date_creation" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="modificateur" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="date_modif" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="longueur" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="code_fantoir" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="delib" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="communes" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="insee" constraints="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id_voie" exp="" desc=""/>
    <constraint field="typologie" exp="" desc=""/>
    <constraint field="nom" exp="" desc=""/>
    <constraint field="nom_complet" exp="" desc=""/>
    <constraint field="type_num" exp="" desc=""/>
    <constraint field="statut_voie_num" exp="" desc=""/>
    <constraint field="statut_voie" exp="" desc=""/>
    <constraint field="sens" exp="" desc=""/>
    <constraint field="achat_plaque_voie" exp="" desc=""/>
    <constraint field="nb_point" exp="" desc=""/>
    <constraint field="createur" exp="" desc=""/>
    <constraint field="date_creation" exp="" desc=""/>
    <constraint field="modificateur" exp="" desc=""/>
    <constraint field="date_modif" exp="" desc=""/>
    <constraint field="longueur" exp="" desc=""/>
    <constraint field="code_fantoir" exp="" desc=""/>
    <constraint field="delib" exp="" desc=""/>
    <constraint field="communes" exp="" desc=""/>
    <constraint field="insee" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column name="id_voie" width="-1" type="field" hidden="0"/>
      <column name="typologie" width="-1" type="field" hidden="0"/>
      <column name="nom" width="-1" type="field" hidden="0"/>
      <column name="nom_complet" width="-1" type="field" hidden="0"/>
      <column name="type_num" width="-1" type="field" hidden="0"/>
      <column name="statut_voie_num" width="-1" type="field" hidden="0"/>
      <column name="statut_voie" width="124" type="field" hidden="0"/>
      <column name="sens" width="107" type="field" hidden="0"/>
      <column name="achat_plaque_voie" width="-1" type="field" hidden="0"/>
      <column name="nb_point" width="-1" type="field" hidden="0"/>
      <column name="createur" width="-1" type="field" hidden="0"/>
      <column name="date_creation" width="-1" type="field" hidden="0"/>
      <column name="modificateur" width="-1" type="field" hidden="0"/>
      <column name="date_modif" width="-1" type="field" hidden="0"/>
      <column name="longueur" width="-1" type="field" hidden="0"/>
      <column name="code_fantoir" width="-1" type="field" hidden="0"/>
      <column name="delib" width="-1" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column name="communes" width="-1" type="field" hidden="0"/>
      <column name="insee" width="-1" type="field" hidden="0"/>
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
    <attributeEditorContainer showLabel="1" visibilityExpression="" name="Voie" visibilityExpressionEnabled="0" groupBox="0" columnCount="1">
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Création d'une voie" visibilityExpressionEnabled="0" groupBox="1" columnCount="1">
        <attributeEditorField showLabel="1" name="id_voie" index="0"/>
        <attributeEditorField showLabel="1" name="typologie" index="1"/>
        <attributeEditorField showLabel="1" name="nom" index="2"/>
        <attributeEditorField showLabel="1" name="nom_complet" index="3"/>
        <attributeEditorField showLabel="1" name="type_num" index="4"/>
        <attributeEditorField showLabel="1" name="statut_voie_num" index="5"/>
        <attributeEditorField showLabel="1" name="statut_voie" index="6"/>
        <attributeEditorField showLabel="1" name="sens" index="7"/>
        <attributeEditorField showLabel="1" name="achat_plaque_voie" index="8"/>
        <attributeEditorField showLabel="1" name="delib" index="16"/>
        <attributeEditorField showLabel="1" name="nb_point" index="9"/>
        <attributeEditorField showLabel="1" name="longueur" index="14"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Commune" visibilityExpressionEnabled="0" groupBox="1" columnCount="1">
        <attributeEditorField showLabel="1" name="communes" index="17"/>
        <attributeEditorField showLabel="1" name="insee" index="18"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Utilisateurs" visibilityExpressionEnabled="0" groupBox="1" columnCount="1">
        <attributeEditorField showLabel="1" name="createur" index="10"/>
        <attributeEditorField showLabel="1" name="date_creation" index="11"/>
        <attributeEditorField showLabel="1" name="modificateur" index="12"/>
        <attributeEditorField showLabel="1" name="date_modif" index="13"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="achat_plaque_voie" editable="1"/>
    <field name="code_fantoir" editable="0"/>
    <field name="communes" editable="0"/>
    <field name="createur" editable="1"/>
    <field name="date_creation" editable="0"/>
    <field name="date_modif" editable="0"/>
    <field name="delib" editable="1"/>
    <field name="id_voie" editable="1"/>
    <field name="insee" editable="0"/>
    <field name="longueur" editable="1"/>
    <field name="modificateur" editable="1"/>
    <field name="nb_point" editable="0"/>
    <field name="nom" editable="1"/>
    <field name="nom_complet" editable="1"/>
    <field name="sens" editable="1"/>
    <field name="statut_voie" editable="1"/>
    <field name="statut_voie_num" editable="1"/>
    <field name="type_num" editable="1"/>
    <field name="typologie" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="achat_plaque_voie" labelOnTop="0"/>
    <field name="code_fantoir" labelOnTop="0"/>
    <field name="communes" labelOnTop="0"/>
    <field name="createur" labelOnTop="0"/>
    <field name="date_creation" labelOnTop="0"/>
    <field name="date_modif" labelOnTop="0"/>
    <field name="delib" labelOnTop="0"/>
    <field name="id_voie" labelOnTop="0"/>
    <field name="insee" labelOnTop="0"/>
    <field name="longueur" labelOnTop="0"/>
    <field name="modificateur" labelOnTop="0"/>
    <field name="nb_point" labelOnTop="0"/>
    <field name="nom" labelOnTop="0"/>
    <field name="nom_complet" labelOnTop="0"/>
    <field name="sens" labelOnTop="0"/>
    <field name="statut_voie" labelOnTop="0"/>
    <field name="statut_voie_num" labelOnTop="0"/>
    <field name="type_num" labelOnTop="0"/>
    <field name="typologie" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="point_adre_id_voie_voie_61bde_id_voie">
      <config type="Map">
        <Option name="nm-rel" value="" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>nom_complet</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

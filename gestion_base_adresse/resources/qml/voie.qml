<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" version="3.4.15-Madeira" hasScaleBasedVisibilityFlag="0" maxScale="0" simplifyDrawingTol="1" simplifyLocal="0" styleCategories="AllStyleCategories" simplifyMaxScale="1" minScale="1e+08" simplifyDrawingHints="1" readOnly="0" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" enableorderby="0" symbollevels="0" forceraster="0">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule filter=" &quot;statut_voie_num&quot; " label="Verrouillée" symbol="0" key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}"/>
      <rule filter="not &quot;statut_voie_num&quot;" label="Déverrouillée" symbol="1" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}"/>
    </rules>
    <symbols>
      <symbol name="0" type="line" force_rhr="0" clip_to_extent="1" alpha="1">
        <layer class="SimpleLine" pass="0" enabled="1" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,159,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" type="line" force_rhr="0" clip_to_extent="1" alpha="1">
        <layer class="SimpleLine" pass="0" enabled="1" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="211,0,3,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.66" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
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
    <rules key="{b9a2d3ff-17c7-4225-bed5-76602dea2b10}">
      <rule filter="Not  &quot;statut_voie_num&quot; " scalemaxdenom="10000" key="{9fbf9836-44ce-40ce-b37c-ad035ebacc50}" scalemindenom="1">
        <settings>
          <text-style fontSizeUnit="Point" textColor="211,0,3,255" fontStrikeout="0" fontWordSpacing="0" isExpression="0" textOpacity="1" multilineHeight="1" fieldName="nom_complet" fontWeight="50" previewBkgrdColor="#ffffff" namedStyle="Regular" fontSize="10" fontCapitals="0" fontLetterSpacing="0" useSubstitutions="0" fontUnderline="0" fontItalic="0" fontFamily="Ubuntu" fontSizeMapUnitScale="3x:0,0,0,0,0,0" blendMode="0">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferSize="1" bufferNoFill="1" bufferDraw="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeUnits="MM" bufferColor="255,255,255,255"/>
            <background shapeSizeType="0" shapeOffsetY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeRadiiY="0" shapeDraw="0" shapeType="0" shapeBorderWidth="0" shapeSVGFile="" shapeSizeUnit="MM" shapeOffsetX="0" shapeBorderWidthUnit="MM" shapeJoinStyle="64" shapeRadiiX="0" shapeSizeX="0" shapeRadiiUnit="MM" shapeBlendMode="0" shapeSizeY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeOpacity="1" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeFillColor="255,255,255,255"/>
            <shadow shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowScale="100" shadowOffsetDist="1" shadowOpacity="0.7" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowColor="0,0,0,255"/>
            <substitutions/>
          </text-style>
          <text-format decimals="3" placeDirectionSymbol="0" plussign="0" wrapChar="" formatNumbers="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" multilineAlign="4294967295" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" autoWrapLength="0" addDirectionSymbol="0"/>
          <placement yOffset="0" maxCurvedCharAngleOut="-25" centroidInside="0" repeatDistanceUnits="MM" centroidWhole="0" distUnits="MM" offsetType="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placement="2" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" priority="5" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0" dist="0" maxCurvedCharAngleIn="25" xOffset="0" quadOffset="4" fitInPolygonOnly="0"/>
          <rendering obstacleType="0" fontMaxPixelSize="10000" maxNumLabels="2000" fontMinPixelSize="3" upsidedownLabels="0" zIndex="0" mergeLines="0" drawLabels="1" labelPerPart="0" fontLimitPixelSize="0" obstacleFactor="1" scaleMin="0" scaleVisibility="0" obstacle="1" scaleMax="0" limitNumLabels="0" displayAll="0" minFeatureSize="0"/>
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
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory backgroundColor="#ffffff" scaleDependency="Area" minimumSize="0" barWidth="5" penWidth="0" enabled="0" maxScaleDenominator="1e+08" opacity="1" height="15" minScaleDenominator="0" diagramOrientation="Up" sizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" rotationOffset="270" backgroundAlpha="255" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" width="15" penAlpha="255" sizeType="MM" penColor="#000000">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" zIndex="0" placement="2" priority="0" dist="0" linePlacementFlags="18" obstacle="0">
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
    <field name="sens_numerotation">
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
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant" field="id_voie" index="0"/>
    <alias name="Typologie" field="typologie" index="1"/>
    <alias name="Nom de la voie" field="nom" index="2"/>
    <alias name="Nom complet" field="nom_complet" index="3"/>
    <alias name="Type de numérotation" field="type_num" index="4"/>
    <alias name="Statut" field="statut_voie_num" index="5"/>
    <alias name="Validation de la voie" field="statut_voie" index="6"/>
    <alias name="Sens de numérotation inversé ?" field="sens_numerotation" index="7"/>
    <alias name="La plaque est à acheter" field="achat_plaque_voie" index="8"/>
    <alias name="Nombre de points liés à cette voie" field="nb_point" index="9"/>
    <alias name="Créateur de la voie" field="createur" index="10"/>
    <alias name="Date de création" field="date_creation" index="11"/>
    <alias name="Modificateur de la voie" field="modificateur" index="12"/>
    <alias name="Date de modification" field="date_modif" index="13"/>
    <alias name="Longueur (en m)" field="longueur" index="14"/>
    <alias name="Code fantoir" field="code_fantoir" index="15"/>
    <alias name="Délibération de la voie" field="delib" index="16"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="id_voie" expression=""/>
    <default applyOnUpdate="0" field="typologie" expression=""/>
    <default applyOnUpdate="0" field="nom" expression=""/>
    <default applyOnUpdate="0" field="nom_complet" expression=""/>
    <default applyOnUpdate="0" field="type_num" expression=""/>
    <default applyOnUpdate="0" field="statut_voie_num" expression=""/>
    <default applyOnUpdate="0" field="statut_voie" expression=""/>
    <default applyOnUpdate="0" field="sens_numerotation" expression=""/>
    <default applyOnUpdate="0" field="achat_plaque_voie" expression=""/>
    <default applyOnUpdate="0" field="nb_point" expression=""/>
    <default applyOnUpdate="0" field="createur" expression=""/>
    <default applyOnUpdate="0" field="date_creation" expression=""/>
    <default applyOnUpdate="0" field="modificateur" expression=""/>
    <default applyOnUpdate="0" field="date_modif" expression=""/>
    <default applyOnUpdate="0" field="longueur" expression=""/>
    <default applyOnUpdate="0" field="code_fantoir" expression=""/>
    <default applyOnUpdate="0" field="delib" expression=""/>
  </defaults>
  <constraints>
    <constraint constraints="3" unique_strength="1" exp_strength="0" field="id_voie" notnull_strength="1"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="typologie" notnull_strength="1"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="nom" notnull_strength="1"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="nom_complet" notnull_strength="0"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="type_num" notnull_strength="2"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="statut_voie_num" notnull_strength="1"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="statut_voie" notnull_strength="1"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="sens_numerotation" notnull_strength="1"/>
    <constraint constraints="1" unique_strength="0" exp_strength="0" field="achat_plaque_voie" notnull_strength="1"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="nb_point" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="createur" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="date_creation" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="modificateur" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="date_modif" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="longueur" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="code_fantoir" notnull_strength="0"/>
    <constraint constraints="0" unique_strength="0" exp_strength="0" field="delib" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id_voie" exp="" desc=""/>
    <constraint field="typologie" exp="" desc=""/>
    <constraint field="nom" exp="" desc=""/>
    <constraint field="nom_complet" exp="" desc=""/>
    <constraint field="type_num" exp="" desc=""/>
    <constraint field="statut_voie_num" exp="" desc=""/>
    <constraint field="statut_voie" exp="" desc=""/>
    <constraint field="sens_numerotation" exp="" desc=""/>
    <constraint field="achat_plaque_voie" exp="" desc=""/>
    <constraint field="nb_point" exp="" desc=""/>
    <constraint field="createur" exp="" desc=""/>
    <constraint field="date_creation" exp="" desc=""/>
    <constraint field="modificateur" exp="" desc=""/>
    <constraint field="date_modif" exp="" desc=""/>
    <constraint field="longueur" exp="" desc=""/>
    <constraint field="code_fantoir" exp="" desc=""/>
    <constraint field="delib" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column name="id_voie" type="field" width="-1" hidden="0"/>
      <column name="typologie" type="field" width="-1" hidden="0"/>
      <column name="nom" type="field" width="-1" hidden="0"/>
      <column name="nom_complet" type="field" width="-1" hidden="0"/>
      <column name="type_num" type="field" width="-1" hidden="0"/>
      <column name="statut_voie_num" type="field" width="-1" hidden="0"/>
      <column name="statut_voie" type="field" width="124" hidden="0"/>
      <column name="achat_plaque_voie" type="field" width="-1" hidden="0"/>
      <column name="nb_point" type="field" width="-1" hidden="0"/>
      <column name="createur" type="field" width="-1" hidden="0"/>
      <column name="date_creation" type="field" width="-1" hidden="0"/>
      <column name="modificateur" type="field" width="-1" hidden="0"/>
      <column name="date_modif" type="field" width="-1" hidden="0"/>
      <column name="longueur" type="field" width="-1" hidden="0"/>
      <column name="code_fantoir" type="field" width="-1" hidden="0"/>
      <column name="delib" type="field" width="-1" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
      <column name="sens_numerotation" type="field" width="-1" hidden="0"/>
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
    <attributeEditorContainer columnCount="1" name="Voie" groupBox="0" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
      <attributeEditorContainer columnCount="1" name="Création d'une voie" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="id_voie" showLabel="1" index="0"/>
        <attributeEditorField name="typologie" showLabel="1" index="1"/>
        <attributeEditorField name="nom" showLabel="1" index="2"/>
        <attributeEditorField name="nom_complet" showLabel="1" index="3"/>
        <attributeEditorField name="type_num" showLabel="1" index="4"/>
        <attributeEditorField name="statut_voie_num" showLabel="1" index="5"/>
        <attributeEditorField name="statut_voie" showLabel="1" index="6"/>
        <attributeEditorField name="sens_numerotation" showLabel="1" index="7"/>
        <attributeEditorField name="achat_plaque_voie" showLabel="1" index="8"/>
        <attributeEditorField name="delib" showLabel="1" index="16"/>
        <attributeEditorField name="nb_point" showLabel="1" index="9"/>
        <attributeEditorField name="longueur" showLabel="1" index="14"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="1" name="Commune" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="communes" showLabel="1" index="-1"/>
        <attributeEditorField name="insee" showLabel="1" index="-1"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="1" name="Utilisateurs" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="createur" showLabel="1" index="10"/>
        <attributeEditorField name="date_creation" showLabel="1" index="11"/>
        <attributeEditorField name="modificateur" showLabel="1" index="12"/>
        <attributeEditorField name="date_modif" showLabel="1" index="13"/>
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
    <field name="sens_numerotation" editable="1"/>
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
    <field name="sens_numerotation" labelOnTop="0"/>
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
    <widget name="point_adre_id_voie_voie_77a8b_id_voie">
      <config type="Map">
        <Option name="nm-rel" value="" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>nom_complet</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

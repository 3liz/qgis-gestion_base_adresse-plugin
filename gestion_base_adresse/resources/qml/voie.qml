<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="0" minScale="1e+08" simplifyAlgorithm="0" maxScale="0" version="3.4.15-Madeira" styleCategories="AllStyleCategories" simplifyDrawingTol="1" readOnly="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" simplifyMaxScale="1" labelsEnabled="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="RuleRenderer">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule filter=" &quot;statut_voie_num&quot; " label="Verrouillée" symbol="0" key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}"/>
      <rule filter="not &quot;statut_voie_num&quot;" label="Déverrouillée" symbol="1" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="line" name="0">
        <layer locked="0" class="SimpleLine" pass="0" enabled="1">
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="line" name="1">
        <layer locked="0" class="SimpleLine" pass="0" enabled="1">
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{807cb6c7-3b4a-49e0-9324-88dcc5bcd112}">
      <rule filter="Not  &quot;statut_voie_num&quot; " scalemindenom="1" scalemaxdenom="10000" key="{5c254beb-8a86-469a-91a7-f8ca5b9efb30}">
        <settings>
          <text-style fontSize="10" fontLetterSpacing="0" isExpression="0" textColor="211,0,3,255" fontStrikeout="0" useSubstitutions="0" multilineHeight="1" textOpacity="1" fontUnderline="0" fontCapitals="0" fontSizeUnit="Point" previewBkgrdColor="#ffffff" fontWeight="50" fontWordSpacing="0" fieldName="nom_complet" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" blendMode="0" fontFamily="Ubuntu" namedStyle="Regular">
            <text-buffer bufferJoinStyle="128" bufferOpacity="1" bufferSizeUnits="MM" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferSize="1" bufferNoFill="1" bufferDraw="1" bufferColor="255,255,255,255"/>
            <background shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOffsetUnit="MM" shapeFillColor="255,255,255,255" shapeBlendMode="0" shapeRotationType="0" shapeSizeUnit="MM" shapeRadiiUnit="MM" shapeOffsetY="0" shapeDraw="0" shapeOpacity="1" shapeRadiiY="0" shapeType="0" shapeJoinStyle="64" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeBorderColor="128,128,128,255" shapeRotation="0" shapeOffsetX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0" shapeSVGFile="" shapeRadiiX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeSizeY="0" shapeBorderWidthUnit="MM"/>
            <shadow shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetGlobal="1" shadowBlendMode="6" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOpacity="0.7" shadowColor="0,0,0,255" shadowDraw="0" shadowOffsetAngle="135" shadowScale="100"/>
            <substitutions/>
          </text-style>
          <text-format rightDirectionSymbol=">" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" formatNumbers="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="4294967295" decimals="3" addDirectionSymbol="0" reverseDirectionSymbol="0" plussign="0"/>
          <placement maxCurvedCharAngleOut="-25" priority="5" quadOffset="4" preserveRotation="1" placement="2" repeatDistance="0" repeatDistanceUnits="MM" distUnits="MM" maxCurvedCharAngleIn="25" centroidInside="0" distMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" fitInPolygonOnly="0" yOffset="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placementFlags="10" dist="0" rotationAngle="0" offsetType="0" offsetUnits="MM"/>
          <rendering fontMaxPixelSize="10000" scaleVisibility="0" upsidedownLabels="0" fontLimitPixelSize="0" displayAll="0" maxNumLabels="2000" zIndex="0" scaleMax="0" fontMinPixelSize="3" obstacle="1" mergeLines="0" minFeatureSize="0" labelPerPart="0" obstacleType="0" limitNumLabels="0" scaleMin="0" obstacleFactor="1" drawLabels="1"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
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
    <DiagramCategory maxScaleDenominator="1e+08" enabled="0" diagramOrientation="Up" width="15" penWidth="0" minScaleDenominator="0" backgroundAlpha="255" minimumSize="0" sizeScale="3x:0,0,0,0,0,0" lineSizeScale="3x:0,0,0,0,0,0" penAlpha="255" sizeType="MM" opacity="1" labelPlacementMethod="XHeight" height="15" rotationOffset="270" scaleDependency="Area" lineSizeType="MM" backgroundColor="#ffffff" penColor="#000000" scaleBasedVisibility="0" barWidth="5">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" field="" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" placement="2" linePlacementFlags="18" showAll="1" obstacle="0" zIndex="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
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
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typologie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom_complet">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_num">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Classique" name="Classique"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Metrique" name="Métrique"/>
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
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="true" name="Verrouillée"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="false" name="Déverrouillée"/>
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
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="true" name="Validée"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="false" name="En cours de validation"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sens_numerotation">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="0" name="Droite"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="1" name="Gauche"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_voie">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" value="" name="CheckedState"/>
            <Option type="QString" value="" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_point">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="AllowNull"/>
            <Option type="int" value="2147483647" name="Max"/>
            <Option type="int" value="-2147483648" name="Min"/>
            <Option type="int" value="0" name="Precision"/>
            <Option type="int" value="1" name="Step"/>
            <Option type="QString" value="SpinBox" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_creation">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="yyyy-MM-dd" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_modif">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="yyyy-MM-dd" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="longueur">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="AllowNull"/>
            <Option type="int" value="2147483647" name="Max"/>
            <Option type="int" value="-2147483648" name="Min"/>
            <Option type="int" value="0" name="Precision"/>
            <Option type="int" value="1" name="Step"/>
            <Option type="QString" value="SpinBox" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_fantoir">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="AllowNull"/>
            <Option type="int" value="2147483647" name="Max"/>
            <Option type="int" value="-2147483648" name="Min"/>
            <Option type="int" value="0" name="Precision"/>
            <Option type="int" value="1" name="Step"/>
            <Option type="QString" value="SpinBox" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="delib">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" value="" name="CheckedState"/>
            <Option type="QString" value="" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="id_voie" name="Identifiant"/>
    <alias index="1" field="typologie" name="Typologie"/>
    <alias index="2" field="nom" name="Nom de la voie"/>
    <alias index="3" field="nom_complet" name="Nom complet"/>
    <alias index="4" field="type_num" name="Type de numérotation"/>
    <alias index="5" field="statut_voie_num" name="Statut"/>
    <alias index="6" field="statut_voie" name="Validation de la voie"/>
    <alias index="7" field="sens_numerotation" name="Position des nombres pairs"/>
    <alias index="8" field="achat_plaque_voie" name="La plaque est à acheter"/>
    <alias index="9" field="nb_point" name="Nombre de points liés à cette voie"/>
    <alias index="10" field="createur" name="Créateur de la voie"/>
    <alias index="11" field="date_creation" name="Date de création"/>
    <alias index="12" field="modificateur" name="Modificateur de la voie"/>
    <alias index="13" field="date_modif" name="Date de modification"/>
    <alias index="14" field="longueur" name="Longueur (en m)"/>
    <alias index="15" field="code_fantoir" name="Code fantoir"/>
    <alias index="16" field="delib" name="Délibération de la voie"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id_voie" applyOnUpdate="0" expression=""/>
    <default field="typologie" applyOnUpdate="0" expression=""/>
    <default field="nom" applyOnUpdate="0" expression=""/>
    <default field="nom_complet" applyOnUpdate="0" expression=""/>
    <default field="type_num" applyOnUpdate="0" expression=""/>
    <default field="statut_voie_num" applyOnUpdate="0" expression=""/>
    <default field="statut_voie" applyOnUpdate="0" expression=""/>
    <default field="sens_numerotation" applyOnUpdate="0" expression=""/>
    <default field="achat_plaque_voie" applyOnUpdate="0" expression=""/>
    <default field="nb_point" applyOnUpdate="0" expression=""/>
    <default field="createur" applyOnUpdate="0" expression=""/>
    <default field="date_creation" applyOnUpdate="0" expression=""/>
    <default field="modificateur" applyOnUpdate="0" expression=""/>
    <default field="date_modif" applyOnUpdate="0" expression=""/>
    <default field="longueur" applyOnUpdate="0" expression=""/>
    <default field="code_fantoir" applyOnUpdate="0" expression=""/>
    <default field="delib" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" notnull_strength="1" field="id_voie" constraints="3" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="typologie" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="nom" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="nom_complet" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="2" field="type_num" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="statut_voie_num" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="statut_voie" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="sens_numerotation" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="1" field="achat_plaque_voie" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="nb_point" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="createur" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="date_creation" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="modificateur" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="date_modif" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="longueur" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="code_fantoir" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" notnull_strength="0" field="delib" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id_voie" exp=""/>
    <constraint desc="" field="typologie" exp=""/>
    <constraint desc="" field="nom" exp=""/>
    <constraint desc="" field="nom_complet" exp=""/>
    <constraint desc="" field="type_num" exp=""/>
    <constraint desc="" field="statut_voie_num" exp=""/>
    <constraint desc="" field="statut_voie" exp=""/>
    <constraint desc="" field="sens_numerotation" exp=""/>
    <constraint desc="" field="achat_plaque_voie" exp=""/>
    <constraint desc="" field="nb_point" exp=""/>
    <constraint desc="" field="createur" exp=""/>
    <constraint desc="" field="date_creation" exp=""/>
    <constraint desc="" field="modificateur" exp=""/>
    <constraint desc="" field="date_modif" exp=""/>
    <constraint desc="" field="longueur" exp=""/>
    <constraint desc="" field="code_fantoir" exp=""/>
    <constraint desc="" field="delib" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="-1" type="field" name="id_voie" hidden="0"/>
      <column width="-1" type="field" name="typologie" hidden="0"/>
      <column width="-1" type="field" name="nom" hidden="0"/>
      <column width="-1" type="field" name="nom_complet" hidden="0"/>
      <column width="-1" type="field" name="type_num" hidden="0"/>
      <column width="-1" type="field" name="statut_voie_num" hidden="0"/>
      <column width="124" type="field" name="statut_voie" hidden="0"/>
      <column width="-1" type="field" name="achat_plaque_voie" hidden="0"/>
      <column width="-1" type="field" name="nb_point" hidden="0"/>
      <column width="-1" type="field" name="createur" hidden="0"/>
      <column width="-1" type="field" name="date_creation" hidden="0"/>
      <column width="-1" type="field" name="modificateur" hidden="0"/>
      <column width="-1" type="field" name="date_modif" hidden="0"/>
      <column width="-1" type="field" name="longueur" hidden="0"/>
      <column width="-1" type="field" name="code_fantoir" hidden="0"/>
      <column width="-1" type="field" name="delib" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="sens_numerotation" hidden="0"/>
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
    <attributeEditorContainer groupBox="0" showLabel="1" columnCount="1" name="Voie" visibilityExpressionEnabled="0" visibilityExpression="">
      <attributeEditorContainer groupBox="1" showLabel="1" columnCount="1" name="Création d'une voie" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField showLabel="1" index="0" name="id_voie"/>
        <attributeEditorField showLabel="1" index="1" name="typologie"/>
        <attributeEditorField showLabel="1" index="2" name="nom"/>
        <attributeEditorField showLabel="1" index="3" name="nom_complet"/>
        <attributeEditorField showLabel="1" index="4" name="type_num"/>
        <attributeEditorField showLabel="1" index="5" name="statut_voie_num"/>
        <attributeEditorField showLabel="1" index="6" name="statut_voie"/>
        <attributeEditorField showLabel="1" index="7" name="sens_numerotation"/>
        <attributeEditorField showLabel="1" index="8" name="achat_plaque_voie"/>
        <attributeEditorField showLabel="1" index="16" name="delib"/>
        <attributeEditorField showLabel="1" index="9" name="nb_point"/>
        <attributeEditorField showLabel="1" index="14" name="longueur"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" showLabel="1" columnCount="1" name="Commune" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField showLabel="1" index="-1" name="communes"/>
        <attributeEditorField showLabel="1" index="-1" name="insee"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" showLabel="1" columnCount="1" name="Utilisateurs" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField showLabel="1" index="10" name="createur"/>
        <attributeEditorField showLabel="1" index="11" name="date_creation"/>
        <attributeEditorField showLabel="1" index="12" name="modificateur"/>
        <attributeEditorField showLabel="1" index="13" name="date_modif"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="achat_plaque_voie"/>
    <field editable="0" name="code_fantoir"/>
    <field editable="0" name="communes"/>
    <field editable="1" name="createur"/>
    <field editable="0" name="date_creation"/>
    <field editable="0" name="date_modif"/>
    <field editable="1" name="delib"/>
    <field editable="1" name="id_voie"/>
    <field editable="0" name="insee"/>
    <field editable="1" name="longueur"/>
    <field editable="1" name="modificateur"/>
    <field editable="0" name="nb_point"/>
    <field editable="1" name="nom"/>
    <field editable="1" name="nom_complet"/>
    <field editable="1" name="sens"/>
    <field editable="1" name="sens_numerotation"/>
    <field editable="1" name="statut_voie"/>
    <field editable="1" name="statut_voie_num"/>
    <field editable="1" name="type_num"/>
    <field editable="1" name="typologie"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="achat_plaque_voie"/>
    <field labelOnTop="0" name="code_fantoir"/>
    <field labelOnTop="0" name="communes"/>
    <field labelOnTop="0" name="createur"/>
    <field labelOnTop="0" name="date_creation"/>
    <field labelOnTop="0" name="date_modif"/>
    <field labelOnTop="0" name="delib"/>
    <field labelOnTop="0" name="id_voie"/>
    <field labelOnTop="0" name="insee"/>
    <field labelOnTop="0" name="longueur"/>
    <field labelOnTop="0" name="modificateur"/>
    <field labelOnTop="0" name="nb_point"/>
    <field labelOnTop="0" name="nom"/>
    <field labelOnTop="0" name="nom_complet"/>
    <field labelOnTop="0" name="sens"/>
    <field labelOnTop="0" name="sens_numerotation"/>
    <field labelOnTop="0" name="statut_voie"/>
    <field labelOnTop="0" name="statut_voie_num"/>
    <field labelOnTop="0" name="type_num"/>
    <field labelOnTop="0" name="typologie"/>
  </labelOnTop>
  <widgets>
    <widget name="point_adre_id_voie_voie_61bde_id_voie">
      <config type="Map">
        <Option type="QString" value="" name="nm-rel"/>
      </config>
    </widget>
    <widget name="point_adre_id_voie_voie_77a8b_id_voie">
      <config type="Map">
        <Option type="QString" value="" name="nm-rel"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>nom_complet</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" simplifyLocal="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08" labelsEnabled="1" readOnly="0" maxScale="0" version="3.4.15-Madeira" simplifyMaxScale="1" simplifyDrawingTol="1" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule symbol="0" label="Verrouillée" key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}" filter=" &quot;statut_voie_num&quot; "/>
      <rule symbol="1" label="Déverrouillée" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}" filter="not &quot;statut_voie_num&quot;"/>
    </rules>
    <symbols>
      <symbol name="0" clip_to_extent="1" type="line" alpha="1" force_rhr="0">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" clip_to_extent="1" type="line" alpha="1" force_rhr="0">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{131a6fbf-c295-4fb3-82dd-6fbefd2e4624}">
      <rule scalemaxdenom="10000" scalemindenom="1" key="{6907fb9e-db4e-4761-8a81-bfbc4b7f69e6}" filter="Not  &quot;statut_voie_num&quot; ">
        <settings>
          <text-style fontUnderline="0" previewBkgrdColor="#ffffff" multilineHeight="1" fontCapitals="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" useSubstitutions="0" textOpacity="1" fontSize="10" fontLetterSpacing="0" blendMode="0" isExpression="0" fieldName="nom_complet" fontWeight="50" fontFamily="Ubuntu" fontStrikeout="0" fontSizeUnit="Point" namedStyle="Regular" fontItalic="0" textColor="211,0,3,255" fontWordSpacing="0">
            <text-buffer bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM" bufferJoinStyle="128" bufferOpacity="1" bufferDraw="1" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255"/>
            <background shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255" shapeDraw="0" shapeRadiiY="0" shapeSizeUnit="MM" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeSizeX="0" shapeOffsetY="0" shapeRotation="0" shapeOffsetX="0" shapeBorderWidth="0" shapeSVGFile="" shapeSizeType="0" shapeBlendMode="0" shapeType="0" shapeRotationType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeBorderWidthUnit="MM" shapeSizeY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiUnit="MM"/>
            <shadow shadowDraw="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowRadiusAlphaOnly="0" shadowOffsetUnit="MM" shadowScale="100" shadowUnder="0" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowOffsetDist="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowOpacity="0.7" shadowColor="0,0,0,255" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format rightDirectionSymbol=">" addDirectionSymbol="0" multilineAlign="4294967295" plussign="0" decimals="3" wrapChar="" placeDirectionSymbol="0" formatNumbers="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" autoWrapLength="0" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" placement="2" placementFlags="10" repeatDistance="0" centroidInside="0" yOffset="0" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM" priority="5" quadOffset="4" distUnits="MM" centroidWhole="0" maxCurvedCharAngleOut="-25" preserveRotation="1" xOffset="0" fitInPolygonOnly="0" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" maxCurvedCharAngleIn="25"/>
          <rendering minFeatureSize="0" fontMinPixelSize="3" drawLabels="1" obstacleType="0" obstacleFactor="1" scaleMax="0" limitNumLabels="0" scaleVisibility="0" labelPerPart="0" scaleMin="0" fontLimitPixelSize="0" obstacle="1" upsidedownLabels="0" zIndex="0" fontMaxPixelSize="10000" mergeLines="0" displayAll="0" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
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
    <DiagramCategory lineSizeType="MM" maxScaleDenominator="1e+08" opacity="1" width="15" diagramOrientation="Up" minScaleDenominator="0" scaleDependency="Area" backgroundColor="#ffffff" lineSizeScale="3x:0,0,0,0,0,0" minimumSize="0" height="15" enabled="0" penColor="#000000" barWidth="5" sizeType="MM" rotationOffset="270" labelPlacementMethod="XHeight" penWidth="0" scaleBasedVisibility="0" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" zIndex="0" placement="2" obstacle="0" linePlacementFlags="18" priority="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id_voie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typologie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom_complet">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
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
                <Option name="Classique" type="QString" value="Classique"/>
              </Option>
              <Option type="Map">
                <Option name="Métrique" type="QString" value="Metrique"/>
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
                <Option name="Verrouillée" type="QString" value="true"/>
              </Option>
              <Option type="Map">
                <Option name="Déverrouillée" type="QString" value="false"/>
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
                <Option name="Validée" type="QString" value="true"/>
              </Option>
              <Option type="Map">
                <Option name="En cours de validation" type="QString" value="false"/>
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
            <Option name="CheckedState" type="QString" value=""/>
            <Option name="UncheckedState" type="QString" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_voie">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value=""/>
            <Option name="UncheckedState" type="QString" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_point">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="Max" type="int" value="2147483647"/>
            <Option name="Min" type="int" value="-2147483648"/>
            <Option name="Precision" type="int" value="0"/>
            <Option name="Step" type="int" value="1"/>
            <Option name="Style" type="QString" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_creation">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" type="bool" value="true"/>
            <Option name="calendar_popup" type="bool" value="true"/>
            <Option name="display_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_iso_format" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_modif">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" type="bool" value="true"/>
            <Option name="calendar_popup" type="bool" value="true"/>
            <Option name="display_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_iso_format" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="longueur">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="Max" type="int" value="2147483647"/>
            <Option name="Min" type="int" value="-2147483648"/>
            <Option name="Precision" type="int" value="0"/>
            <Option name="Step" type="int" value="1"/>
            <Option name="Style" type="QString" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_fantoir">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="Max" type="int" value="2147483647"/>
            <Option name="Min" type="int" value="-2147483648"/>
            <Option name="Precision" type="int" value="0"/>
            <Option name="Step" type="int" value="1"/>
            <Option name="Style" type="QString" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="delib">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value=""/>
            <Option name="UncheckedState" type="QString" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant" index="0" field="id_voie"/>
    <alias name="Typologie" index="1" field="typologie"/>
    <alias name="Nom de la voie" index="2" field="nom"/>
    <alias name="Nom complet" index="3" field="nom_complet"/>
    <alias name="Type de numérotation" index="4" field="type_num"/>
    <alias name="Statut" index="5" field="statut_voie_num"/>
    <alias name="Validation de la voie" index="6" field="statut_voie"/>
    <alias name="Inverser le sens ?" index="7" field="sens"/>
    <alias name="La plaque est à acheter" index="8" field="achat_plaque_voie"/>
    <alias name="Nombre de points liés à cette voie" index="9" field="nb_point"/>
    <alias name="Créateur de la voie" index="10" field="createur"/>
    <alias name="Date de création" index="11" field="date_creation"/>
    <alias name="Modificateur de la voie" index="12" field="modificateur"/>
    <alias name="Date de modification" index="13" field="date_modif"/>
    <alias name="Longueur (en m)" index="14" field="longueur"/>
    <alias name="Code fantoir" index="15" field="code_fantoir"/>
    <alias name="Délibération de la voie" index="16" field="delib"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="id_voie"/>
    <default expression="" applyOnUpdate="0" field="typologie"/>
    <default expression="" applyOnUpdate="0" field="nom"/>
    <default expression="" applyOnUpdate="0" field="nom_complet"/>
    <default expression="" applyOnUpdate="0" field="type_num"/>
    <default expression="" applyOnUpdate="0" field="statut_voie_num"/>
    <default expression="" applyOnUpdate="0" field="statut_voie"/>
    <default expression="" applyOnUpdate="0" field="sens"/>
    <default expression="" applyOnUpdate="0" field="achat_plaque_voie"/>
    <default expression="" applyOnUpdate="0" field="nb_point"/>
    <default expression="" applyOnUpdate="0" field="createur"/>
    <default expression="" applyOnUpdate="0" field="date_creation"/>
    <default expression="" applyOnUpdate="0" field="modificateur"/>
    <default expression="" applyOnUpdate="0" field="date_modif"/>
    <default expression="" applyOnUpdate="0" field="longueur"/>
    <default expression="" applyOnUpdate="0" field="code_fantoir"/>
    <default expression="" applyOnUpdate="0" field="delib"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" notnull_strength="1" constraints="3" exp_strength="0" field="id_voie"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="typologie"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="nom"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="nom_complet"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="type_num"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="statut_voie_num"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="statut_voie"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="sens"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="achat_plaque_voie"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="nb_point"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="createur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="date_creation"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="modificateur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="date_modif"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="longueur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="code_fantoir"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="delib"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="id_voie"/>
    <constraint exp="" desc="" field="typologie"/>
    <constraint exp="" desc="" field="nom"/>
    <constraint exp="" desc="" field="nom_complet"/>
    <constraint exp="" desc="" field="type_num"/>
    <constraint exp="" desc="" field="statut_voie_num"/>
    <constraint exp="" desc="" field="statut_voie"/>
    <constraint exp="" desc="" field="sens"/>
    <constraint exp="" desc="" field="achat_plaque_voie"/>
    <constraint exp="" desc="" field="nb_point"/>
    <constraint exp="" desc="" field="createur"/>
    <constraint exp="" desc="" field="date_creation"/>
    <constraint exp="" desc="" field="modificateur"/>
    <constraint exp="" desc="" field="date_modif"/>
    <constraint exp="" desc="" field="longueur"/>
    <constraint exp="" desc="" field="code_fantoir"/>
    <constraint exp="" desc="" field="delib"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" hidden="0" name="id_voie" type="field"/>
      <column width="-1" hidden="0" name="typologie" type="field"/>
      <column width="-1" hidden="0" name="nom" type="field"/>
      <column width="-1" hidden="0" name="nom_complet" type="field"/>
      <column width="-1" hidden="0" name="type_num" type="field"/>
      <column width="-1" hidden="0" name="statut_voie_num" type="field"/>
      <column width="124" hidden="0" name="statut_voie" type="field"/>
      <column width="107" hidden="0" name="sens" type="field"/>
      <column width="-1" hidden="0" name="achat_plaque_voie" type="field"/>
      <column width="-1" hidden="0" name="nb_point" type="field"/>
      <column width="-1" hidden="0" name="createur" type="field"/>
      <column width="-1" hidden="0" name="date_creation" type="field"/>
      <column width="-1" hidden="0" name="modificateur" type="field"/>
      <column width="-1" hidden="0" name="date_modif" type="field"/>
      <column width="-1" hidden="0" name="longueur" type="field"/>
      <column width="-1" hidden="0" name="code_fantoir" type="field"/>
      <column width="-1" hidden="0" name="delib" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
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
    <attributeEditorContainer name="Voie" columnCount="1" groupBox="0" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
      <attributeEditorContainer name="Création d'une voie" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="id_voie" index="0" showLabel="1"/>
        <attributeEditorField name="typologie" index="1" showLabel="1"/>
        <attributeEditorField name="nom" index="2" showLabel="1"/>
        <attributeEditorField name="nom_complet" index="3" showLabel="1"/>
        <attributeEditorField name="type_num" index="4" showLabel="1"/>
        <attributeEditorField name="statut_voie_num" index="5" showLabel="1"/>
        <attributeEditorField name="statut_voie" index="6" showLabel="1"/>
        <attributeEditorField name="sens" index="7" showLabel="1"/>
        <attributeEditorField name="achat_plaque_voie" index="8" showLabel="1"/>
        <attributeEditorField name="delib" index="16" showLabel="1"/>
        <attributeEditorField name="nb_point" index="9" showLabel="1"/>
        <attributeEditorField name="longueur" index="14" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Commune" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="communes" index="-1" showLabel="1"/>
        <attributeEditorField name="insee" index="-1" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Utilisateurs" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="createur" index="10" showLabel="1"/>
        <attributeEditorField name="date_creation" index="11" showLabel="1"/>
        <attributeEditorField name="modificateur" index="12" showLabel="1"/>
        <attributeEditorField name="date_modif" index="13" showLabel="1"/>
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
        <Option name="nm-rel" type="QString" value=""/>
      </config>
    </widget>
    <widget name="point_adre_id_voie_voie_77a8b_id_voie">
      <config type="Map">
        <Option name="nm-rel" type="QString" value=""/>
      </config>
    </widget>
  </widgets>
  <previewExpression>nom_complet</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

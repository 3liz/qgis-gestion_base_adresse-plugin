<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" labelsEnabled="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" minScale="1e+08" simplifyAlgorithm="0" simplifyDrawingTol="1" maxScale="0" simplifyMaxScale="1" version="3.4.15-Madeira" simplifyLocal="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" enableorderby="0" forceraster="0" type="RuleRenderer">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule symbol="0" label="Verrouillée" filter=" &quot;statut_voie_num&quot; " key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}"/>
      <rule symbol="1" label="Déverrouillée" filter="not &quot;statut_voie_num&quot;" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" name="0" alpha="1" type="line" clip_to_extent="1">
        <layer pass="0" class="SimpleLine" locked="0" enabled="1">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="1" alpha="1" type="line" clip_to_extent="1">
        <layer pass="0" class="SimpleLine" locked="0" enabled="1">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{965d4476-a0b7-4af9-b5aa-4d5d101688d4}">
      <rule scalemaxdenom="10000" scalemindenom="1" filter="Not  &quot;statut_voie_num&quot; " key="{5bdc4212-035f-4ac2-979d-1339d02cee28}">
        <settings>
          <text-style fontSizeUnit="Point" fontSize="10" fontStrikeout="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" previewBkgrdColor="#ffffff" fontItalic="0" useSubstitutions="0" namedStyle="Regular" fontCapitals="0" multilineHeight="1" textColor="211,0,3,255" fontUnderline="0" fontWordSpacing="0" blendMode="0" fontWeight="50" fieldName="nom_complet" fontFamily="Ubuntu" isExpression="0" fontLetterSpacing="0">
            <text-buffer bufferOpacity="1" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSizeUnits="MM" bufferBlendMode="0" bufferDraw="1" bufferColor="255,255,255,255" bufferNoFill="1" bufferJoinStyle="128"/>
            <background shapeJoinStyle="64" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeOffsetY="0" shapeBlendMode="0" shapeSizeX="0" shapeRadiiUnit="MM" shapeBorderWidth="0" shapeBorderWidthUnit="MM" shapeOffsetUnit="MM" shapeSizeY="0" shapeOpacity="1" shapeRotationType="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="MM" shapeBorderColor="128,128,128,255" shapeRadiiY="0" shapeType="0" shapeRadiiX="0" shapeSVGFile="" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0"/>
            <shadow shadowScale="100" shadowUnder="0" shadowOpacity="0.7" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowOffsetAngle="135" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowColor="0,0,0,255" shadowRadiusAlphaOnly="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format decimals="3" rightDirectionSymbol=">" wrapChar="" multilineAlign="4294967295" formatNumbers="0" autoWrapLength="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" placeDirectionSymbol="0" plussign="0"/>
          <placement xOffset="0" offsetType="0" dist="0" preserveRotation="1" centroidInside="0" priority="5" distUnits="MM" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" quadOffset="4" maxCurvedCharAngleIn="25" maxCurvedCharAngleOut="-25" fitInPolygonOnly="0" repeatDistanceUnits="MM" placement="2" yOffset="0" centroidWhole="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM" rotationAngle="0"/>
          <rendering scaleMax="0" zIndex="0" mergeLines="0" maxNumLabels="2000" drawLabels="1" fontLimitPixelSize="0" obstacle="1" limitNumLabels="0" fontMinPixelSize="3" labelPerPart="0" displayAll="0" upsidedownLabels="0" scaleVisibility="0" obstacleType="0" scaleMin="0" minFeatureSize="0" fontMaxPixelSize="10000" obstacleFactor="1"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
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
    <DiagramCategory backgroundAlpha="255" sizeType="MM" minScaleDenominator="0" width="15" rotationOffset="270" sizeScale="3x:0,0,0,0,0,0" barWidth="5" penAlpha="255" penWidth="0" enabled="0" opacity="1" diagramOrientation="Up" backgroundColor="#ffffff" labelPlacementMethod="XHeight" maxScaleDenominator="1e+08" penColor="#000000" lineSizeType="MM" minimumSize="0" height="15" lineSizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" scaleDependency="Area">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" placement="2" zIndex="0" dist="0" priority="0" showAll="1" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
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
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typologie">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nom_complet">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
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
                <Option value="Classique" name="Classique" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Metrique" name="Métrique" type="QString"/>
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
                <Option value="true" name="Verrouillée" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="false" name="Déverrouillée" type="QString"/>
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
                <Option value="true" name="Validée" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="false" name="En cours de validation" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sens_numerotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_voie">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_point">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="2147483647" name="Max" type="int"/>
            <Option value="-2147483648" name="Min" type="int"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="int"/>
            <Option value="SpinBox" name="Style" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_creation">
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
    <field name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_modif">
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
    <field name="longueur">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="2147483647" name="Max" type="int"/>
            <Option value="-2147483648" name="Min" type="int"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="int"/>
            <Option value="SpinBox" name="Style" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_fantoir">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="2147483647" name="Max" type="int"/>
            <Option value="-2147483648" name="Min" type="int"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="int"/>
            <Option value="SpinBox" name="Style" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="delib">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="Identifiant" field="id_voie"/>
    <alias index="1" name="Typologie" field="typologie"/>
    <alias index="2" name="Nom de la voie" field="nom"/>
    <alias index="3" name="Nom complet" field="nom_complet"/>
    <alias index="4" name="Type de numérotation" field="type_num"/>
    <alias index="5" name="Statut" field="statut_voie_num"/>
    <alias index="6" name="Validation de la voie" field="statut_voie"/>
    <alias index="7" name="Sens de numérotation inversé ?" field="sens_numerotation"/>
    <alias index="8" name="La plaque est à acheter" field="achat_plaque_voie"/>
    <alias index="9" name="Nombre de points liés à cette voie" field="nb_point"/>
    <alias index="10" name="Créateur de la voie" field="createur"/>
    <alias index="11" name="Date de création" field="date_creation"/>
    <alias index="12" name="Modificateur de la voie" field="modificateur"/>
    <alias index="13" name="Date de modification" field="date_modif"/>
    <alias index="14" name="Longueur (en m)" field="longueur"/>
    <alias index="15" name="Code fantoir" field="code_fantoir"/>
    <alias index="16" name="Délibération de la voie" field="delib"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="id_voie"/>
    <default applyOnUpdate="0" expression="" field="typologie"/>
    <default applyOnUpdate="0" expression="" field="nom"/>
    <default applyOnUpdate="0" expression="" field="nom_complet"/>
    <default applyOnUpdate="0" expression="" field="type_num"/>
    <default applyOnUpdate="0" expression="" field="statut_voie_num"/>
    <default applyOnUpdate="0" expression="" field="statut_voie"/>
    <default applyOnUpdate="0" expression="" field="sens_numerotation"/>
    <default applyOnUpdate="0" expression="" field="achat_plaque_voie"/>
    <default applyOnUpdate="0" expression="" field="nb_point"/>
    <default applyOnUpdate="0" expression="" field="createur"/>
    <default applyOnUpdate="0" expression="" field="date_creation"/>
    <default applyOnUpdate="0" expression="" field="modificateur"/>
    <default applyOnUpdate="0" expression="" field="date_modif"/>
    <default applyOnUpdate="0" expression="" field="longueur"/>
    <default applyOnUpdate="0" expression="" field="code_fantoir"/>
    <default applyOnUpdate="0" expression="" field="delib"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="id_voie"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="typologie"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="nom"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="nom_complet"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="2" field="type_num"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="statut_voie_num"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="statut_voie"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="sens_numerotation"/>
    <constraint exp_strength="0" unique_strength="0" constraints="1" notnull_strength="1" field="achat_plaque_voie"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="nb_point"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createur"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="date_creation"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="modificateur"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="date_modif"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="longueur"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="code_fantoir"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="delib"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="id_voie"/>
    <constraint exp="" desc="" field="typologie"/>
    <constraint exp="" desc="" field="nom"/>
    <constraint exp="" desc="" field="nom_complet"/>
    <constraint exp="" desc="" field="type_num"/>
    <constraint exp="" desc="" field="statut_voie_num"/>
    <constraint exp="" desc="" field="statut_voie"/>
    <constraint exp="" desc="" field="sens_numerotation"/>
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
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" hidden="0" name="id_voie" type="field"/>
      <column width="-1" hidden="0" name="typologie" type="field"/>
      <column width="-1" hidden="0" name="nom" type="field"/>
      <column width="-1" hidden="0" name="nom_complet" type="field"/>
      <column width="-1" hidden="0" name="type_num" type="field"/>
      <column width="-1" hidden="0" name="statut_voie_num" type="field"/>
      <column width="124" hidden="0" name="statut_voie" type="field"/>
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
      <column width="-1" hidden="0" name="sens_numerotation" type="field"/>
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
    <attributeEditorContainer groupBox="0" visibilityExpressionEnabled="0" name="Voie" visibilityExpression="" showLabel="1" columnCount="1">
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" name="Création d'une voie" visibilityExpression="" showLabel="1" columnCount="1">
        <attributeEditorField index="0" name="id_voie" showLabel="1"/>
        <attributeEditorField index="1" name="typologie" showLabel="1"/>
        <attributeEditorField index="2" name="nom" showLabel="1"/>
        <attributeEditorField index="3" name="nom_complet" showLabel="1"/>
        <attributeEditorField index="4" name="type_num" showLabel="1"/>
        <attributeEditorField index="5" name="statut_voie_num" showLabel="1"/>
        <attributeEditorField index="6" name="statut_voie" showLabel="1"/>
        <attributeEditorField index="-1" name="sens" showLabel="1"/>
        <attributeEditorField index="8" name="achat_plaque_voie" showLabel="1"/>
        <attributeEditorField index="16" name="delib" showLabel="1"/>
        <attributeEditorField index="9" name="nb_point" showLabel="1"/>
        <attributeEditorField index="14" name="longueur" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" name="Commune" visibilityExpression="" showLabel="1" columnCount="1">
        <attributeEditorField index="-1" name="communes" showLabel="1"/>
        <attributeEditorField index="-1" name="insee" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" name="Utilisateurs" visibilityExpression="" showLabel="1" columnCount="1">
        <attributeEditorField index="10" name="createur" showLabel="1"/>
        <attributeEditorField index="11" name="date_creation" showLabel="1"/>
        <attributeEditorField index="12" name="modificateur" showLabel="1"/>
        <attributeEditorField index="13" name="date_modif" showLabel="1"/>
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
        <Option value="" name="nm-rel" type="QString"/>
      </config>
    </widget>
    <widget name="point_adre_id_voie_voie_77a8b_id_voie">
      <config type="Map">
        <Option value="" name="nm-rel" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>nom_complet</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

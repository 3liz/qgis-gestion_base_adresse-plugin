<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" maxScale="0" simplifyMaxScale="1" version="3.4.15-Madeira" hasScaleBasedVisibilityFlag="0" minScale="1e+08" labelsEnabled="1" simplifyDrawingHints="1" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyLocal="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{1135c5c2-2c96-4037-ada9-d2d045759c9d}">
      <rule filter=" &quot;statut_voie_num&quot; " symbol="0" label="Verrouillée" key="{3f8e97a1-ec38-446d-a2b8-4385467d1ef8}"/>
      <rule filter="not &quot;statut_voie_num&quot;" symbol="1" label="Déverrouillée" key="{c5fc884f-ddfe-43fc-8123-3acf4a83e900}"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" alpha="1" name="0" clip_to_extent="1" type="line">
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
      <symbol force_rhr="0" alpha="1" name="1" clip_to_extent="1" type="line">
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
    <rules key="{3c222c58-75ef-436a-b51b-3220ca920835}">
      <rule scalemaxdenom="10000" filter="Not  &quot;statut_voie_num&quot; " key="{195dcb5a-b667-45fd-8674-5a8671ae4a6c}" scalemindenom="1">
        <settings>
          <text-style textOpacity="1" blendMode="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" namedStyle="Regular" previewBkgrdColor="#ffffff" fontFamily="Ubuntu" fontWordSpacing="0" fontItalic="0" fontSizeUnit="Point" fontUnderline="0" fontStrikeout="0" isExpression="0" fontLetterSpacing="0" fontWeight="50" fontSize="10" textColor="211,0,3,255" multilineHeight="1" fieldName="nom_complet" useSubstitutions="0" fontCapitals="0">
            <text-buffer bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferDraw="1" bufferColor="255,255,255,255"/>
            <background shapeRadiiUnit="MM" shapeType="0" shapeOpacity="1" shapeSizeX="0" shapeDraw="0" shapeRadiiX="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="" shapeSizeY="0" shapeBorderColor="128,128,128,255" shapeJoinStyle="64" shapeFillColor="255,255,255,255" shapeSizeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotationType="0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeBorderWidthUnit="MM" shapeBorderWidth="0" shapeBlendMode="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeRotation="0" shapeSizeUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0"/>
            <shadow shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowDraw="0" shadowScale="100" shadowOffsetDist="1" shadowRadius="1.5" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7" shadowColor="0,0,0,255"/>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" plussign="0" leftDirectionSymbol="&lt;" decimals="3" autoWrapLength="0" formatNumbers="0" reverseDirectionSymbol="0" rightDirectionSymbol=">" addDirectionSymbol="0" multilineAlign="4294967295" placeDirectionSymbol="0" wrapChar=""/>
          <placement dist="0" quadOffset="4" priority="5" offsetUnits="MM" rotationAngle="0" centroidInside="0" xOffset="0" maxCurvedCharAngleOut="-25" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" repeatDistanceUnits="MM" preserveRotation="1" placementFlags="10" placement="2" centroidWhole="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" distUnits="MM" yOffset="0" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="0"/>
          <rendering fontMinPixelSize="3" minFeatureSize="0" drawLabels="1" maxNumLabels="2000" upsidedownLabels="0" labelPerPart="0" limitNumLabels="0" zIndex="0" obstacleFactor="1" displayAll="0" mergeLines="0" fontLimitPixelSize="0" obstacleType="0" scaleVisibility="0" obstacle="1" fontMaxPixelSize="10000" scaleMin="0" scaleMax="0"/>
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
    <property key="dualview/previewExpressions" value="id_voie"/>
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
  <DiagramLayerSettings priority="0" placement="2" obstacle="0" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
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
  </fieldConfiguration>
  <aliases>
    <alias field="id_voie" name="Identifiant" index="0"/>
    <alias field="typologie" name="Typologie" index="1"/>
    <alias field="nom" name="Nom de la voie" index="2"/>
    <alias field="nom_complet" name="Nom complet" index="3"/>
    <alias field="type_num" name="Type de numérotation" index="4"/>
    <alias field="statut_voie_num" name="Statut" index="5"/>
    <alias field="statut_voie" name="Validation de la voie" index="6"/>
    <alias field="sens" name="Inverser le sens ?" index="7"/>
    <alias field="achat_plaque_voie" name="La plaque est à acheter" index="8"/>
    <alias field="nb_point" name="Nombre de points liés à cette voie" index="9"/>
    <alias field="createur" name="Créateur de la voie" index="10"/>
    <alias field="date_creation" name="Date de création" index="11"/>
    <alias field="modificateur" name="Modificateur de la voie" index="12"/>
    <alias field="date_modif" name="Date de modification" index="13"/>
    <alias field="longueur" name="Longueur (en m)" index="14"/>
    <alias field="code_fantoir" name="Code fantoir" index="15"/>
    <alias field="delib" name="Délibération de la voie" index="16"/>
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
    <default field="sens" applyOnUpdate="0" expression=""/>
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
    <constraint notnull_strength="1" unique_strength="1" field="id_voie" constraints="3" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="typologie" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="nom" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="nom_complet" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="2" unique_strength="0" field="type_num" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="statut_voie_num" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="statut_voie" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="sens" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="achat_plaque_voie" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="nb_point" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="createur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_creation" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="modificateur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_modif" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="longueur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="code_fantoir" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="delib" constraints="0" exp_strength="0"/>
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
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" width="-1" name="id_voie" type="field"/>
      <column hidden="0" width="-1" name="typologie" type="field"/>
      <column hidden="0" width="-1" name="nom" type="field"/>
      <column hidden="0" width="-1" name="nom_complet" type="field"/>
      <column hidden="0" width="-1" name="type_num" type="field"/>
      <column hidden="0" width="-1" name="statut_voie_num" type="field"/>
      <column hidden="0" width="124" name="statut_voie" type="field"/>
      <column hidden="0" width="107" name="sens" type="field"/>
      <column hidden="0" width="-1" name="achat_plaque_voie" type="field"/>
      <column hidden="0" width="-1" name="nb_point" type="field"/>
      <column hidden="0" width="-1" name="createur" type="field"/>
      <column hidden="0" width="-1" name="date_creation" type="field"/>
      <column hidden="0" width="-1" name="modificateur" type="field"/>
      <column hidden="0" width="-1" name="date_modif" type="field"/>
      <column hidden="0" width="-1" name="longueur" type="field"/>
      <column hidden="0" width="-1" name="code_fantoir" type="field"/>
      <column hidden="0" width="-1" name="delib" type="field"/>
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
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Voie" showLabel="1" groupBox="0">
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Création d'une voie" showLabel="1" groupBox="1">
        <attributeEditorField name="id_voie" showLabel="1" index="0"/>
        <attributeEditorField name="typologie" showLabel="1" index="1"/>
        <attributeEditorField name="nom" showLabel="1" index="2"/>
        <attributeEditorField name="nom_complet" showLabel="1" index="3"/>
        <attributeEditorField name="type_num" showLabel="1" index="4"/>
        <attributeEditorField name="statut_voie_num" showLabel="1" index="5"/>
        <attributeEditorField name="statut_voie" showLabel="1" index="6"/>
        <attributeEditorField name="sens" showLabel="1" index="7"/>
        <attributeEditorField name="achat_plaque_voie" showLabel="1" index="8"/>
        <attributeEditorField name="delib" showLabel="1" index="16"/>
        <attributeEditorField name="nb_point" showLabel="1" index="9"/>
        <attributeEditorField name="longueur" showLabel="1" index="14"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Commune" showLabel="1" groupBox="1">
        <attributeEditorField name="communes" showLabel="1" index="-1"/>
        <attributeEditorField name="insee" showLabel="1" index="-1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Utilisateurs" showLabel="1" groupBox="1">
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
    <field labelOnTop="0" name="statut_voie"/>
    <field labelOnTop="0" name="statut_voie_num"/>
    <field labelOnTop="0" name="type_num"/>
    <field labelOnTop="0" name="typologie"/>
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

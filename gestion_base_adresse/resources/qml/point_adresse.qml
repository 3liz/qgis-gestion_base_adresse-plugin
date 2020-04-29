<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" hasScaleBasedVisibilityFlag="0" simplifyLocal="0" simplifyDrawingHints="0" minScale="1e+08" labelsEnabled="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories" version="3.4.15-Madeira" simplifyMaxScale="1" simplifyAlgorithm="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" symbollevels="0" forceraster="0" enableorderby="0">
    <rules key="{8802a37f-2f4e-4ee5-b4b3-ec519d0efc75}">
      <rule filter=" &quot;a_valider&quot; = true and  &quot;erreur&quot; = false" symbol="0" key="{d3c4e791-dbaf-4196-a5cf-9da6b348ed7d}" label="Non validé et pas d'erreur"/>
      <rule filter=" &quot;a_valider&quot; = false and  &quot;erreur&quot; = false" symbol="1" key="{0ff3b8c9-610a-4a3f-b0aa-35b6b2e07b22}" label="Validé"/>
      <rule filter=" &quot;erreur&quot; = true" symbol="2" key="{8c0bf604-1c09-4819-82a4-bcd4ad0abed7}" label="Erreur"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" type="marker" name="0">
        <layer locked="0" enabled="1" pass="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="243,173,21,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" type="marker" name="1">
        <layer locked="0" enabled="1" pass="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="176,176,176,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" type="marker" name="2">
        <layer locked="0" enabled="1" pass="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,1,30,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
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
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="id_point"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory sizeType="MM" minScaleDenominator="0" barWidth="5" rotationOffset="270" sizeScale="3x:0,0,0,0,0,0" penWidth="0" opacity="1" penColor="#000000" minimumSize="0" backgroundAlpha="255" maxScaleDenominator="1e+08" height="15" scaleBasedVisibility="0" labelPlacementMethod="XHeight" lineSizeScale="3x:0,0,0,0,0,0" scaleDependency="Area" diagramOrientation="Up" backgroundColor="#ffffff" width="15" penAlpha="255" lineSizeType="MM" enabled="0">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" zIndex="0" obstacle="0" showAll="1" placement="0" priority="0" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id_point">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="numero">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="int" name="Max" value="2147483647"/>
            <Option type="int" name="Min" value="-2147483648"/>
            <Option type="int" name="Precision" value="0"/>
            <Option type="int" name="Step" value="1"/>
            <Option type="QString" name="Style" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="suffixe">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="BIS" value="bis"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="TER" value="ter"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="QUARTER" value="qua"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="QUINQUIENS" value="qui"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="A" value="a"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="B" value="b"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="C" value="c"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="D" value="d"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="E" value="e"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="adresse_complete">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_postal">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_pos">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_numero">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_creation">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_modif">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="erreur">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="commentaire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_voie">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowAddFeatures" value="false"/>
            <Option type="bool" name="AllowNULL" value="false"/>
            <Option type="bool" name="MapIdentification" value="false"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="ReadOnly" value="false"/>
            <Option type="QString" name="Relation" value="point_adre_id_voie_voie_77a8b_id_voie"/>
            <Option type="bool" name="ShowForm" value="false"/>
            <Option type="bool" name="ShowOpenFormButton" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_commune">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="int" name="Max" value="2147483647"/>
            <Option type="int" name="Min" value="-2147483648"/>
            <Option type="int" name="Precision" value="0"/>
            <Option type="int" name="Step" value="1"/>
            <Option type="QString" name="Style" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_parcelle">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="a_valider">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id_point" name="Identifiant" index="0"/>
    <alias field="numero" name="Numéro du point" index="1"/>
    <alias field="suffixe" name="Suffixe" index="2"/>
    <alias field="adresse_complete" name="Adresse complète" index="3"/>
    <alias field="code_postal" name="Code Postal" index="4"/>
    <alias field="type_pos" name="Positionnement" index="5"/>
    <alias field="achat_plaque_numero" name="La plaque est à acheter ?" index="6"/>
    <alias field="createur" name="Créateur du point" index="7"/>
    <alias field="date_creation" name="Date de création du point" index="8"/>
    <alias field="modificateur" name="Modificateur du point" index="9"/>
    <alias field="date_modif" name="Date de modification du point" index="10"/>
    <alias field="erreur" name="Une erreur a été constatée ?" index="11"/>
    <alias field="commentaire" name="Commentaire" index="12"/>
    <alias field="id_voie" name="Voie" index="13"/>
    <alias field="id_commune" name="" index="14"/>
    <alias field="id_parcelle" name="" index="15"/>
    <alias field="a_valider" name="à valider" index="16"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id_point" applyOnUpdate="0" expression=""/>
    <default field="numero" applyOnUpdate="0" expression=""/>
    <default field="suffixe" applyOnUpdate="0" expression=""/>
    <default field="adresse_complete" applyOnUpdate="0" expression=""/>
    <default field="code_postal" applyOnUpdate="0" expression=""/>
    <default field="type_pos" applyOnUpdate="0" expression=""/>
    <default field="achat_plaque_numero" applyOnUpdate="0" expression=""/>
    <default field="createur" applyOnUpdate="0" expression=""/>
    <default field="date_creation" applyOnUpdate="0" expression=""/>
    <default field="modificateur" applyOnUpdate="0" expression=""/>
    <default field="date_modif" applyOnUpdate="0" expression=""/>
    <default field="erreur" applyOnUpdate="0" expression=""/>
    <default field="commentaire" applyOnUpdate="0" expression=""/>
    <default field="id_voie" applyOnUpdate="0" expression=""/>
    <default field="id_commune" applyOnUpdate="0" expression=""/>
    <default field="id_parcelle" applyOnUpdate="0" expression=""/>
    <default field="a_valider" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="id_point" notnull_strength="1" unique_strength="1" constraints="3" exp_strength="0"/>
    <constraint field="numero" notnull_strength="1" unique_strength="0" constraints="1" exp_strength="0"/>
    <constraint field="suffixe" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="adresse_complete" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="code_postal" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="type_pos" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="achat_plaque_numero" notnull_strength="1" unique_strength="0" constraints="1" exp_strength="0"/>
    <constraint field="createur" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="date_creation" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="modificateur" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="date_modif" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="erreur" notnull_strength="1" unique_strength="0" constraints="1" exp_strength="0"/>
    <constraint field="commentaire" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="id_voie" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="id_commune" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="id_parcelle" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint field="a_valider" notnull_strength="0" unique_strength="0" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id_point" exp="" desc=""/>
    <constraint field="numero" exp="" desc=""/>
    <constraint field="suffixe" exp="" desc=""/>
    <constraint field="adresse_complete" exp="" desc=""/>
    <constraint field="code_postal" exp="" desc=""/>
    <constraint field="type_pos" exp="" desc=""/>
    <constraint field="achat_plaque_numero" exp="" desc=""/>
    <constraint field="createur" exp="" desc=""/>
    <constraint field="date_creation" exp="" desc=""/>
    <constraint field="modificateur" exp="" desc=""/>
    <constraint field="date_modif" exp="" desc=""/>
    <constraint field="erreur" exp="" desc=""/>
    <constraint field="commentaire" exp="" desc=""/>
    <constraint field="id_voie" exp="" desc=""/>
    <constraint field="id_commune" exp="" desc=""/>
    <constraint field="id_parcelle" exp="" desc=""/>
    <constraint field="a_valider" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" name="id_point" width="-1"/>
      <column hidden="0" type="field" name="numero" width="-1"/>
      <column hidden="0" type="field" name="suffixe" width="-1"/>
      <column hidden="0" type="field" name="adresse_complete" width="-1"/>
      <column hidden="0" type="field" name="code_postal" width="-1"/>
      <column hidden="0" type="field" name="type_pos" width="-1"/>
      <column hidden="0" type="field" name="achat_plaque_numero" width="-1"/>
      <column hidden="0" type="field" name="erreur" width="-1"/>
      <column hidden="0" type="field" name="commentaire" width="-1"/>
      <column hidden="0" type="field" name="id_voie" width="220"/>
      <column hidden="0" type="field" name="id_commune" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" name="id_parcelle" width="-1"/>
      <column hidden="0" type="field" name="createur" width="-1"/>
      <column hidden="0" type="field" name="date_creation" width="-1"/>
      <column hidden="0" type="field" name="modificateur" width="-1"/>
      <column hidden="0" type="field" name="date_modif" width="-1"/>
      <column hidden="0" type="field" name="a_valider" width="-1"/>
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
    <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Point d'adresse" groupBox="0" showLabel="1" visibilityExpression="">
      <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Création du point" groupBox="1" showLabel="1" visibilityExpression="">
        <attributeEditorField name="id_point" index="0" showLabel="1"/>
        <attributeEditorField name="numero" index="1" showLabel="1"/>
        <attributeEditorField name="suffixe" index="2" showLabel="1"/>
        <attributeEditorField name="id_voie" index="13" showLabel="1"/>
        <attributeEditorField name="adresse_complete" index="3" showLabel="1"/>
        <attributeEditorField name="type_pos" index="5" showLabel="1"/>
        <attributeEditorField name="achat_plaque_numero" index="6" showLabel="1"/>
        <attributeEditorField name="a_valider" index="16" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Commune" groupBox="1" showLabel="1" visibilityExpression="">
        <attributeEditorField name="code_postal" index="4" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Utilisateur" groupBox="1" showLabel="1" visibilityExpression="">
        <attributeEditorField name="createur" index="7" showLabel="1"/>
        <attributeEditorField name="date_creation" index="8" showLabel="1"/>
        <attributeEditorField name="modificateur" index="9" showLabel="1"/>
        <attributeEditorField name="date_modif" index="10" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" name="Erreur" groupBox="1" showLabel="1" visibilityExpression="">
        <attributeEditorField name="erreur" index="11" showLabel="1"/>
        <attributeEditorField name="commentaire" index="12" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="a_valide" editable="1"/>
    <field name="a_valider" editable="1"/>
    <field name="achat_plaque_numero" editable="1"/>
    <field name="adresse_complete" editable="1"/>
    <field name="code_postal" editable="1"/>
    <field name="commentaire" editable="1"/>
    <field name="createur" editable="1"/>
    <field name="createur_point" editable="1"/>
    <field name="date_creation" editable="0"/>
    <field name="date_creation_point" editable="0"/>
    <field name="date_modif" editable="0"/>
    <field name="date_modif_point" editable="0"/>
    <field name="erreur" editable="1"/>
    <field name="id_commune" editable="1"/>
    <field name="id_parcelle" editable="1"/>
    <field name="id_point" editable="0"/>
    <field name="id_voie" editable="0"/>
    <field name="modificateur" editable="1"/>
    <field name="modificateur_point" editable="1"/>
    <field name="numero" editable="1"/>
    <field name="suffixe" editable="1"/>
    <field name="type_pos" editable="1"/>
    <field name="validation" editable="1"/>
    <field name="voie_nom_complet" editable="0"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="a_valide"/>
    <field labelOnTop="0" name="a_valider"/>
    <field labelOnTop="0" name="achat_plaque_numero"/>
    <field labelOnTop="0" name="adresse_complete"/>
    <field labelOnTop="0" name="code_postal"/>
    <field labelOnTop="0" name="commentaire"/>
    <field labelOnTop="0" name="createur"/>
    <field labelOnTop="0" name="createur_point"/>
    <field labelOnTop="0" name="date_creation"/>
    <field labelOnTop="0" name="date_creation_point"/>
    <field labelOnTop="0" name="date_modif"/>
    <field labelOnTop="0" name="date_modif_point"/>
    <field labelOnTop="0" name="erreur"/>
    <field labelOnTop="0" name="id_commune"/>
    <field labelOnTop="0" name="id_parcelle"/>
    <field labelOnTop="0" name="id_point"/>
    <field labelOnTop="0" name="id_voie"/>
    <field labelOnTop="0" name="modificateur"/>
    <field labelOnTop="0" name="modificateur_point"/>
    <field labelOnTop="0" name="numero"/>
    <field labelOnTop="0" name="suffixe"/>
    <field labelOnTop="0" name="type_pos"/>
    <field labelOnTop="0" name="validation"/>
    <field labelOnTop="0" name="voie_nom_complet"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id_point</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>

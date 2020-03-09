<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" maxScale="0" simplifyMaxScale="1" version="3.4.15-Madeira" hasScaleBasedVisibilityFlag="0" minScale="1e+08" labelsEnabled="0" simplifyDrawingHints="0" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyLocal="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol force_rhr="0" alpha="1" name="0" clip_to_extent="1" type="marker">
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="190,178,151,255"/>
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
    <property key="dualview/previewExpressions" value="id_point"/>
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
  <DiagramLayerSettings priority="0" placement="0" obstacle="0" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
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
    <field name="id_point">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="numero">
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
    <field name="suffixe">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="adresse_complete">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_postal">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_pos">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_numero">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
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
    <field name="erreur">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="commentaire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_voie">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="false" type="bool"/>
            <Option name="AllowNULL" value="false" type="bool"/>
            <Option name="MapIdentification" value="false" type="bool"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="ReadOnly" value="false" type="bool"/>
            <Option name="Relation" value="point_adre_id_voie_voie_61bde_id_voie" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_commune">
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
    <field name="id_parcelle">
      <editWidget type="Range">
        <config>
          <Option/>
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
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" field="id_point" constraints="3" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="numero" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="suffixe" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="adresse_complete" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="code_postal" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="type_pos" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="achat_plaque_numero" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="createur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_creation" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="modificateur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_modif" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="erreur" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="commentaire" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_voie" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_commune" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_parcelle" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="id_point"/>
    <constraint exp="" desc="" field="numero"/>
    <constraint exp="" desc="" field="suffixe"/>
    <constraint exp="" desc="" field="adresse_complete"/>
    <constraint exp="" desc="" field="code_postal"/>
    <constraint exp="" desc="" field="type_pos"/>
    <constraint exp="" desc="" field="achat_plaque_numero"/>
    <constraint exp="" desc="" field="createur"/>
    <constraint exp="" desc="" field="date_creation"/>
    <constraint exp="" desc="" field="modificateur"/>
    <constraint exp="" desc="" field="date_modif"/>
    <constraint exp="" desc="" field="erreur"/>
    <constraint exp="" desc="" field="commentaire"/>
    <constraint exp="" desc="" field="id_voie"/>
    <constraint exp="" desc="" field="id_commune"/>
    <constraint exp="" desc="" field="id_parcelle"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" width="-1" name="id_point" type="field"/>
      <column hidden="0" width="-1" name="numero" type="field"/>
      <column hidden="0" width="-1" name="suffixe" type="field"/>
      <column hidden="0" width="-1" name="adresse_complete" type="field"/>
      <column hidden="0" width="-1" name="code_postal" type="field"/>
      <column hidden="0" width="-1" name="type_pos" type="field"/>
      <column hidden="0" width="-1" name="achat_plaque_numero" type="field"/>
      <column hidden="0" width="-1" name="erreur" type="field"/>
      <column hidden="0" width="-1" name="commentaire" type="field"/>
      <column hidden="0" width="220" name="id_voie" type="field"/>
      <column hidden="0" width="-1" name="id_commune" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" width="-1" name="id_parcelle" type="field"/>
      <column hidden="0" width="-1" name="createur" type="field"/>
      <column hidden="0" width="-1" name="date_creation" type="field"/>
      <column hidden="0" width="-1" name="modificateur" type="field"/>
      <column hidden="0" width="-1" name="date_modif" type="field"/>
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
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Point d'adresse" showLabel="1" groupBox="0">
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Création du point" showLabel="1" groupBox="1">
        <attributeEditorField name="id_point" showLabel="1" index="0"/>
        <attributeEditorField name="numero" showLabel="1" index="1"/>
        <attributeEditorField name="suffixe" showLabel="1" index="2"/>
        <attributeEditorField name="id_voie" showLabel="1" index="13"/>
        <attributeEditorField name="adresse_complete" showLabel="1" index="3"/>
        <attributeEditorField name="type_pos" showLabel="1" index="5"/>
        <attributeEditorField name="achat_plaque_numero" showLabel="1" index="6"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Commune" showLabel="1" groupBox="1">
        <attributeEditorField name="code_postal" showLabel="1" index="4"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Utilisateur" showLabel="1" groupBox="1">
        <attributeEditorField name="createur" showLabel="1" index="7"/>
        <attributeEditorField name="date_creation" showLabel="1" index="8"/>
        <attributeEditorField name="modificateur" showLabel="1" index="9"/>
        <attributeEditorField name="date_modif" showLabel="1" index="10"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" name="Erreur" showLabel="1" groupBox="1">
        <attributeEditorField name="erreur" showLabel="1" index="11"/>
        <attributeEditorField name="commentaire" showLabel="1" index="12"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
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
    <field name="voie_nom_complet" editable="0"/>
  </editable>
  <labelOnTop>
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
    <field labelOnTop="0" name="voie_nom_complet"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id_point</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>

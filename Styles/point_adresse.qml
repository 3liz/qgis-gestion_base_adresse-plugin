<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" labelsEnabled="0" simplifyMaxScale="1" simplifyDrawingHints="0" readOnly="0" version="3.4.15-Madeira" simplifyLocal="0" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyDrawingTol="1" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="singleSymbol" enableorderby="0" symbollevels="0" forceraster="0">
    <symbols>
      <symbol type="marker" clip_to_extent="1" name="0" force_rhr="0" alpha="1">
        <layer locked="0" class="SimpleMarker" pass="0" enabled="1">
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
    <property key="dualview/previewExpressions" value="id_point"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory width="15" sizeType="MM" scaleBasedVisibility="0" penAlpha="255" rotationOffset="270" labelPlacementMethod="XHeight" lineSizeType="MM" backgroundColor="#ffffff" minScaleDenominator="0" penColor="#000000" scaleDependency="Area" penWidth="0" sizeScale="3x:0,0,0,0,0,0" height="15" maxScaleDenominator="1e+08" lineSizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" enabled="0" backgroundAlpha="255" barWidth="5" opacity="1" minimumSize="0">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" placement="0" zIndex="0" dist="0" showAll="1" linePlacementFlags="18" priority="0">
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
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
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
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
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
            <Option type="QString" name="Relation" value="point_adre_id_voie_voie_61bde_id_voie"/>
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
    <default applyOnUpdate="0" expression="" field="id_point"/>
    <default applyOnUpdate="0" expression="" field="numero"/>
    <default applyOnUpdate="0" expression="" field="suffixe"/>
    <default applyOnUpdate="0" expression="" field="adresse_complete"/>
    <default applyOnUpdate="0" expression="" field="code_postal"/>
    <default applyOnUpdate="0" expression="" field="type_pos"/>
    <default applyOnUpdate="0" expression="" field="achat_plaque_numero"/>
    <default applyOnUpdate="0" expression="" field="createur"/>
    <default applyOnUpdate="0" expression="" field="date_creation"/>
    <default applyOnUpdate="0" expression="" field="modificateur"/>
    <default applyOnUpdate="0" expression="" field="date_modif"/>
    <default applyOnUpdate="0" expression="" field="erreur"/>
    <default applyOnUpdate="0" expression="" field="commentaire"/>
    <default applyOnUpdate="0" expression="" field="id_voie"/>
    <default applyOnUpdate="0" expression="" field="id_commune"/>
    <default applyOnUpdate="0" expression="" field="id_parcelle"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" constraints="3" unique_strength="1" field="id_point" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="1" unique_strength="0" field="numero" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="suffixe" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="adresse_complete" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="code_postal" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="type_pos" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="achat_plaque_numero" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="createur" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="date_creation" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="modificateur" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="date_modif" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="erreur" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="commentaire" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="id_voie" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="id_commune" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="id_parcelle" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id_point" exp=""/>
    <constraint desc="" field="numero" exp=""/>
    <constraint desc="" field="suffixe" exp=""/>
    <constraint desc="" field="adresse_complete" exp=""/>
    <constraint desc="" field="code_postal" exp=""/>
    <constraint desc="" field="type_pos" exp=""/>
    <constraint desc="" field="achat_plaque_numero" exp=""/>
    <constraint desc="" field="createur" exp=""/>
    <constraint desc="" field="date_creation" exp=""/>
    <constraint desc="" field="modificateur" exp=""/>
    <constraint desc="" field="date_modif" exp=""/>
    <constraint desc="" field="erreur" exp=""/>
    <constraint desc="" field="commentaire" exp=""/>
    <constraint desc="" field="id_voie" exp=""/>
    <constraint desc="" field="id_commune" exp=""/>
    <constraint desc="" field="id_parcelle" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" hidden="0" width="-1" name="id_point"/>
      <column type="field" hidden="0" width="-1" name="numero"/>
      <column type="field" hidden="0" width="-1" name="suffixe"/>
      <column type="field" hidden="0" width="-1" name="adresse_complete"/>
      <column type="field" hidden="0" width="-1" name="code_postal"/>
      <column type="field" hidden="0" width="-1" name="type_pos"/>
      <column type="field" hidden="0" width="-1" name="achat_plaque_numero"/>
      <column type="field" hidden="0" width="-1" name="erreur"/>
      <column type="field" hidden="0" width="-1" name="commentaire"/>
      <column type="field" hidden="0" width="220" name="id_voie"/>
      <column type="field" hidden="0" width="-1" name="id_commune"/>
      <column type="actions" hidden="1" width="-1"/>
      <column type="field" hidden="0" width="-1" name="id_parcelle"/>
      <column type="field" hidden="0" width="-1" name="createur"/>
      <column type="field" hidden="0" width="-1" name="date_creation"/>
      <column type="field" hidden="0" width="-1" name="modificateur"/>
      <column type="field" hidden="0" width="-1" name="date_modif"/>
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
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" visibilityExpression="" columnCount="1" name="Point d'adresse" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" visibilityExpression="" columnCount="1" name="Création du point" showLabel="1">
        <attributeEditorField name="id_point" showLabel="1" index="0"/>
        <attributeEditorField name="numero" showLabel="1" index="1"/>
        <attributeEditorField name="suffixe" showLabel="1" index="2"/>
        <attributeEditorField name="id_voie" showLabel="1" index="13"/>
        <attributeEditorField name="adresse_complete" showLabel="1" index="3"/>
        <attributeEditorField name="type_pos" showLabel="1" index="5"/>
        <attributeEditorField name="achat_plaque_numero" showLabel="1" index="6"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" visibilityExpression="" columnCount="1" name="Commune" showLabel="1">
        <attributeEditorField name="code_postal" showLabel="1" index="4"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" visibilityExpression="" columnCount="1" name="Utilisateur" showLabel="1">
        <attributeEditorField name="createur" showLabel="1" index="7"/>
        <attributeEditorField name="date_creation" showLabel="1" index="8"/>
        <attributeEditorField name="modificateur" showLabel="1" index="9"/>
        <attributeEditorField name="date_modif" showLabel="1" index="10"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" visibilityExpression="" columnCount="1" name="Erreur" showLabel="1">
        <attributeEditorField name="erreur" showLabel="1" index="11"/>
        <attributeEditorField name="commentaire" showLabel="1" index="12"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="achat_plaque_numero"/>
    <field editable="1" name="adresse_complete"/>
    <field editable="1" name="code_postal"/>
    <field editable="1" name="commentaire"/>
    <field editable="1" name="createur"/>
    <field editable="1" name="createur_point"/>
    <field editable="1" name="date_creation"/>
    <field editable="0" name="date_creation_point"/>
    <field editable="1" name="date_modif"/>
    <field editable="0" name="date_modif_point"/>
    <field editable="1" name="erreur"/>
    <field editable="1" name="id_commune"/>
    <field editable="1" name="id_parcelle"/>
    <field editable="0" name="id_point"/>
    <field editable="0" name="id_voie"/>
    <field editable="1" name="modificateur"/>
    <field editable="1" name="modificateur_point"/>
    <field editable="1" name="numero"/>
    <field editable="1" name="suffixe"/>
    <field editable="1" name="type_pos"/>
    <field editable="0" name="voie_nom_complet"/>
  </editable>
  <labelOnTop>
    <field name="achat_plaque_numero" labelOnTop="0"/>
    <field name="adresse_complete" labelOnTop="0"/>
    <field name="code_postal" labelOnTop="0"/>
    <field name="commentaire" labelOnTop="0"/>
    <field name="createur" labelOnTop="0"/>
    <field name="createur_point" labelOnTop="0"/>
    <field name="date_creation" labelOnTop="0"/>
    <field name="date_creation_point" labelOnTop="0"/>
    <field name="date_modif" labelOnTop="0"/>
    <field name="date_modif_point" labelOnTop="0"/>
    <field name="erreur" labelOnTop="0"/>
    <field name="id_commune" labelOnTop="0"/>
    <field name="id_parcelle" labelOnTop="0"/>
    <field name="id_point" labelOnTop="0"/>
    <field name="id_voie" labelOnTop="0"/>
    <field name="modificateur" labelOnTop="0"/>
    <field name="modificateur_point" labelOnTop="0"/>
    <field name="numero" labelOnTop="0"/>
    <field name="suffixe" labelOnTop="0"/>
    <field name="type_pos" labelOnTop="0"/>
    <field name="voie_nom_complet" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id_point</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>

<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="0" simplifyLocal="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08" labelsEnabled="0" readOnly="0" maxScale="0" version="3.4.15-Madeira" simplifyMaxScale="1" simplifyDrawingTol="1" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol name="0" clip_to_extent="1" type="marker" alpha="1" force_rhr="0">
        <layer enabled="1" class="SimpleMarker" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="190,178,151,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="id_point" key="dualview/previewExpressions"/>
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
  <DiagramLayerSettings dist="0" zIndex="0" placement="0" obstacle="0" linePlacementFlags="18" priority="0" showAll="1">
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
    <field name="id_point">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="numero">
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
    <field name="suffixe">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="a" type="QString" value="a"/>
              </Option>
              <Option type="Map">
                <Option name="b" type="QString" value="b"/>
              </Option>
              <Option type="Map">
                <Option name="bis" type="QString" value="bis"/>
              </Option>
              <Option type="Map">
                <Option name="c" type="QString" value="c"/>
              </Option>
              <Option type="Map">
                <Option name="d" type="QString" value="d"/>
              </Option>
              <Option type="Map">
                <Option name="e" type="QString" value="e"/>
              </Option>
              <Option type="Map">
                <Option name="quater" type="QString" value="quater"/>
              </Option>
              <Option type="Map">
                <Option name="quinquies" type="QString" value="quinquies"/>
              </Option>
              <Option type="Map">
                <Option name="ter" type="QString" value="ter"/>
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
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code_postal">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_pos">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="achat_plaque_numero">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value=""/>
            <Option name="UncheckedState" type="QString" value=""/>
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
    <field name="erreur">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value=""/>
            <Option name="UncheckedState" type="QString" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="commentaire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_voie">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" type="bool" value="false"/>
            <Option name="AllowNULL" type="bool" value="false"/>
            <Option name="MapIdentification" type="bool" value="false"/>
            <Option name="OrderByValue" type="bool" value="false"/>
            <Option name="ReadOnly" type="bool" value="false"/>
            <Option name="Relation" type="QString" value="point_adre_id_voie_voie_77a8b_id_voie"/>
            <Option name="ShowForm" type="bool" value="false"/>
            <Option name="ShowOpenFormButton" type="bool" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id_commune">
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
    <field name="id_parcelle">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="validation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant" index="0" field="id_point"/>
    <alias name="Numéro du point" index="1" field="numero"/>
    <alias name="Suffixe" index="2" field="suffixe"/>
    <alias name="Adresse complète" index="3" field="adresse_complete"/>
    <alias name="Code Postal" index="4" field="code_postal"/>
    <alias name="Positionnement" index="5" field="type_pos"/>
    <alias name="La plaque est à acheter ?" index="6" field="achat_plaque_numero"/>
    <alias name="Créateur du point" index="7" field="createur"/>
    <alias name="Date de création du point" index="8" field="date_creation"/>
    <alias name="Modificateur du point" index="9" field="modificateur"/>
    <alias name="Date de modification du point" index="10" field="date_modif"/>
    <alias name="Une erreur a été constatée ?" index="11" field="erreur"/>
    <alias name="Commentaire" index="12" field="commentaire"/>
    <alias name="Voie" index="13" field="id_voie"/>
    <alias name="" index="14" field="id_commune"/>
    <alias name="" index="15" field="id_parcelle"/>
    <alias name="" index="16" field="validation"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="id_point"/>
    <default expression="" applyOnUpdate="0" field="numero"/>
    <default expression="" applyOnUpdate="0" field="suffixe"/>
    <default expression="" applyOnUpdate="0" field="adresse_complete"/>
    <default expression="" applyOnUpdate="0" field="code_postal"/>
    <default expression="" applyOnUpdate="0" field="type_pos"/>
    <default expression="" applyOnUpdate="0" field="achat_plaque_numero"/>
    <default expression="" applyOnUpdate="0" field="createur"/>
    <default expression="" applyOnUpdate="0" field="date_creation"/>
    <default expression="" applyOnUpdate="0" field="modificateur"/>
    <default expression="" applyOnUpdate="0" field="date_modif"/>
    <default expression="" applyOnUpdate="0" field="erreur"/>
    <default expression="" applyOnUpdate="0" field="commentaire"/>
    <default expression="" applyOnUpdate="0" field="id_voie"/>
    <default expression="" applyOnUpdate="0" field="id_commune"/>
    <default expression="" applyOnUpdate="0" field="id_parcelle"/>
    <default expression="" applyOnUpdate="0" field="validation"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" notnull_strength="1" constraints="3" exp_strength="0" field="id_point"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="numero"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="suffixe"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="adresse_complete"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="code_postal"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="type_pos"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="achat_plaque_numero"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="createur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="date_creation"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="modificateur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="date_modif"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="erreur"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="commentaire"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="id_voie"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="id_commune"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="id_parcelle"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="validation"/>
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
    <constraint exp="" desc="" field="validation"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" hidden="0" name="id_point" type="field"/>
      <column width="-1" hidden="0" name="numero" type="field"/>
      <column width="-1" hidden="0" name="suffixe" type="field"/>
      <column width="-1" hidden="0" name="adresse_complete" type="field"/>
      <column width="-1" hidden="0" name="code_postal" type="field"/>
      <column width="-1" hidden="0" name="type_pos" type="field"/>
      <column width="-1" hidden="0" name="achat_plaque_numero" type="field"/>
      <column width="-1" hidden="0" name="erreur" type="field"/>
      <column width="-1" hidden="0" name="commentaire" type="field"/>
      <column width="220" hidden="0" name="id_voie" type="field"/>
      <column width="-1" hidden="0" name="id_commune" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
      <column width="-1" hidden="0" name="id_parcelle" type="field"/>
      <column width="-1" hidden="0" name="createur" type="field"/>
      <column width="-1" hidden="0" name="date_creation" type="field"/>
      <column width="-1" hidden="0" name="modificateur" type="field"/>
      <column width="-1" hidden="0" name="date_modif" type="field"/>
      <column width="-1" hidden="0" name="validation" type="field"/>
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
    <attributeEditorContainer name="Point d'adresse" columnCount="1" groupBox="0" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
      <attributeEditorContainer name="Création du point" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="id_point" index="0" showLabel="1"/>
        <attributeEditorField name="numero" index="1" showLabel="1"/>
        <attributeEditorField name="suffixe" index="2" showLabel="1"/>
        <attributeEditorField name="id_voie" index="13" showLabel="1"/>
        <attributeEditorField name="adresse_complete" index="3" showLabel="1"/>
        <attributeEditorField name="type_pos" index="5" showLabel="1"/>
        <attributeEditorField name="achat_plaque_numero" index="6" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Commune" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="code_postal" index="4" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Utilisateur" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="createur" index="7" showLabel="1"/>
        <attributeEditorField name="date_creation" index="8" showLabel="1"/>
        <attributeEditorField name="modificateur" index="9" showLabel="1"/>
        <attributeEditorField name="date_modif" index="10" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Erreur" columnCount="1" groupBox="1" showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="">
        <attributeEditorField name="erreur" index="11" showLabel="1"/>
        <attributeEditorField name="commentaire" index="12" showLabel="1"/>
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
    <field name="validation" editable="1"/>
    <field name="voie_nom_complet" editable="0"/>
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
    <field name="validation" labelOnTop="0"/>
    <field name="voie_nom_complet" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id_point</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>

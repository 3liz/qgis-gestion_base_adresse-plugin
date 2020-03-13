<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" readOnly="0" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" styleCategories="AllStyleCategories" simplifyLocal="0" labelsEnabled="0" version="3.4.15-Madeira" simplifyDrawingTol="1" simplifyAlgorithm="0" simplifyDrawingHints="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol alpha="1" force_rhr="0" clip_to_extent="1" name="0" type="marker">
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
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
    <property key="dualview/previewExpressions" value="id_point"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory scaleDependency="Area" labelPlacementMethod="XHeight" penAlpha="255" lineSizeType="MM" barWidth="5" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" enabled="0" height="15" scaleBasedVisibility="0" rotationOffset="270" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" penWidth="0" minimumSize="0" sizeType="MM" maxScaleDenominator="1e+08" opacity="1" backgroundColor="#ffffff" minScaleDenominator="0" penColor="#000000" width="15">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" field="" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="0" showAll="1" dist="0" linePlacementFlags="18" priority="0" obstacle="0" zIndex="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
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
                <Option name="BIS" type="QString" value="bis"/>
              </Option>
              <Option type="Map">
                <Option name="TER" type="QString" value="ter"/>
              </Option>
              <Option type="Map">
                <Option name="QUARTER" type="QString" value="qua"/>
              </Option>
              <Option type="Map">
                <Option name="QUINQUIENS" type="QString" value="qui"/>
              </Option>
              <Option type="Map">
                <Option name="A" type="QString" value="a"/>
              </Option>
              <Option type="Map">
                <Option name="B" type="QString" value="b"/>
              </Option>
              <Option type="Map">
                <Option name="C" type="QString" value="c"/>
              </Option>
              <Option type="Map">
                <Option name="D" type="QString" value="d"/>
              </Option>
              <Option type="Map">
                <Option name="E" type="QString" value="e"/>
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
    <alias index="0" name="Identifiant" field="id_point"/>
    <alias index="1" name="Numéro du point" field="numero"/>
    <alias index="2" name="Suffixe" field="suffixe"/>
    <alias index="3" name="Adresse complète" field="adresse_complete"/>
    <alias index="4" name="Code Postal" field="code_postal"/>
    <alias index="5" name="Positionnement" field="type_pos"/>
    <alias index="6" name="La plaque est à acheter ?" field="achat_plaque_numero"/>
    <alias index="7" name="Créateur du point" field="createur"/>
    <alias index="8" name="Date de création du point" field="date_creation"/>
    <alias index="9" name="Modificateur du point" field="modificateur"/>
    <alias index="10" name="Date de modification du point" field="date_modif"/>
    <alias index="11" name="Une erreur a été constatée ?" field="erreur"/>
    <alias index="12" name="Commentaire" field="commentaire"/>
    <alias index="13" name="Voie" field="id_voie"/>
    <alias index="14" name="" field="id_commune"/>
    <alias index="15" name="" field="id_parcelle"/>
    <alias index="16" name="" field="validation"/>
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
    <default applyOnUpdate="0" expression="" field="validation"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" field="id_point" exp_strength="0" constraints="3"/>
    <constraint notnull_strength="1" unique_strength="0" field="numero" exp_strength="0" constraints="1"/>
    <constraint notnull_strength="0" unique_strength="0" field="suffixe" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="adresse_complete" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="code_postal" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="type_pos" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="achat_plaque_numero" exp_strength="0" constraints="1"/>
    <constraint notnull_strength="0" unique_strength="0" field="createur" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_creation" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="modificateur" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_modif" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="erreur" exp_strength="0" constraints="1"/>
    <constraint notnull_strength="0" unique_strength="0" field="commentaire" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_voie" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_commune" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="id_parcelle" exp_strength="0" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="validation" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="id_point" desc=""/>
    <constraint exp="" field="numero" desc=""/>
    <constraint exp="" field="suffixe" desc=""/>
    <constraint exp="" field="adresse_complete" desc=""/>
    <constraint exp="" field="code_postal" desc=""/>
    <constraint exp="" field="type_pos" desc=""/>
    <constraint exp="" field="achat_plaque_numero" desc=""/>
    <constraint exp="" field="createur" desc=""/>
    <constraint exp="" field="date_creation" desc=""/>
    <constraint exp="" field="modificateur" desc=""/>
    <constraint exp="" field="date_modif" desc=""/>
    <constraint exp="" field="erreur" desc=""/>
    <constraint exp="" field="commentaire" desc=""/>
    <constraint exp="" field="id_voie" desc=""/>
    <constraint exp="" field="id_commune" desc=""/>
    <constraint exp="" field="id_parcelle" desc=""/>
    <constraint exp="" field="validation" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id_point" type="field" width="-1"/>
      <column hidden="0" name="numero" type="field" width="-1"/>
      <column hidden="0" name="suffixe" type="field" width="-1"/>
      <column hidden="0" name="adresse_complete" type="field" width="-1"/>
      <column hidden="0" name="code_postal" type="field" width="-1"/>
      <column hidden="0" name="type_pos" type="field" width="-1"/>
      <column hidden="0" name="achat_plaque_numero" type="field" width="-1"/>
      <column hidden="0" name="erreur" type="field" width="-1"/>
      <column hidden="0" name="commentaire" type="field" width="-1"/>
      <column hidden="0" name="id_voie" type="field" width="220"/>
      <column hidden="0" name="id_commune" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" name="id_parcelle" type="field" width="-1"/>
      <column hidden="0" name="createur" type="field" width="-1"/>
      <column hidden="0" name="date_creation" type="field" width="-1"/>
      <column hidden="0" name="modificateur" type="field" width="-1"/>
      <column hidden="0" name="date_modif" type="field" width="-1"/>
      <column hidden="0" name="validation" type="field" width="-1"/>
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
    <attributeEditorContainer name="Point d'adresse" showLabel="1" groupBox="0" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
      <attributeEditorContainer name="Création du point" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField index="0" name="id_point" showLabel="1"/>
        <attributeEditorField index="1" name="numero" showLabel="1"/>
        <attributeEditorField index="2" name="suffixe" showLabel="1"/>
        <attributeEditorField index="13" name="id_voie" showLabel="1"/>
        <attributeEditorField index="3" name="adresse_complete" showLabel="1"/>
        <attributeEditorField index="5" name="type_pos" showLabel="1"/>
        <attributeEditorField index="6" name="achat_plaque_numero" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Commune" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField index="4" name="code_postal" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Utilisateur" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField index="7" name="createur" showLabel="1"/>
        <attributeEditorField index="8" name="date_creation" showLabel="1"/>
        <attributeEditorField index="9" name="modificateur" showLabel="1"/>
        <attributeEditorField index="10" name="date_modif" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Erreur" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField index="11" name="erreur" showLabel="1"/>
        <attributeEditorField index="12" name="commentaire" showLabel="1"/>
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

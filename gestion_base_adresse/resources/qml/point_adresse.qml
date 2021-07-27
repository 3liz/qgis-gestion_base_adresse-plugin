<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Fields|Forms" version="3.16.8-Hannover">
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="RuleRenderer">
    <rules key="{8802a37f-2f4e-4ee5-b4b3-ec519d0efc75}">
      <rule symbol="0" filter=" &quot;valide&quot; = false and  &quot;erreur&quot; = false" label="Non validé et pas d'erreur" key="{d3c4e791-dbaf-4196-a5cf-9da6b348ed7d}"/>
      <rule symbol="1" filter=" &quot;valide&quot; = true and  &quot;erreur&quot; = false" label="Validé" key="{0ff3b8c9-610a-4a3f-b0aa-35b6b2e07b22}"/>
      <rule symbol="2" filter=" &quot;erreur&quot; = true" label="Erreur" key="{8c0bf604-1c09-4819-82a4-bcd4ad0abed7}"/>
    </rules>
    <symbols>
      <symbol alpha="1" name="0" clip_to_extent="1" type="marker" force_rhr="0">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="1" clip_to_extent="1" type="marker" force_rhr="0">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="2" clip_to_extent="1" type="marker" force_rhr="0">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <fieldConfiguration>
    <field configurationFlags="None" name="id_point">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="numero">
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
    <field configurationFlags="None" name="suffixe">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option value="bis" name="BIS" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="ter" name="TER" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="qua" name="QUARTER" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="qui" name="QUINQUIENS" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="a" name="A" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="b" name="B" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="c" name="C" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="d" name="D" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="e" name="E" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="adresse_complete">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="code_postal">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="type_pos">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="achat_plaque_numero">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="date_creation">
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
    <field configurationFlags="None" name="modificateur">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="date_modif">
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
    <field configurationFlags="None" name="erreur">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="commentaire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="id_voie">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="Description" type="QString"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="id_voie" name="Key" type="QString"/>
            <Option value="voie_bed35aec_c709_4d8b_9217_319aea4c1a36" name="Layer" type="QString"/>
            <Option value="voie" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='adresse' sslmode=disable key='id_voie' estimatedmetadata=true checkPrimaryKeyUnicity='1' table=&quot;adresse&quot;.&quot;voie&quot; (geom)" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="nom_complet" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="id_commune">
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
    <field configurationFlags="None" name="id_parcelle">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="valide">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="0" name="TextDisplayMethod" type="int"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="verif_terrain">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="0" name="TextDisplayMethod" type="int"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="complement_adresse">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="lieudit_complement_nom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="creation_adresse">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="0" name="TextDisplayMethod" type="int"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant" field="id_point" index="0"/>
    <alias name="Numéro du point" field="numero" index="1"/>
    <alias name="Suffixe" field="suffixe" index="2"/>
    <alias name="Adresse complète" field="adresse_complete" index="3"/>
    <alias name="Code Postal" field="code_postal" index="4"/>
    <alias name="Positionnement" field="type_pos" index="5"/>
    <alias name="La plaque est à acheter ?" field="achat_plaque_numero" index="6"/>
    <alias name="Créateur du point" field="createur" index="7"/>
    <alias name="Date de création du point" field="date_creation" index="8"/>
    <alias name="Modificateur du point" field="modificateur" index="9"/>
    <alias name="Date de modification du point" field="date_modif" index="10"/>
    <alias name="Une erreur a été constatée ?" field="erreur" index="11"/>
    <alias name="Commentaire" field="commentaire" index="12"/>
    <alias name="Voie" field="id_voie" index="13"/>
    <alias name="" field="id_commune" index="14"/>
    <alias name="" field="id_parcelle" index="15"/>
    <alias name="Point valide" field="valide" index="16"/>
    <alias name="Vérification terrain" field="verif_terrain" index="17"/>
    <alias name="" field="complement_adresse" index="18"/>
    <alias name="" field="lieudit_complement_nom" index="19"/>
    <alias name="" field="creation_adresse" index="20"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" field="id_point" expression=""/>
    <default applyOnUpdate="0" field="numero" expression=""/>
    <default applyOnUpdate="0" field="suffixe" expression=""/>
    <default applyOnUpdate="0" field="adresse_complete" expression=""/>
    <default applyOnUpdate="0" field="code_postal" expression=""/>
    <default applyOnUpdate="0" field="type_pos" expression=""/>
    <default applyOnUpdate="0" field="achat_plaque_numero" expression=""/>
    <default applyOnUpdate="0" field="createur" expression=""/>
    <default applyOnUpdate="0" field="date_creation" expression=""/>
    <default applyOnUpdate="0" field="modificateur" expression=""/>
    <default applyOnUpdate="0" field="date_modif" expression=""/>
    <default applyOnUpdate="0" field="erreur" expression=""/>
    <default applyOnUpdate="0" field="commentaire" expression=""/>
    <default applyOnUpdate="0" field="id_voie" expression=""/>
    <default applyOnUpdate="0" field="id_commune" expression=""/>
    <default applyOnUpdate="0" field="id_parcelle" expression=""/>
    <default applyOnUpdate="0" field="valide" expression="1"/>
    <default applyOnUpdate="0" field="verif_terrain" expression=""/>
    <default applyOnUpdate="0" field="complement_adresse" expression=""/>
    <default applyOnUpdate="0" field="lieudit_complement_nom" expression=""/>
    <default applyOnUpdate="0" field="creation_adresse" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="id_point" constraints="3" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="numero" constraints="1" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="suffixe" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="adresse_complete" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="code_postal" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="type_pos" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="achat_plaque_numero" constraints="1" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="createur" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="date_creation" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="modificateur" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="date_modif" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="erreur" constraints="1" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="commentaire" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="id_voie" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="id_commune" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="id_parcelle" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="valide" constraints="1" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="verif_terrain" constraints="1" notnull_strength="1" exp_strength="0"/>
    <constraint unique_strength="0" field="complement_adresse" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="lieudit_complement_nom" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="creation_adresse" constraints="0" notnull_strength="0" exp_strength="0"/>
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
    <constraint desc="" field="valide" exp=""/>
    <constraint desc="" field="verif_terrain" exp=""/>
    <constraint desc="" field="complement_adresse" exp=""/>
    <constraint desc="" field="lieudit_complement_nom" exp=""/>
    <constraint desc="" field="creation_adresse" exp=""/>
  </constraintExpressions>
  <expressionfields/>
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
    <attributeEditorContainer showLabel="1" visibilityExpression="" name="Point d'adresse" visibilityExpressionEnabled="0" columnCount="1" groupBox="0">
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Création du point" visibilityExpressionEnabled="0" columnCount="1" groupBox="1">
        <attributeEditorField showLabel="1" name="id_point" index="0"/>
        <attributeEditorField showLabel="1" name="numero" index="1"/>
        <attributeEditorField showLabel="1" name="suffixe" index="2"/>
        <attributeEditorField showLabel="1" name="id_voie" index="13"/>
        <attributeEditorField showLabel="1" name="adresse_complete" index="3"/>
        <attributeEditorField showLabel="1" name="type_pos" index="5"/>
        <attributeEditorField showLabel="1" name="achat_plaque_numero" index="6"/>
        <attributeEditorField showLabel="1" name="valide" index="16"/>
        <attributeEditorField showLabel="1" name="verif_terrain" index="17"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Commune" visibilityExpressionEnabled="0" columnCount="1" groupBox="1">
        <attributeEditorField showLabel="1" name="code_postal" index="4"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Utilisateur" visibilityExpressionEnabled="0" columnCount="1" groupBox="1">
        <attributeEditorField showLabel="1" name="createur" index="7"/>
        <attributeEditorField showLabel="1" name="date_creation" index="8"/>
        <attributeEditorField showLabel="1" name="modificateur" index="9"/>
        <attributeEditorField showLabel="1" name="date_modif" index="10"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" name="Erreur" visibilityExpressionEnabled="0" columnCount="1" groupBox="1">
        <attributeEditorField showLabel="1" name="erreur" index="11"/>
        <attributeEditorField showLabel="1" name="commentaire" index="12"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="achat_plaque_numero" editable="1"/>
    <field name="adresse_complete" editable="1"/>
    <field name="code_postal" editable="1"/>
    <field name="commentaire" editable="1"/>
    <field name="complement_adresse" editable="1"/>
    <field name="createur" editable="1"/>
    <field name="createur_point" editable="1"/>
    <field name="creation_adresse" editable="1"/>
    <field name="date_creation" editable="0"/>
    <field name="date_creation_point" editable="0"/>
    <field name="date_modif" editable="0"/>
    <field name="date_modif_point" editable="0"/>
    <field name="erreur" editable="1"/>
    <field name="id_commune" editable="1"/>
    <field name="id_parcelle" editable="1"/>
    <field name="id_point" editable="0"/>
    <field name="id_voie" editable="0"/>
    <field name="lieudit_complement_nom" editable="1"/>
    <field name="modificateur" editable="1"/>
    <field name="modificateur_point" editable="1"/>
    <field name="numero" editable="1"/>
    <field name="suffixe" editable="1"/>
    <field name="type_pos" editable="1"/>
    <field name="validation" editable="1"/>
    <field name="valide" editable="1"/>
    <field name="verif_terrain" editable="1"/>
    <field name="voie_nom_complet" editable="0"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="a_valider"/>
    <field labelOnTop="0" name="achat_plaque_numero"/>
    <field labelOnTop="0" name="adresse_complete"/>
    <field labelOnTop="0" name="code_postal"/>
    <field labelOnTop="0" name="commentaire"/>
    <field labelOnTop="0" name="complement_adresse"/>
    <field labelOnTop="0" name="createur"/>
    <field labelOnTop="0" name="createur_point"/>
    <field labelOnTop="0" name="creation_adresse"/>
    <field labelOnTop="0" name="date_creation"/>
    <field labelOnTop="0" name="date_creation_point"/>
    <field labelOnTop="0" name="date_modif"/>
    <field labelOnTop="0" name="date_modif_point"/>
    <field labelOnTop="0" name="erreur"/>
    <field labelOnTop="0" name="id_commune"/>
    <field labelOnTop="0" name="id_parcelle"/>
    <field labelOnTop="0" name="id_point"/>
    <field labelOnTop="0" name="id_voie"/>
    <field labelOnTop="0" name="lieudit_complement_nom"/>
    <field labelOnTop="0" name="modificateur"/>
    <field labelOnTop="0" name="modificateur_point"/>
    <field labelOnTop="0" name="numero"/>
    <field labelOnTop="0" name="suffixe"/>
    <field labelOnTop="0" name="type_pos"/>
    <field labelOnTop="0" name="validation"/>
    <field labelOnTop="0" name="valide"/>
    <field labelOnTop="0" name="verif_terrain"/>
    <field labelOnTop="0" name="voie_nom_complet"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>0</layerGeometryType>
</qgis>

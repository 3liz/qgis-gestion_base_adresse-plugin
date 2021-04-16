---
hide:
  - navigation
  - toc
---

# Gestion d'une base adresse avec QGIS et Lizmap

## Diagrammes

```mermaid
graph TD
Database_Structure[Création de la structure de la base de données]
Load_Layers[Chargement des couches]
Load_Styles[Chargements des styles]
Config_Project[Configuration du projet]

subgraph QGIS
Database_Structure --> Load_Layers
Load_Layers --> Load_Styles
Load_Layers --> Config_Project
end
```
```mermaid
graph TD
Lizmap_edit[Edition dans Lizmap]
Export_doc[Export des documents avec Lizmap]

subgraph Lizmap
Lizmap_edit
Export_doc
end
```

![Logo](media/icon.png)

Démo du module web sur [demo.lizmap.com](https://demo.lizmap.com/adresse/index.php/view/map/?repository=demo&project=adresse)

![Démo Lizmap](media/demo_qgis.png)

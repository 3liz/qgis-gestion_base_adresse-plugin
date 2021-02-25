# Contribution

Le projet est hébergé sur GitHub

[Visiter GitHub](https://github.com/3liz/qgis-gestion_base_adresse-plugin/){: .md-button .md-button--primary }

## Code

Le code SQL et Python sont couverts par des tests unitaires utilisant Docker.

[![Flake8](https://github.com/3liz/qgis-gestion_base_adresse-plugin/actions/workflows/flake8.yml/badge.svg)](https://github.com/3liz/qgis-gestion_base_adresse-plugin/actions/workflows/flake8.yml)

```bash
pip install -r requirements-dev.txt
flake8
make tests
make test_migration
```

Sur une nouvelle base de données, si vous souhaitez installer la base de données avec les migrations :

```python
import os
os.environ['TEST_DATABASE_INSTALL_ADRESSE'] = '0.2.3'  # Enable
del os.environ['TEST_DATABASE_INSTALL_ADRESSE']  # Disable
```

## Documentation

La documentation utilise [MkDocs](https://www.mkdocs.org/) avec [Material](https://squidfunk.github.io/mkdocs-material/) :

```bash
pip install -r requirements-doc.txt
mkdocs serve
```

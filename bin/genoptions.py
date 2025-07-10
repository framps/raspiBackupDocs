#!/usr/bin/env python
""" Markdown generator

Print a text to stdout containing raspiBackup's commandline options
formatted as an HTML anchor and Markdown heading and contents.

Every option has a small table in it with some technical infos.

This is special for the documentation in raspiBackupDoc.
It can be inserted in file 'usage-and-options.md'.

Requires Python 3.9 or higher and PyYAML.
"""

from pathlib import Path

import yaml

DATA_IN_FILENAME = "data/options-de.yaml"

with Path(DATA_IN_FILENAME).open("r", encoding="utf-8") as yamlfile:
    params = yaml.safe_load(yamlfile)

for param in sorted(params):
    p = params[param]
    in_inst = "konfigurierbar" if p["in_inst"] == "ja" else ""

    try:
        print(f'<a name="{p["anchor"]}"></a>')
        print(f'### {param}: {p.get("description", "")}')
        print()
        print("\n".join(p["text"]))
        print()
        print("| Optionsname | Standard | Im Installer | Konfigurationsname |")
        print("|-------------|----------|--------------|--------------------|")
        print(f"| {param} | {p["default"]} | {in_inst} | {p["cfg_name"]} |")
        print()
        print()

    except KeyError as e:
        print("KEY_ERROR!", str(e), param)

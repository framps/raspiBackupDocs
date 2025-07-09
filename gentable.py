#!/usr/bin/env python
""" Markdown table generator

Just for a very specialized case...

Requires Python 3.9 or higher
"""

import re
from pathlib import Path
# from pprint import pprint

import yaml

# MD_SOURCE_FILENAME = "de/src/usage-and-options-simonz.md"
MD_SOURCE_FILENAME = "de/src/usage-and-options-simonz2.md"
DATA_OUT_FILENAME = "de/src/usage-and-options.yaml"

FILE = Path(MD_SOURCE_FILENAME)


def write_results(params):
    """ todo """
    for param in sorted(params):
        p = params[param]
        try:
            print(f'<a name="{p["anchor"]}"></a>')
            print(f'### {param}: {p.get("description", "")}')
            print()
            print("\n".join(p["text"]))
            print()
            print("| Optionsname | Standard| Im Installer setzbar | Konfigurationsname |")
            print("|-------------|---------| :------------------: |--------------------|")
            print(f"| {param} | {p["default"]} | {p["in_inst"]} | {p["cfg_name"]} |")
            print()
            print()

        except KeyError as e:
            print("KEY_ERROR!", str(e), param)


def write_datafile(params, datafile):
    """ todo

    https://pyyaml.org/wiki/PyYAMLDocumentation
    """

    with Path(datafile).open("w") as yamlfile:
        yaml.dump(params, yamlfile,
                  allow_unicode=True,
                  default_flow_style=False)


def do_results(params):
    """ todo """
    for p in params:
        if "text" in params[p]:   # only missing in keep__type...
            params[p]["text"] = "\n".join(params[p]["text"]).strip().split("\n")
    # pprint(params)
    write_results(params)
    write_datafile(params, DATA_OUT_FILENAME)


def fill_parms(param_anchor, param_headings, param_text, in_inst):
    """ todo """

    # print("CHECK HEADINGS", line)
    if not in_inst:
        in_inst = "nein"
    for heading in param_headings:
        m = re.match(r"##* (.*?)($| (⇌ (([^ \[]*)(\s*\[(.*?)\])*))*)", heading)
        if m:
            # print(m.groups())
            name, cfg_name, default = (m.groups()[0], m.groups()[4], m.groups()[6])

            # print("name=", name)
            if name not in params:
                params[name] = {}
            params[name] |= {"cfg_name": cfg_name,
                             "default": default,
                             "anchor": param_anchor,
                             "text": param_text,
                             "in_inst": in_inst,
                             }


with FILE.open(encoding="utf-8") as f:
    lines = f.readlines()

headings = []
these_headings = []
include_filename = ""
heading_level = ""
anchor = ""
params = {}
descriptions = {}
param_text = []
in_inst = ""

# print("Source:", MD_SOURCE_FILENAME)

for line in lines:
    line = line.strip()

    m = re.match(r"\s*- \[(-[^\]]*)\]", line)
    if m:
        # print("descr::", m.groups())
        names, descr = m.groups()[0].split(":")
        descr = descr.strip()
        for name in names.split(","):
            name = name.strip()
            params[name] = {"description": descr}

    if line.startswith("#"):
        current_heading_level = re.match(r"(##*)", line).groups()[0]
        if current_heading_level <= heading_level:
            # print("HEADING SWITCH")
            # print(line)
            break
        headings.append(line)

    if not include_filename:
        # print(line)
        m = re.search(r"^\s*{{\s*#include ([^\s]*)\s*}}", line)
        if m:
            include_filename = m.groups()[0]
            heading_level = re.match(r"(##*)", headings[-1]).groups()[0]
            # print(include_filename, heading_level)
        continue

    if not anchor:
        m = re.match(r'<a name="(.*)">', line)
        if m:
            anchor = m.groups()[0]
            # print("anchor:", anchor)
        continue

    if line.startswith("---"):  # the optional final <hr>
        break

    # print(line)
    if line.startswith("#"):
        these_headings.append(line)
    else:
        param_text.append(line)

    if not in_inst:
        m = re.search(r'\[im Installer setzbar\]', line)
        if m:
            in_inst = "ja"
            param_text.pop()

    m = re.match(r'<a name="(.*)">', line)
    if m:
        current_anchor = anchor
        anchor = m.groups()[0]
    else:
        continue

    fill_parms(current_anchor, these_headings, param_text[:-1], in_inst)  # strip last line with next params anchor
    these_headings = []
    param_text = []
    in_inst = ""

fill_parms(anchor, these_headings, param_text, in_inst)
these_headings = []
param_text = []
in_inst = ""

do_results(params)

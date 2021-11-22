#!/bin/bash
cd "$(dirname "$0")"
pip install jsonschema
cd ..
cd v1.0.0
jsonschema -i open-brew-1-0-0.example.min.json open-brew-1-0-0.schema.json
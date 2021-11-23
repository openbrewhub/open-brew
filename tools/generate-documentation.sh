#!/bin/bash
cd "$(dirname "$0")"
cd ..
cd ./v1.0.0
pip install json-schema-for-humans
generate-schema-doc --config description_is_markdown=true open-brew-1-0-0.schema.json
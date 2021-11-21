#!/bin/bash
docker pull swaggerapi/swagger-editor
docker run -d -p 80:8888 -v $(pwd):/tmp -e SWAGGER_FILE=/../api/openapi-definition.yml swaggerapi/swagger-editor
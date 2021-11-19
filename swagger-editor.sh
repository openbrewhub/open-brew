docker pull swaggerapi/swagger-editor
docker run -d -p 80:8888 -v $(pwd):/tmp -e SWAGGER_FILE=/swagger.yml swaggerapi/swagger-editor
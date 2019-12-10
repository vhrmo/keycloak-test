### Build test Keycloak image

The image is customized and includes following changes:
- admin user defined (admin/admin)
- used in-memory H2 DB 
- created 'MyDemo' realm
- created Client
- created test users

`docker build --tag=keycloak-test .`

_Note: Creation of realms and clients is done after the server start-up - see `run-after-server-start.sh` script._

###Run Keycloak

**Run customized test image** 

`docker run --rm --name keycloak -p 9080:8080 keycloak-test`

**Run standard image** 

`docker run --rm --name keycloak -p 9080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_VENDOR=H2 jboss/keycloak:8.0.1`

###Connect to web admin console

http://127.0.0.1:9080/ 

### Connect to running container

`docker exec -it keycloak /bin/bash`

###References

Initial guide used to set up this project: https://scalac.io/user-authentication-keycloak-1





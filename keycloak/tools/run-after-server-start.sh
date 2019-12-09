#!/bin/bash

# TODO add better detection of server start
sleep 30s

/opt/jboss/keycloak/bin/kcadm.sh config credentials --server http://0.0.0.0:8080/auth --realm master --user admin --password admin
/opt/jboss/keycloak/bin/kcadm.sh create realms -s realm=MyDemo -s enabled=true -o
/opt/jboss/keycloak/bin/kcadm.sh create clients -r MyDemo -s clientId=my-react-client -s enabled=true -s publicClient=true -s 'redirectUris=["http://localhost:3000/*"]'
/opt/jboss/keycloak/bin/kcadm.sh create users -r MyDemo -s username=test1 -s enabled=true

#kcadm.sh set-password -r demorealm --username testuser --new-password NEWPASSWORD --temporary

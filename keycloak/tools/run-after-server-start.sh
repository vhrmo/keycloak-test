#!/bin/bash

sleep 10s

until `/opt/jboss/keycloak/bin/kcadm.sh config credentials --server http://0.0.0.0:8080/auth --realm master --user admin --password admin`
do
    sleep 2s
done

echo Applying post start-up configuration

/opt/jboss/keycloak/bin/kcadm.sh create realms -s realm=MyDemo -s enabled=true -o
/opt/jboss/keycloak/bin/kcadm.sh create clients -r MyDemo -s clientId=my-react-client -s enabled=true -s publicClient=true -s 'redirectUris=["http://localhost:3000/*"]'

# User with temp password
/opt/jboss/keycloak/bin/kcadm.sh create users -r MyDemo -s username=test1 -s enabled=true
/opt/jboss/keycloak/bin/kcadm.sh set-password -r MyDemo --username test1 --new-password startpw --temporary

# User with permanent password
/opt/jboss/keycloak/bin/kcadm.sh create users -r MyDemo -s username=test2 -s enabled=true
/opt/jboss/keycloak/bin/kcadm.sh set-password -r MyDemo --username test2 --new-password startpw 

echo Setup completed

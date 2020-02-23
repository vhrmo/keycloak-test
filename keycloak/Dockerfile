FROM jboss/keycloak:8.0.1

# Add admin user
#RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -r master -u admin -p admin

ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin
ENV DB_VENDOR=H2

COPY --chown=jboss:root ./tools /opt/jboss/tools

ENTRYPOINT [ "/opt/jboss/tools/my-entry-point.sh" ]
CMD ["-b", "0.0.0.0"]

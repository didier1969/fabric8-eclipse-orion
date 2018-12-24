#FROM fabric8/java
FROM jolokia/java-jolokia:6

RUN curl -o /tmp/orion.zip https://www.eclipse.org/downloads/download.php?file=/orion/drops/R-19.0-201808201406/eclipse-orion-19.0.0S1-win32.win32.x86_64.zip&mirror_id=1190 && \
    cd /opt && unzip /tmp/orion.zip && \
    rm -rf /tmp/orion.zip

RUN chmod +x /opt/eclipse/orion

EXPOSE 8080

WORKDIR /opt/eclipse

ADD  orion.conf /opt/eclipse/orion.conf
ADD  .gitconfig /root/.gitconfig

CMD ["/opt/eclipse/orion"]

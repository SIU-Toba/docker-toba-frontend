FROM siutoba/docker-web:latest
MAINTAINER smarconi@siu.edu.ar

#--------------------------------------------- NODE Y NVM -----------------------------------------
#change it to your required node version
ENV NODE_VERSION 0.10
#needed by nvm install
ENV NVM_DIR /home/node/.nvm

RUN git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION
RUN echo ". ~/.nvm/nvm.sh" >> ~/.bashrc
#--------------------------------------------------------------------------------------------------
COPY toba.sh /entrypoint.d/

ENV JASPER_HOST jasper
ENV JASPER_PORT 8081

#En lugar de utilizar http://localhost:puerto usa http://ip_interna, para poder hacer comunicaciones internas server-to-server
#RUN echo "UseCanonicalName On" >> /etc/apache2/apache2.conf

RUN chmod +x /entrypoint.d/*.sh


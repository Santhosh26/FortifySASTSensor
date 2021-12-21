FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install rpm -y

COPY Fortify_SCA_and_Apps_20.2.2_linux_x64.run /tmp
COPY fortify.license /tmp
COPY installerSettings /tmp

RUN chmod +x /tmp/Fortify_SCA_and_Apps_20.2.2_linux_x64.run && \
    /tmp/Fortify_SCA_and_Apps_20.2.2_linux_x64.run --mode unattended --optionfile /tmp/installerSettings && \
    /opt/Fortify/Fortify_SCA_and_Apps_20.2.2/bin/fortifyupdate && \
    rm /tmp/Fortify_SCA_and_Apps_20.2.2_linux_x64.run /tmp/fortify.license /tmp/installerSettings

FROM ubuntu
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get --yes update
RUN apt-get --yes install build-essential
RUN apt-get --yes install portaudio19-dev
RUN apt-get --yes install libbsd-dev
RUN apt-get --yes install libpng-dev
RUN apt-get --yes install libvorbis-dev
RUN apt-get --yes install libsdl2-dev
RUN apt-get --yes install libsdl2-2.0-0
RUN apt-get --yes install liblua5.2-dev
RUN apt-get --yes install libglew1.5-dev
RUN apt-get --yes install libssl-dev
RUN apt-get --yes install libttspico-utils
RUN apt-get --yes install sox
RUN apt-get --yes install libsdl2-image-dev
RUN apt-get --yes install espeak alsa-utils openscad git stgit
#RUN ap-gett --yes install pocketsphinx-utils pocketsphinx-lm-en-hub4 libpocketsphinx1
RUN apt-get --yes install gstreamer1.0-pocketsphinx libpocketsphinx-dev libpocketsphinx3 pocketsphinx pocketsphinx-en-us python3-pocketsphinx
RUN apt-get --yes install wget
RUN apt-get --yes install sudo
RUN apt-get --yes install vim-tiny
RUN export uid=1000 gid=100 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && chown ${uid}:${gid} -R /home/developer
USER root

WORKDIR /app
VOLUME /app

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

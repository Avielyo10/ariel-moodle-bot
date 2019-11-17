FROM fedora

RUN sudo dnf -y update && \
    sudo dnf -y install make wget gcc

RUN wget http://download.redis.io/redis-stable.tar.gz && \
    tar xvzf redis-stable.tar.gz && \
    sudo make install -C redis-stable

RUN useradd -ms /bin/bash moodle

ADD . ./
RUN chmod a+x entry-point.sh
RUN pip3 install python-telegram-bot redis selenium walrus

USER moodle
ENTRYPOINT [ "./entry-point.sh" ]
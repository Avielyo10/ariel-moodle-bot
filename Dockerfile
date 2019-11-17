FROM fedora

RUN sudo dnf -y update && \
    sudo dnf -y install make wget gcc firefox

RUN wget http://download.redis.io/redis-stable.tar.gz && \
    tar xvzf redis-stable.tar.gz && \
    sudo make install -C redis-stable

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz && \
    tar -xvzf geckodriver* && \
    chmod a+x geckodriver && \ 
    mv geckodriver /usr/local/bin/

RUN useradd -ms /bin/bash moodle

ADD . /home/moodle/
RUN chmod a+x /home/moodle/entry-point.sh && \
    chown -R moodle:moodle /home/moodle

RUN pip3 install python-telegram-bot redis selenium walrus

USER moodle
ENTRYPOINT [ "./home/moodle/entry-point.sh" ]
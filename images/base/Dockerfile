FROM registry.fedoraproject.org/fedora-toolbox:38

ENV NAME=base-toolbox VERSION=38
LABEL com.github.containers.toolbox="true" \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for my personal Fedora toolbox containers" \
      maintainer="Dušan Simić <dusan.simic1810@gmail.com>"

COPY README.md /README-base.md

RUN dnf install 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

COPY extra-packages /
RUN dnf -y install $(<extra-packages)
RUN rm /extra-packages

RUN mkdir /opt/oha
ADD https://github.com/hatoo/oha/releases/download/v0.5.9/oha-linux-amd64 /opt/oha/oha
RUN chmod +x /opt/oha/oha
RUN ln -s /opt/oha/oha /usr/bin/oha

ADD https://github.com/bootandy/dust/releases/download/v0.8.6/dust-v0.8.6-x86_64-unknown-linux-gnu.tar.gz /tmp/dust.tar.gz
RUN mkdir /tmp/dust
RUN tar -xf /tmp/dust.tar.gz -C /tmp/dust --strip-components=1
RUN mkdir /opt/dust
RUN mv /tmp/dust/dust /opt/dust/dust
RUN chmod +x /opt/dust/dust
RUN ln -s /opt/dust/dust /usr/bin/dust
RUN rm -rf /tmp/dust /tmp/dust.tar.gz

ENV LC_ALL=en_US.UTF-8

RUN dnf clean all

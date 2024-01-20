FROM registry.fedoraproject.org/fedora-toolbox:39

ENV NAME=base-toolbox VERSION=39
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

RUN mkdir -p /opt/oha/bin
ADD https://github.com/hatoo/oha/releases/download/v0.5.9/oha-linux-amd64 /opt/oha/bin/oha
RUN chmod +x /opt/oha/oha
ENV PATH="${PATH}:/opt/oha/bin"

ADD https://github.com/bootandy/dust/releases/download/v0.8.6/dust-v0.8.6-x86_64-unknown-linux-gnu.tar.gz /tmp/dust.tar.gz
RUN mkdir /tmp/dust
RUN tar -xf /tmp/dust.tar.gz -C /tmp/dust --strip-components=1
RUN mkdir /opt/dust
RUN mv /tmp/dust/dust /opt/dust/dust
RUN chmod +x /opt/dust/dust
RUN ln -s /opt/dust/dust /usr/bin/dust
RUN rm -rf /tmp/dust /tmp/dust.tar.gz

RUN mkdir -p /opt/translitrs/bin
ADD https://github.com/filiparag/translitRS/releases/download/0.2.2/translitrs-0.2.2-gnu_linux-x86_64 /opt/translitrs/bin/translitrs
RUN chmod +x /opt/translitrs/bin/translitrs
ENV PATH="${PATH}:/opt/translitrs/bin"

ENV LC_ALL=en_US.UTF-8

RUN dnf clean all

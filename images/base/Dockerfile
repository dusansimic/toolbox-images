FROM registry.fedoraproject.org/fedora-toolbox:37

ENV NAME=toolbox-base VERSION=37
LABEL com.github.containers.toolbox="true" \
			com.github.dusansimic.toolbox="true" \
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

ENV LC_ALL=en_US.UTF-8

RUN dnf clean all

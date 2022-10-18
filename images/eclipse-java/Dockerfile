FROM docker.io/dusansimic/toolbox-java:37

ENV NAME=toolbox-eclipse-java VERSION=37
LABEL com.github.containers.toolbox="true" \
			com.github.dusansimic.toolbox="true" \
			com.redhat.component="$NAME" \
			name="$NAME" \
			version="$VERSION" \
			usage="This image is meant to be used with the toolbox command" \
			summary="Eclipse Java image for my personal Fedora toolbox containers" \
			maintainer="Dušan Simić <dusan.simic1810@gmail.com"

COPY README.md /README-eclipse-java.md

RUN dnf -y install copr-cli
RUN dnf -y copr enable dusansimic/eclipse

COPY extra-packages /
RUN dnf -y install $(<extra-packages)
RUN rm /extra-packages

RUN dnf clean all

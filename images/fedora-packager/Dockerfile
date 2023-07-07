FROM ghcr.io/dusansimic/toolbox-images/base:38

ENV NAME=fedora-packager-toolbox VERSION=38
LABEL com.github.containers.toolbox="true" \
			com.redhat.component="$NAME" \
			name="$NAME" \
			version="$VERSION" \
			usage="This image is meant to be used with the toolbox command" \
			summary="Fedora packager image for my personal Fedora toolbox containers" \
			maintainer="Dušan Simić <dusan.simic1810@gmail.com>"

COPY README.md /README-fedora-packager.md

COPY extra-packages /
RUN dnf -y install $(<extra-packages)
RUN rm /extra-packages

RUN dnf clean all

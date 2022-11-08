FROM docker.io/dusansimic/toolbox-java:37

ENV NAME=toolbox-eclipse-java VERSION=37
LABEL com.github.containers.toolbox="true" \
			com.github.dusansimic.toolbox="true" \
			com.redhat.component="$NAME" \
			name="$NAME" \
			version="$VERSION" \
			usage="This image is meant to be used with the toolbox command" \
			summary="Svetovid image for my personal Fedora toolbox containers" \
			maintainer="Dušan Simić <dusan.simic1810@gmail.com"

COPY README.md /README-svetovid.md

COPY dusan.repo /
RUN dnf -y config-manager --add-repo /dusan.repo
RUN rm /dusan.repo

ENV CLASSPATH=/usr/share/java/svetovid-lib.jar

COPY --chmod=755 svetorun.sh /usr/bin/svetorun

COPY extra-packages /
RUN dnf -y install $(<extra-packages)
RUN rm /extra-packages

RUN dnf -y clean all

FROM ghcr.io/dusansimic/toolbox-images/base:38

ENV NAME=node-toolbox VERSION=38
LABEL com.github.containers.toolbox="true" \
			com.redhat.component="$NAME" \
			name="$NAME" \
			version="$VERSION" \
			usage="This image is meant to be used with the toolbox command" \
			summary="Node image for my personal Fedora toolbox containers" \
			maintainer="Dušan Simić <dusan.simic1810@gmail.com"

COPY README.md /README-node.md

COPY extra-packages /
RUN dnf -y install $(<extra-packages)
RUN rm /extra-packages

RUN npm install -g yarn pnpm

ADD https://github.com/jorgebucaran/nvm.fish/archive/refs/tags/2.2.13.tar.gz /tmp/nvm.tar.gz

RUN mkdir -p /tmp/nvm
RUN tar -xzf /tmp/nvm.tar.gz --strip-components=1 -C /tmp/nvm
RUN rm /tmp/nvm.tar.gz
RUN install -Dm644 -t /usr/share/licenses/nvm-fish /tmp/nvm/LICENSE.md
RUN install -Dm644 -t /usr/share/doc/nvm-fish /tmp/nvm/README.md
RUN install -Dm644 -t /usr/share/fish/vendor_completions.d /tmp/nvm/completions/*
RUN install -Dm644 -t /usr/share/fish/vendor_conf.d /tmp/nvm/conf.d/*
RUN install -Dm644 -t /usr/share/fish/vendor_functions.d /tmp/nvm/functions/*
RUN rm -rf /tmp/nvm

COPY install_nvm.fish /tmp
RUN fish /tmp/install_nvm.fish
RUN rm /tmp/install_nvm.fish

RUN dnf clean all

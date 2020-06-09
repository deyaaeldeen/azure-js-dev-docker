FROM archlinux/base

RUN pacman --quiet --noconfirm -Syu
RUN pacman --quiet --noconfirm -S base-devel git sudo time wget inetutils npm libsecret openssh python
RUN npm install -g @microsoft/rush

WORKDIR /app/src
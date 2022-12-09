# syntax = docker/dockerfile:1.3
FROM debian:bookworm-20220822-slim

ENV TERM='xterm-256color' \
  HOME='/root'

COPY ./docker/install-packages.sh /usr/bin/install-packages

RUN install-packages \
  ca-certificates \
  locales \
  gcc \
  tmux \
  curl \
  gawk \
  zsh \
  vim \ 
  git \
  python-is-python3 \
  python3

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

WORKDIR /root

RUN sh -c "$(curl -fsLS https://chezmoi.io/get)"

COPY . .dotfiles

RUN ./bin/chezmoi init \
  --apply \
  -S ~/.dotfiles \
  --promptString 'git email=daylinmorgan@gmail.com,git name=Daylin Morgan' \
  --promptBool 'use gui configs=false'

ENV DOTFILES_DIR="$HOME/.dotfiles" \
  PATH="$PATH:$HOME/bin:$HOME/.dotfiles/bin"

RUN --mount=type=secret,id=GITHUB_TOKEN \
  GITHUB_TOKEN=$(cat /run/secrets/GITHUB_TOKEN) \
  $HOME/.dotfiles/docker/install-tools.sh

# get shell extensions
RUN sheldon -q --config-file ~/.config/sheldon/plugins.toml lock

# install general tools used by neovim
RUN ~/.dotfiles/docker/install-dev-envs.sh

# install astronvim 
RUN ~/.config/astronvim/install.sh

CMD ["zsh"]

FROM debian:bookworm-20220822-slim

ENV TERM='xterm-256color' \
  HOME='/root'

COPY ./docker/install_packages.sh /usr/bin/install_packages

RUN install_packages \
  ca-certificates \
  locales \
  tmux \
  curl \
  gawk \
  zsh \
  vim \
  git \
  neovim

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

WORKDIR /root

RUN sh -c "$(curl -fsLS https://chezmoi.io/get)"

COPY . .dotfiles
RUN ./bin/chezmoi init --apply -S ~/.dotfiles

ENV DOTFILES_DIR="$HOME/.dotfiles" \
  PATH="$PATH:$HOME/bin:$HOME/.dotfiles/bin"

# setup eget for tools script
RUN curl https://zyedidia.github.io/eget.sh | sh && mv ./eget ./bin/eget

# use eget to fetch yq and some needed tools
RUN tools $(cat .dotfiles/docker/tools.txt)

# get shell extensions
RUN sheldon -q --config-file ~/.config/sheldon/plugins.toml lock

CMD ["zsh"]

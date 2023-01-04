FROM archlinux

COPY setup_user.sh /tmp/setup_user.sh

RUN pacman -Syu --noconfirm
RUN pacman -Sy --needed --noconfirm \
  neovim zsh tmux fzf nodejs yarn npm prettier python-pip xclip ctags tmux \
  base-devel ripgrep git openssh
# RUN pacman --noconfirm -S rustup && rustup default stable

RUN useradd -m uli
RUN chsh -s /usr/bin/zsh uli

# TODO
# sudo systemctl enable --now sshd

RUN sudo -u uli sh /tmp/setup_user.sh

COPY ./id_rsa.pub /home/uli/.ssh/authorized_keys

CMD ["su", "-l", "uli"]

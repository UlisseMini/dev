set -e

cd ~
alias config="git --git-dir=/home/uli/.dotfiles/ --work-tree=/home/uli"
git clone --bare https://github.com/UlisseMini/dotfiles .dotfiles
config config status.showUntrackedFiles no
config submodule update --init
config reset --hard

git config --global user.name "Ulisse Mini"
git config --global user.email "ulisse.mini@gmail.com"

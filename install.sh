#!/usr/bin/env sh
set -e

DOTFILES_LOCATION="${HOME}/dotfiles"    
export DOTFILES_LOCATION;

apt install -y zsh fonts-powerline fzf

if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended # Zshell
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "creating symlinks for zsh"
ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"
ln -sf "${DOTFILES_LOCATION}/zsh/.p10k.zsh" "${HOME}/.p10k.zsh"
ln -sf "${DOTFILES_LOCATION}/zsh/.zprofile.zsh" "${HOME}/.zprofile.zsh"

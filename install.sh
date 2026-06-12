#!/usr/bin/env bash
set -e
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

symlink() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "  linked $dst -> $src"
}
echo "Installing dotfiles..."

symlink "zsh/zshrc" ".zshrc"
symlink "zsh/zprofile" ".zprofile"
symlink "zsh/p10k.zsh" ".p10k.zsh"
symlink "git/gitconfig" ".gitconfig"
if [ ! -d "$HOME/.nvim" ]; then
  git clone git@github.com:dhirajbasukala/.nvim.git "$HOME/.nvim"
fi
ln -sfn "$HOME/.nvim" "$HOME/.config/nvim"
echo "  linked $HOME/.config/nvim -> $HOME/.nvim"
symlink "tmux/tmux.conf" ".tmux.conf"
symlink "tmux/bin/tmux-sessionizer" ".local/bin/tmux-sessionizer"
symlink "tmux/bin/tmux-windowizer" ".local/bin/tmux-windowizer"
symlink "tmux/bin/tmux-session-lister" ".local/bin/tmux-session-lister"
symlink "tmux/tmux-sessionizer.conf" ".config/tmux-sessionizer/tmux-sessionizer.conf"
if [ "$(uname)" = "Darwin" ]; then
  symlink "aerospace/aerospace.toml" ".aerospace.toml"
fi
symlink "lazygit/config.yml" ".config/lazygit/config.yml"
symlink "htop/htoprc" ".config/htop/htoprc"
symlink "pgcli/config" ".config/pgcli/config"

echo "DONE."

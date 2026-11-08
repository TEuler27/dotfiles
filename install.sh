#!/usr/bin/env bash
# Install everything these dotfiles need on Linux Mint / Ubuntu, then link them with stow.
# Safe to re-run: each step skips what is already installed.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_PREFIX=/home/linuxbrew/.linuxbrew
NVIM_DIR=/opt/nvim-linux-x86_64

APT_PACKAGES=(
    zsh kitty git curl wget unzip xz-utils fontconfig build-essential procps file
    stow perl
    zathura zathura-pdf-poppler xdotool
)
BREW_PACKAGES=(fzf zoxide yazi fd ripgrep tree-sitter-cli thefuck)

info() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m[ok]\033[0m %s\n' "$*"; }
skip() { printf '\033[1;33m[skip]\033[0m %s\n' "$*"; }
die()  { printf '\033[1;31m[error]\033[0m %s\n' "$*" >&2; exit 1; }

install_apt() {
    info "apt packages"
    sudo apt-get update
    sudo apt-get install -y "${APT_PACKAGES[@]}"
    ok "apt packages"
}

install_brew() {
    info "Homebrew and brew packages"
    if [[ -x "$BREW_PREFIX/bin/brew" ]]; then
        skip "Homebrew already installed"
    else
        NONINTERACTIVE=1 /bin/bash -c \
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$("$BREW_PREFIX/bin/brew" shellenv)"
    brew install "${BREW_PACKAGES[@]}"
    ok "brew packages"
}

install_neovim() {
    info "Neovim"
    if [[ -x "$NVIM_DIR/bin/nvim" ]]; then
        skip "Neovim already in $NVIM_DIR"
        return
    fi
    local tmp
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/nvim.tar.gz" \
        https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo tar -C /opt -xzf "$tmp/nvim.tar.gz"
    rm -rf "$tmp"
    ok "Neovim installed in $NVIM_DIR"
}

install_vim_plug() {
    info "vim-plug"
    local plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
    if [[ -f "$plug" ]]; then
        skip "vim-plug already installed"
        return
    fi
    curl -fLo "$plug" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ok "vim-plug"
}

install_fonts() {
    info "JetBrainsMono Nerd Font"
    # Not grep -q: with pipefail, an early grep exit can make fc-list fail on SIGPIPE
    if fc-list : family | grep -i "JetBrainsMono Nerd Font" >/dev/null; then
        skip "JetBrainsMono Nerd Font already installed"
        return
    fi
    local dest="$HOME/.local/share/fonts/JetBrainsMonoNerdFont" tmp
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/font.tar.xz" \
        https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
    mkdir -p "$dest"
    tar -C "$dest" -xJf "$tmp/font.tar.xz"
    rm -rf "$tmp"
    fc-cache -f
    ok "JetBrainsMono Nerd Font"
}

install_texlive() {
    info "TeX Live"
    if compgen -G "/usr/local/texlive/*/bin/x86_64-linux/latexmk" >/dev/null; then
        skip "TeX Live already installed in /usr/local/texlive"
        return
    fi
    echo "Installing the full TeX Live scheme: several GB of downloads, this can take an hour or more."
    local tmp
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/install-tl.tar.gz" \
        https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar -C "$tmp" -xzf "$tmp/install-tl.tar.gz" --strip-components=1
    (cd "$tmp" && sudo perl ./install-tl --no-interaction --scheme=full)
    rm -rf "$tmp"
    ok "TeX Live"
}

link_dotfiles() {
    info "Linking dotfiles with stow"
    mkdir -p "$HOME/.config"
    local out
    if ! out="$(cd "$DOTFILES_DIR" && stow --simulate --restow --target="$HOME" . 2>&1)"; then
        echo "$out" >&2
        die "stow found conflicts: move the files listed above out of the way and re-run."
    fi
    (cd "$DOTFILES_DIR" && stow --restow --target="$HOME" .)
    ok "dotfiles linked into $HOME"
}

install_nvim_plugins() {
    info "Neovim plugins"
    # On a first run init.lua errors on not-yet-installed plugins; PlugInstall still runs.
    "$NVIM_DIR/bin/nvim" --headless "+PlugInstall --sync" +qa || true
    ok "Neovim plugins"
}

set_shell() {
    info "Login shell"
    local zsh_path
    zsh_path="$(command -v zsh)"
    if [[ "$(getent passwd "$USER" | cut -d: -f7)" == "$zsh_path" ]]; then
        skip "zsh is already the login shell"
        return
    fi
    chsh -s "$zsh_path"
    ok "login shell set to zsh (log out and back in)"
}

main() {
    [[ $EUID -ne 0 ]] || die "run as your normal user, not root (sudo is used where needed)"
    install_apt
    install_brew
    install_neovim
    install_vim_plug
    install_fonts
    install_texlive
    link_dotfiles
    install_nvim_plugins
    set_shell

    info "Done. Remaining manual steps (see README):"
    cat <<'EOF'
  - Pick a kitty theme: kitty +kitten themes  (writes ~/.config/kitty/current-theme.conf)
  - Firefox: set browser.backspace_action = 0 in about:config
  - Log out and back in so zsh becomes your shell
EOF
}

main "$@"

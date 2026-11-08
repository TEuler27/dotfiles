# Dotfiles

Configuration for zsh, kitty, Neovim (LaTeX-oriented), and yazi, on Linux Mint 22 / Ubuntu 24.04.

## Quick start

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` installs all the software below, links the config files into `$HOME` with GNU stow,
installs the Neovim plugins and sets zsh as login shell.
It is safe to re-run: every step skips what is already installed.
Run it as your normal user; it asks for `sudo` when needed.

> The TeX Live step downloads a full TeX Live (several GB) and can take an hour or more.

## Software needed

### Shell

| Software | Why | Installed via |
|---|---|---|
| [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) | Login shell, configured in `.zshrc` | apt |
| [Homebrew](https://brew.sh) | Package manager for the newer CLI tools below; loaded in `.zshrc` | official script |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder, `fzf --zsh` keybindings (needs ≥ 0.48, apt is too old) | brew |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` (`z`), also fed by yazi | brew |
| [thefuck](https://github.com/nvbn/thefuck) | Optional `fuck` alias (skipped in `.zshrc` if missing) | brew |

### Terminal and files

| Software | Why | Installed via |
|---|---|---|
| [kitty](https://sw.kovidgoyal.net/kitty/binary/) | Terminal emulator, `.config/kitty` | apt |
| [yazi](https://yazi-rs.github.io) | Terminal file manager, `.config/yazi` (uses the zoxide plugin) | brew |
| [fd](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast file/text search for yazi and mini.pick | brew |
| [JetBrainsMono Nerd Font](https://www.nerdfonts.com) | Icons in Neovim (mini.icons, lualine) and yazi | nerd-fonts release → `~/.local/share/fonts` |
| [GNU stow](https://www.gnu.org/software/stow/) | Symlinks the config into `$HOME` | apt |

### Editor

| Software | Why | Installed via |
|---|---|---|
| [Neovim](https://neovim.io/doc/install) | Editor; expected in `/opt/nvim-linux-x86_64` (on `PATH` in `.zshrc`) | GitHub release tarball |
| [vim-plug](https://github.com/junegunn/vim-plug) | Plugin manager used in `init.lua` | curl |
| build-essential (gcc, make) | LuaSnip `make install_jsregexp`, compiling treesitter parsers | apt |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) | Required by nvim-treesitter (main branch) to build parsers | brew `tree-sitter-cli` |

Plugins are installed with `:PlugInstall` (the script does this headlessly).

### LaTeX

| Software | Why | Installed via |
|---|---|---|
| [TeX Live](https://tug.org/texlive/quickinstall.html) (full scheme) | LaTeX compiler and `latexmk`, used by vimtex | `install-tl` into `/usr/local/texlive/<year>` |
| [zathura](https://pwmt.org/projects/zathura/) + `zathura-pdf-poppler` | PDF viewer for vimtex (the poppler plugin is needed for PDFs) | apt |
| xdotool | Forward/reverse search between zathura and Neovim | apt |

`.zshrc` automatically puts the newest `/usr/local/texlive/<year>` on `PATH`, `MANPATH` and `INFOPATH`.

## How linking works

The repo mirrors `$HOME`: `.zshrc` goes to `~/.zshrc`, `.config/nvim` to `~/.config/nvim`,
`.claude/agents` to `~/.claude/agents`, and so on.
`install.sh` runs `stow --restow --target="$HOME" .` from the repo.
Files listed in `.stow-local-ignore` (README, `install.sh`, git files, `Claude.md`, `Claude outputs`, …) are not linked.
If a real file already exists where a link should go, the script stops and lists it: move it away and re-run.

## Manual configuration

### kitty theme

`kitty.conf` includes `current-theme.conf`, which is not tracked. Generate it with

```sh
kitty +kitten themes
```

### Firefox

To use backspace to go back to the previous page, set `browser.backspace_action` to `0` in `about:config`.

### Login shell

After the first run, log out and back in so zsh becomes your shell.

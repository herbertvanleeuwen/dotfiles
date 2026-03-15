# dotfiles

Personal macOS (Apple Silicon) dotfiles for Herbert van Leeuwen. Manages shell configuration, git settings, and tool dependencies via a single install script.

---

## What's included

| Area | Files | What it does |
|------|-------|--------------|
| **Shell** | `zsh/rc.zsh` → `~/.zshrc` | oh-my-zsh, spaceship prompt, pyenv, direnv, plugins |
| **Login shell** | `zsh/zprofile` → `~/.zprofile` | Homebrew env, pyenv PATH setup |
| **Aliases** | `zsh/aliases.zsh` | Shortcuts (venv, ssh, PyCharm) |
| **Prompt theme** | `zsh/spaceship.zsh` | Spaceship configuration (Python, virtualenv, gcloud) |
| **Git** | `git/.gitconfig` → `~/.gitconfig` | User identity, osxkeychain credential helper |
| **Packages** | `Brewfile` | zsh, git, direnv, pyenv, pyenv-virtualenv, iterm2 |
| **Environment** | `~/.env.sh` (generated) | Persists `$DOTFILES` path across sessions |

---

## Requirements

- macOS on Apple Silicon (M1/M2/M3)
- Internet connection (Homebrew and oh-my-zsh are downloaded during install)
- Xcode Command Line Tools — install with:
  ```sh
  xcode-select --install
  ```

---

## Fresh install

```sh
# 1. Clone the repo
git clone https://github.com/herbertvanleeuwen/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Run the installer
./install.sh
```

The installer will:
1. Create `~/.env.sh` exporting the `$DOTFILES` path
2. Install Homebrew (if not already present)
3. Run `brew bundle` to install all packages from `Brewfile`
4. Install oh-my-zsh (unattended, no shell switch)
5. Symlink `~/.zshrc` and `~/.zprofile` into the repo
6. Clone spaceship-prompt and link the theme into oh-my-zsh
7. Symlink `~/.gitconfig` into the repo
8. Change your default shell to zsh

Open a new terminal window after install — the spaceship prompt should load immediately.

---

## Re-running (idempotency)

All steps are safe to run multiple times:

- `~/.env.sh` already exists → logged as info, not an error
- Homebrew already installed → skipped
- oh-my-zsh already installed → skipped
- `spaceship-prompt` already cloned → skipped
- Symlinks use `ln -sf` (force overwrite)

```sh
./install.sh   # safe to run again
```

---

## File structure

```
dotfiles/
├── install.sh              # Main entry point
├── Brewfile                # Homebrew package list
├── bin/
│   ├── dotfiles_install    # Helper: cd into package dir and run install.sh
│   ├── env_file            # Creates ~/.env.sh
│   └── generic_shell_functions  # info / success / fail logging
├── git/
│   ├── install.sh          # Symlinks .gitconfig
│   └── .gitconfig          # Git identity + osxkeychain credential helper
└── zsh/
    ├── install.sh          # Installs oh-my-zsh, symlinks rc/profile, clones theme
    ├── rc.zsh              # Main zsh config (~/.zshrc)
    ├── zprofile            # Login shell config (~/.zprofile)
    ├── aliases.zsh         # Shell aliases
    ├── spaceship.zsh       # Spaceship prompt configuration
    └── themes/
        └── spaceship-prompt/   # Cloned during install
```

---

## Customisation

### Adding shell aliases

Edit `zsh/aliases.zsh`. Changes take effect in new shell sessions (or run `source ~/.zshrc`).

### Changing prompt sections

Edit `zsh/spaceship.zsh`. The file controls which sections are shown and their appearance (Python, virtualenv, gcloud, etc.).

### Adding Homebrew packages

Add entries to `Brewfile`, then run:

```sh
brew bundle
```

### Changing git identity

Edit `git/.gitconfig` directly — the file is symlinked so changes are live immediately.

### Private environment variables

Add exports to `~/.env.sh`. This file is sourced at the top of `.zshrc` and is never committed to the repo.

```sh
echo 'export MY_SECRET=foo' >> ~/.env.sh
```

---

## Installed tools

| Tool | Purpose |
|------|---------|
| `zsh` | Shell |
| `git` | Version control |
| `direnv` | Per-directory environment variables |
| `pyenv` | Python version management |
| `pyenv-virtualenv` | Virtualenv management via pyenv |
| `iterm2` | Terminal emulator |

---

## Troubleshooting

**`brew: command not found` after install**

Homebrew was just installed but the shell hasn't picked up the new PATH. Run:
```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
```
Then re-run `./install.sh`.

**Spaceship prompt doesn't appear**

Check that `~/.oh-my-zsh/themes/spaceship.zsh-theme` exists and is a valid symlink:
```sh
ls -la ~/.oh-my-zsh/themes/spaceship.zsh-theme
```
If not, re-run `./zsh/install.sh` from the dotfiles directory (with `$DOTFILES` exported).

**`pyenv: command not found`**

pyenv is installed via Homebrew but may not be on your PATH in the current session. Open a new terminal or run:
```sh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

**Git credential prompts on every push**

Verify the credential helper is set correctly:
```sh
git config --list | grep credential
# should show: credential.helper=osxkeychain
```

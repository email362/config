Here is the updated content for your document, including the Zsh setup instructions we discussed.

---

# Terminal Development Environment Setup

### **Summary**

A guide to the high-performance, cross-platform terminal environment configured for **macOS (Work)** and **Windows WSL (Home)**.

### **1. Core Components**

#### **Terminal Emulator: WezTerm**

* **Role**: Primary terminal emulator for GPU rendering, font rendering, clipboard integration, and launching WSL on Windows.
* **Guide**: See [wezterm/WEZTERM_GUIDE.md](wezterm/WEZTERM_GUIDE.md).
* **Config Location**: `$HOME/.wezterm.lua` (macOS/Linux) / `%USERPROFILE%\.wezterm.lua` (Windows).
* **Repo Config Source**: `config/wezterm/wezterm.lua`.
* **Windows Install Boundary**: Install WezTerm on the Windows host, not inside WSL. Use Windows PowerShell, the official installer, or the portable zip from Windows.
* **Windows Prerequisite**: Install JetBrainsMono Nerd Font in Windows so WezTerm can render Nerd Font icons.
* **Key Settings**:
  * **Font**: JetBrains Mono Nerd Font.
  * **Shell (Windows)**: Configured to launch WSL zsh through `wsl.exe`.
  * **Shell (macOS)**: Configured to launch `/bin/zsh`.


#### **Legacy Terminal Reference: Alacritty**

* **Role**: Previous terminal emulator kept as reference material.
* **Guide**: See `alacritty/ALACRITTY_GUIDE.md`.
* **Config Location**: `~/.config/alacritty/alacritty.toml` (macOS) / `%APPDATA%\alacritty\alacritty.toml` (Windows).
* **Repo Config Source**: `config/alacritty/alacritty.toml`.


#### **Multiplexer: tmux**

* **Role**: Manages panes, windows, and session persistence during the WezTerm migration.
* **Config Location**: `~/.tmux.conf`.
* **Key Changes**:
  * **Prefix**: Remapped to `Ctrl+a` (from `Ctrl+b`).
  * **Splits**: `|` (vertical) and `-` (horizontal).
  * **Performance**: `set -s escape-time 0` (removes Neovim input lag).


#### **Editor: Neovim / LazyVim**

* **Role**: Primary terminal editor running inside WSL or macOS shell sessions.
* **Config Location**: `~/.config/nvim`.
* **Starter**: `LazyVim/starter`.
* **Leader Key**: `Space`.
* **Enabled Extras**: TypeScript, JSON, Python, Prettier, ESLint.
* **Useful Commands**: `:Lazy`, `:Mason`, `:checkhealth`.
* **Guide**: See `neovim/NEOVIM_GUIDE.md`.



#### **SSH Configuration**

* **Config Location**: `~/.ssh/config`.
* **Setup**:
* Host alias set for `homelab` to avoid typing IPs.
* `IdentityFile` explicitly mapped to `~/.ssh/homelab`.


* **Shell Alias**: `alias hl='ssh homelab'` added to `.zshrc`/`.bashrc` for quick access.

### **2. Configuration Repository**

* **Repo**: `email362/config`
* **Description**: This repo is the hub of all configuration files (`wezterm.lua`, `.tmux.conf`, etc.) used to replicate this development environment across devices.

#### **WSL Git Credentials**

When using Git inside WSL2 with Git Credential Manager installed on Windows, point WSL Git at the Windows credential helper:

```bash
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```

This lets `git push` from WSL reuse the Windows GitHub authentication flow.

For SSH remotes, WSL's native `/usr/bin/ssh` does not see Windows OpenSSH keys by default. Use Windows `ssh.exe` from WSL so Git uses the same GitHub key already available on the Windows host:

```bash
git config --global core.sshCommand ssh.exe
```

This avoids creating or copying private keys into WSL.

Quick checks:

```bash
ssh.exe -T git@github.com
git config --global --get core.sshCommand
git ls-remote git@github.com:email362/smart-scribe-api.git HEAD
```

### **3. Implementation Status**

* **[COMPLETED]** WezTerm guide and config template added as the primary terminal migration path.
* **[COMPLETED]** Alacritty installation and configuration kept as legacy/reference material.
* **[COMPLETED]** Windows JetBrainsMono Nerd Font installation for terminal icon rendering.
* **[COMPLETED]** tmux installation and keybinding setup.
* **[COMPLETED]** LazyVim/Neovim setup inside WSL.
* **[COMPLETED]** SSH config and "homelab" key mapping.
* **[COMPLETED]** Zsh setup (installation and Starship prompt configuration).

### **4. Zsh & Starship Setup Instructions (Reference)**

**Step A: Install Zsh (WSL & Homelab)**
Since macOS already has Zsh, run this on your Windows/Linux machines:

```bash
sudo apt update && sudo apt install zsh -y
chsh -s $(which zsh)
# Log out and back in for changes to take effect

```

**Step B: Install Starship Prompt (All Platforms)**
This provides the cross-platform prompt that works on both macOS and WSL.

1. **Install Binary:**
```bash
curl -sS https://starship.rs/install.sh | sh

```


2. **Activate in Config:**
Add the following line to the bottom of your `~/.zshrc`:
```bash
eval "$(starship init zsh)"

```

**What Starship Gives You**

Starship makes the shell prompt context-aware. Without running extra commands, it can show useful development state such as:

* Current directory.
* Git branch.
* Git status, including modified, staged, and untracked files.
* Failed command status.
* Runtime versions for Node, Python, Rust, Go, and other project types.
* Active Python virtual environment.
* Docker or Kubernetes context when relevant.
* Duration for slow commands.
* SSH or remote-machine context.

The biggest day-to-day benefit is Git awareness: when you are inside a repo, the prompt shows the current branch and whether the working tree has changes.

**Optional Starship Config**

Starship works with defaults, but you can customize it with `~/.config/starship.toml`:

```bash
mkdir -p ~/.config
touch ~/.config/starship.toml
```

Example minimal config:

```toml
add_newline = true

[character]
success_symbol = "[>](bold green)"
error_symbol = "[>](bold red)"

[directory]
truncation_length = 3

[cmd_duration]
min_time = 1000
```



**Step C: Sync Aliases**
To ensure commands like `hl` (ssh homelab) work everywhere:

1. Create a shared file `~/.aliases` containing:
```bash
alias hl='ssh homelab'

```


2. Source it in your `~/.zshrc`:
```bash
[ -f ~/.aliases ] && source ~/.aliases

```

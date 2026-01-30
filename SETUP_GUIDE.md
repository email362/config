Here is the updated content for your document, including the Zsh setup instructions we discussed.

---

# Terminal Development Environment Setup

### **Summary**

A guide to the high-performance, cross-platform terminal environment configured for **macOS (Work)** and **Windows WSL (Home)**.

### **1. Core Components**

#### **Terminal Emulator: Alacritty**

* **Role**: Provides raw rendering speed via GPU acceleration.
* **Config Location**: `~/.config/alacritty/alacritty.toml` (macOS) / `%APPDATA%\alacritty\alacritty.toml` (Windows).
* **Key Settings**:
* **Font**: JetBrains Mono Nerd Font.
* **Shell (Windows)**: Configured to launch `wsl.exe` directly.
* **Shell (macOS)**: Configured to launch `/bin/zsh`.



#### **Multiplexer: tmux**

* **Role**: Manages tabs, splits, and session persistence since Alacritty is window-only.
* **Config Location**: `~/.tmux.conf`.
* **Key Changes**:
* **Prefix**: Remapped to `Ctrl+a` (from `Ctrl+b`).
* **Splits**: `|` (vertical) and `-` (horizontal).
* **Performance**: `set -s escape-time 0` (removes Neovim input lag).



#### **SSH Configuration**

* **Config Location**: `~/.ssh/config`.
* **Setup**:
* Host alias set for `homelab` to avoid typing IPs.
* `IdentityFile` explicitly mapped to `~/.ssh/homelab`.


* **Shell Alias**: `alias hl='ssh homelab'` added to `.zshrc`/`.bashrc` for quick access.

### **2. Configuration Repository**

* **Repo**: `email362/config`
* **Description**: This repo is the hub of all configuration files (`alacritty.toml`, `.tmux.conf`, etc.) used to replicate this development environment across devices.

### **3. Implementation Status**

* **[COMPLETED]** Alacritty installation and configuration.
* **[COMPLETED]** tmux installation and keybinding setup.
* **[COMPLETED]** SSH config and "homelab" key mapping.
* **[PENDING]** Zsh setup (installation and Starship prompt configuration).

### **4. Zsh & Starship Setup Instructions (Pending Steps)**

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
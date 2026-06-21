# WezTerm Migration Guide

WezTerm is the primary terminal emulator for this setup. It replaces Alacritty for the Windows and macOS terminal window, while **tmux remains the workspace, pane, window, and session layer** for the first migration.

Use WezTerm as the emulator only at first. Do not move sessions, panes, or workspace persistence into WezTerm until the WSL/zsh/tmux/Neovim workflow is stable.

## Install WezTerm On The Windows Host

When using Windows WSL, install WezTerm on **Windows**, not inside WSL. WSL provides the Linux shell and development tools. The Windows WezTerm application provides the terminal window, GPU rendering, clipboard integration, font rendering, and WSL process launch.

Run Windows package-manager commands from a Windows PowerShell session launched from the Start menu, not from a WSL shell.

### Preferred: winget

```powershell
winget install wez.wezterm
```

Later upgrades:

```powershell
winget upgrade wez.wezterm
```

### Manual Installer

Download the official Windows `setup.exe` release and run it from Windows. This installer requires admin privileges, installs into Program Files, and registers WezTerm in the Windows PATH.

### No-Admin Portable Zip

Download the official Windows `.zip` release, extract it somewhere under your Windows user profile, and run `wezterm.exe` from the extracted folder. This is the no-admin fallback and can also be used as a portable install.

### Optional Windows Package Managers

Scoop:

```powershell
scoop bucket add extras
scoop install wezterm
```

Chocolatey:

```powershell
choco install wezterm -y
```

## WSL Shell Setup Stays In WSL

Install and configure Linux shell tools inside WSL:

* `zsh`
* `tmux`
* Neovim/LazyVim
* `nvm`, Node, Python, ripgrep, fd, fzf, and other CLI tools

Do not install the Windows WezTerm application from WSL. The only WSL-side expectation for this migration is that `/usr/bin/zsh` exists and tmux is installed.

## Config Placement

| Platform | WezTerm config location |
| --- | --- |
| Windows | `%USERPROFILE%\.wezterm.lua` |
| macOS/Linux | `$HOME/.wezterm.lua` |
| Repo source | `config/wezterm/wezterm.lua` |

Copy the repo source config into the platform-specific config location. On Windows, do that from Windows File Explorer, PowerShell, or an editor running on the Windows host.

The repo config launches WSL zsh by default on Windows:

```lua
config.default_prog = { "wsl.exe", "--cd", "~", "--exec", "/usr/bin/zsh", "-l" }
```

If your WSL distro does not have zsh at `/usr/bin/zsh`, install zsh inside WSL or adjust the path before launching WezTerm.

## Migration From Alacritty

1. Install WezTerm on the Windows host.
2. Keep JetBrainsMono Nerd Font installed on Windows so terminal icons render correctly.
3. Copy `config/wezterm/wezterm.lua` to `%USERPROFILE%\.wezterm.lua`.
4. Launch WezTerm from Windows.
5. Confirm it opens WSL zsh.
6. Start or attach tmux with `tmux` or `tmux a`.
7. Use Neovim inside tmux as before.

The Alacritty config remains in this repo as legacy/reference material. Keep it until the WezTerm workflow has fully replaced it across machines.

## Daily Workflow

1. Launch WezTerm.
2. Attach to tmux with `tmux a`, or start a new session with `tmux`.
3. Use `Ctrl + a` as the tmux prefix for panes, windows, and session actions.
4. Open Neovim inside tmux.

WezTerm can manage tabs, panes, and multiplexed workspaces itself, but this migration intentionally avoids changing those layers. That keeps the shell/editor workflow the same while swapping only the terminal emulator.

## References

* Official WezTerm Windows install docs: <https://wezterm.org/install/windows.html>
* Official WezTerm config file docs: <https://wezterm.org/config/files.html>

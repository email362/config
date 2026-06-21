# config

Personal terminal development environment configs and setup notes for **macOS** and **Windows WSL**.

This repo is the hub for the terminal stack:

* **WezTerm** as the primary terminal emulator.
* **tmux** for panes, windows, and session persistence.
* **Neovim / LazyVim** as the terminal editor inside WSL or macOS shell sessions.
* **Zsh / Starship** setup notes for shell customization.
* **WSL Git Credential Manager** notes for HTTPS Git authentication from WSL.
* **Alacritty** as legacy/reference terminal material.

## Repo Layout

| Path | Purpose |
| --- | --- |
| `SETUP_GUIDE.md` | Full environment setup notes and current implementation status |
| [`wezterm/WEZTERM_GUIDE.md`](wezterm/WEZTERM_GUIDE.md) | WezTerm installation, migration, config placement, and WSL boundary notes |
| `wezterm/wezterm.lua` | WezTerm config template |
| `alacritty/ALACRITTY_GUIDE.md` | Legacy Alacritty usage, keybindings, Windows font setup, and workflow notes |
| `alacritty/alacritty.toml` | Legacy Alacritty config template |
| `tmux/TMUX_GUIDE.md` | tmux keybindings, panes, windows, and sessions |
| `tmux/.tmux.conf` | tmux config |
| `neovim/NEOVIM_GUIDE.md` | LazyVim/Neovim setup notes, tools, commands, and keymaps |

## Quick Setup Order

1. Install platform prerequisites for macOS or Windows WSL.
2. Install **WezTerm on the Windows host**, not inside WSL.
3. Install **JetBrainsMono Nerd Font** on Windows so WezTerm can render icons.
4. Place the WezTerm config at `%USERPROFILE%\.wezterm.lua` on Windows or `$HOME/.wezterm.lua` on macOS/Linux.
5. Place the tmux config at `~/.tmux.conf`.
6. Set up LazyVim/Neovim inside WSL or your macOS shell.
7. Configure WSL Git Credential Manager if using HTTPS Git remotes from WSL.
8. Keep the Alacritty docs/config as legacy reference material.

See [`SETUP_GUIDE.md`](SETUP_GUIDE.md) for the full setup flow and [`wezterm/WEZTERM_GUIDE.md`](wezterm/WEZTERM_GUIDE.md) for the Windows host installation boundary.

## Neovim Note

This repo documents the current LazyVim setup, but it does not vendor the full `~/.config/nvim` tree.

## License

MIT. See `LICENSE`.

# config

Personal terminal development environment configs and setup notes for **macOS** and **Windows WSL**.

This repo is the hub for the terminal stack:

* **Alacritty** as the terminal emulator.
* **tmux** for panes, windows, and session persistence.
* **Neovim / LazyVim** as the terminal editor inside WSL or macOS shell sessions.
* **Zsh / Starship** setup notes for shell customization.
* **WSL Git Credential Manager** notes for HTTPS Git authentication from WSL.

## Repo Layout

| Path | Purpose |
| --- | --- |
| `SETUP_GUIDE.md` | Full environment setup notes and current implementation status |
| `alacritty/ALACRITTY_GUIDE.md` | Alacritty usage, keybindings, Windows font setup, and workflow notes |
| `alacritty/alacritty.toml` | Alacritty config template |
| `tmux/TMUX_GUIDE.md` | tmux keybindings, panes, windows, and sessions |
| `tmux/.tmux.conf` | tmux config |
| `neovim/NEOVIM_GUIDE.md` | LazyVim/Neovim setup notes, tools, commands, and keymaps |

## Quick Setup Order

1. Install platform prerequisites for macOS or Windows WSL.
2. Install **JetBrainsMono Nerd Font** on Windows so Alacritty can render icons.
3. Place the Alacritty config in the platform-specific config location.
4. Place the tmux config at `~/.tmux.conf`.
5. Set up LazyVim/Neovim inside WSL or your macOS shell.
6. Configure WSL Git Credential Manager if using HTTPS Git remotes from WSL.

See `SETUP_GUIDE.md` for the full setup flow.

## Neovim Note

This repo documents the current LazyVim setup, but it does not vendor the full `~/.config/nvim` tree.

## License

MIT. See `LICENSE`.

# Neovim LazyVim Quick Start Guide

This setup runs **Neovim inside WSL**, launched from **Alacritty on Windows** and usually managed inside **tmux**.

## Configuration

* **Config Location:** `~/.config/nvim`
* **Starter:** `LazyVim/starter`
* **Leader Key:** `Space`

The Windows Alacritty app renders the terminal, but Neovim itself runs in WSL. Keep the Neovim config and Linux CLI tools inside WSL.

---

## Enabled LazyVim Extras

The current setup enables these LazyVim extras:

* **TypeScript**
* **JSON**
* **Python**
* **Prettier**
* **ESLint**

Open Neovim and run `:Lazy` to inspect plugin status or change enabled extras.

---

## Mason Tools

These tools are installed through Mason for language support, formatting, and linting:

```text
vtsls
typescript-language-server
pyright
prettier
eslint-lsp
json-lsp
css-lsp
html-lsp
lua-language-server
stylua
```

Use `:Mason` to verify installed tools and install missing ones.

---

## External WSL Tools

Install these outside Neovim in WSL:

```bash
nvm
node --version
npm --version
rg --version
fd --version
lazygit --version
fzf --version
tree-sitter --version
ruff --version
```

These support LazyVim search, Git UI, language tooling, and Python linting.

---

## Useful Commands

| Command | Purpose |
| --- | --- |
| `:Lazy` | Manage LazyVim plugins and updates |
| `:Mason` | Manage LSP servers, formatters, and linters |
| `:checkhealth` | Check Neovim, plugin, and provider health |

---

## Useful Keymaps

| Keymap | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>sg` | Search text with ripgrep |
| `<leader>gg` | Open LazyGit |
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Show hover documentation |

Since the leader key is `Space`, `<leader>ff` means `Space`, then `f`, then `f`.

---

## Health Notes

Run this after setup:

```bash
nvim
```

Then inside Neovim:

```vim
:checkhealth
```

Remaining `Snacks.image` health warnings are expected in Windows Terminal or Alacritty unless you use a terminal with an image protocol and install the extra image/PDF tooling. They do not block the normal LazyVim coding workflow.

# ⚡ Alacritty Quick Start Guide

Alacritty is a GPU-accelerated terminal emulator focused on high performance. It doesn't use menus; everything is handled via its configuration file and your shell.

## ⚙️ The Configuration File

Alacritty reloads **instantly** when you save this file.

* **macOS:** `~/.config/alacritty/alacritty.toml`
* **Windows (WSL):** `%APPDATA%\alacritty\alacritty.toml`

---

## 🔤 Windows Font Setup

Alacritty on Windows needs the Nerd Font installed in **Windows**, not WSL. WSL provides the shell and dev tools, but the Windows Alacritty app does the font rendering.

Preferred install:

```powershell
winget install DEVCOM.JetBrainsMonoNerdFont
```

Manual fallback:

1. Download **JetBrainsMono Nerd Font** from Nerd Fonts.
2. Extract the archive.
3. Select the `.ttf` files, right-click, and choose **Install for all users**.
4. Restart Alacritty.

Confirm `alacritty.toml` uses:

```toml
[font.normal]
family = "JetBrainsMono Nerd Font"
style = "Regular"
```

---

## ⌨️ Essential Keybindings

Since we are using **tmux**, these are the Alacritty-specific shortcuts you'll use most:

| Action | macOS Shortcut | Windows/WSL Shortcut |
| --- | --- | --- |
| **New Window** | `Cmd + N` | `Ctrl + Shift + N` |
| **Increase Font Size** | `Cmd + =` | `Ctrl + =` |
| **Decrease Font Size** | `Cmd + -` | `Ctrl + -` |
| **Reset Font Size** | `Cmd + 0` | `Ctrl + 0` |
| **Toggle Fullscreen** | `Cmd + Ctrl + F` | `F11` |
| **Search History** | `Cmd + F` | `Ctrl + Shift + F` |

---

## 🖱️ Selection & Copy/Paste

Alacritty follows the standard Unix "select to copy" behavior.

* **Copy:** Simply **highlight text** with your mouse (it is copied to the clipboard automatically in most setups).
* **Paste (macOS):** `Cmd + V`
* **Paste (Windows):** `Ctrl + Shift + V`
* **Block Select:** Hold **Shift** while dragging the mouse to select a rectangular block of text (useful for columns of data).
* **Open URL:** Hold **Cmd** (Mac) or **Ctrl** (Windows) and **click** any URL in the terminal to open it in your browser.

---

## 🛠️ Performance Tuning for Devs

If you notice any lag while working on large Atlassian repos or complex WSL builds, check these settings in your `.toml`:

1. **High Refresh Rate:** Alacritty matches your monitor's refresh rate by default. If you're on a 144Hz screen, it should feel butter-smooth.
2. **Opacity:** We set `opacity = 0.95`. If you find it distracting while coding in Neovim, set it to `1.0` for a solid background.
3. **Decorations:** If you want a completely borderless look on macOS, add `decorations = "None"` under the `[window]` section.

---

## 🔄 The "Workflow" Loop

Because you use both macOS and WSL, your daily loop should look like this:

1. **Launch Alacritty.**
2. **Type `tmux a`** (This resumes your work exactly where you left off, whether it was a build, a `git` status, or an open `nvim` file).
3. **Use `Ctrl + a`** (your tmux prefix) to move between your tasks.
4. **Open `nvim`** inside tmux when editing code in WSL.

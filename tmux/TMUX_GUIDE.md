# Tmux & WezTerm Quick Start Guide

This guide assumes you are using **WezTerm** with the **JetBrains Mono Nerd Font** and the custom **`.tmux.conf`** provided. Alacritty remains available in this repo as legacy/reference material.

## 📥 Installation & Config Placement

### Before You Start
Place the **`.tmux.conf`** file in the correct location for your platform:

| Platform | Config File Location |
| --- | --- |
| **Windows** | `%USERPROFILE%\.tmux.conf`<br>or `C:\Users\<username>\.tmux.conf` |
| **WSL** | `~/.tmux.conf` (in your home directory) |
| **macOS** | `~/.tmux.conf` (in your home directory) |

> **Note:** If you're on macOS with Homebrew, install tmux first:<br>`brew install tmux`

---

## ⌨️ The Prefix Key

In this configuration, the default "Prefix" has been changed to **`Ctrl + a`**.

> *Note: You must press the Prefix, release it, and then immediately press the next key.*

---

## 🪟 Pane Management (The Layout)

Panes are splits within a single window.

| Action | Command |
| --- | --- |
| **Split Vertically** | `Ctrl + a` then `\|` |
| **Split Horizontally** | `Ctrl + a` then `-` |
| **Switch Panes (Mouse)** | **Click** anywhere in a pane |
| **Switch Panes (Keyboard)** | `Alt + Arrow Keys` (No prefix needed!) |
| **Close Current Pane** | Type `exit` or press `Ctrl + d` |
| **Force Kill Pane** | `Ctrl + a` then `x` (Confirm with `y`) |

---

## 📑 Window Management (The Tabs)

Windows are like browser tabs at the bottom of your screen.

| Action | Command |
| --- | --- |
| **New Window (Tab)** | `Ctrl + a` then `c` |
| **Next Window** | `Ctrl + a` then `n` |
| **Previous Window** | `Ctrl + a` then `p` |
| **Go to specific Window** | `Ctrl + a` then `1`, `2`, `3...` |
| **Rename Window** | `Ctrl + a` then `,` |

---

## 💾 Session Management (The Persistence)

Sessions keep your work alive even if you close WezTerm or your SSH connection drops.

| Action | Command |
| --- | --- |
| **Start New Session** | `tmux` |
| **Detach (Leave running)** | `Ctrl + a` then `d` |
| **List Sessions** | `tmux ls` |
| **Re-attach to Session** | `tmux a` |
| **Reload Config** | `Ctrl + a` then `r` |

---

## 🖱️ Advanced Features

* **Mouse Support:** You can click to switch panes and **scroll** with your mouse wheel to see your terminal history.
* **Copy Mode:** If you want to copy text using the keyboard, press `Ctrl + a` then `[`. Use arrow keys to move and `q` to exit.
* **Smart Paths:** New panes and windows will automatically open in the **same directory** you were just working in.

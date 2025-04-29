# My Neovim Config

A simple Neovim setup powered by [💤 lazy.nvim](https://github.com/folke/lazy.nvim) to make it right out-of-the-box and customizable for your own appeal.

![nvim](https://github.com/user-attachments/assets/5b8089d7-c6f1-47c1-a012-05236412a8c5)

## 🚀 Features

- 🔌 Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 Theme support (default : tokyonight)
- 🧠 LSP with autocompletion via `nvim-cmp` and `mason.nvim`
- 🌳 File explorer with Git integration using `nvim-tree`
- 🧠 Fuzzy finder with `fzf-lua`
- ✨ Statusline with `lualine.nvim`
- 🎯 Keybinding helper via `which-key.nvim`
- 🌈 Syntax highlighting powered by `nvim-treesitter`
- 💬 Commenting with `Comment.nvim`
- 🖥️ Beautiful dashboard on startup (`dashboard-nvim`)

## 📦 Requirements

| Tool        | Version |
|-------------|---------|
| Neovim      | `>= 0.9` |
| Git         | `>= 2.0` |
| fzf (optional CLI) | `>= 0.28` |
| Node (optional for LSP/TS) | `>= 16` |

Install dependencies via :

```bash
# Ubuntu
sudo apt install ripgrep fd-find fzf git node
```

## 🚀 Getting Started

```sh
mv ~/.config/nvim ~/.config/nvim.bak #Backup of previous config
git clone https://github.com/ashwinpshinewrk/nvim ~/.config/nvim
nvim
```
## 📂 File Structure
> spec are the plugins that are or is to be installed

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── lazy.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>

# Dotfiles

Personal configuration files for my Fedora Linux setup, version-controlled so I can track changes, roll back when needed, and bootstrap a new machine quickly.

## Stack

| Category        | Application                  |
| --------------- | ---------------------------- |
| Terminal        | Ghostty                      |
| Shell           | Zsh                          |
| Prompt          | Pure                         |
| Window Manager  | Sway                         |
| Status Bar      | Waybar                       |

## Repository Structure

```
dotfiles/
├── README.md
├── ansible/
│   ├── playbook.yml                  # entry point
│   └── roles/
│       ├── packages/
│       │   └── tasks/
│       │       └── main.yml          # installs all dnf packages
│       ├── dotfiles/
│       │   └── tasks/
│       │       └── main.yml          # symlinks configs, clones Pure
│       └── shell/
│           └── tasks/
│               └── main.yml          # sets Zsh as default shell
├── ghostty/
│   └── config                        # terminal colours, font, opacity, keybinds
├── sway/
│   └── config                        # keybinds, gaps, borders, window rules, autostart
├── waybar/
│   ├── config.jsonc                  # modules: workspaces, clock, network, cpu,
│   │                                 #          memory, volume, battery, tray,
│   │                                 #          notifications, media
│   └── style.css                     # bar styling matched to design system
└── zsh/
    └── .zshrc                        # prompt, plugins, aliases, Wayland env vars
```

## Bootstrap (fresh Fedora machine)

Clone the repo and run the Ansible playbook — it handles everything else automatically.

```bash
sudo dnf install ansible git -y
git clone https://github.com/lukababetzki/dotfiles.git ~/dotfiles
ansible-playbook ~/dotfiles/ansible/playbook.yml --ask-become-pass
```

Once it finishes, log out and back in for the default shell change to take effect, then start Sway:

```bash
sway
```

## Manual Setup (existing machine)

If you'd rather apply configs without running the playbook:

```bash
# Sway
mkdir -p ~/.config/sway
ln -sf ~/dotfiles/sway/config ~/.config/sway/config

# Waybar
mkdir -p ~/.config/waybar
ln -sf ~/dotfiles/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/dotfiles/waybar/style.css    ~/.config/waybar/style.css

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

# Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# Reload Sway
swaymsg reload
```

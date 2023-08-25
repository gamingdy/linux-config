# linux-config

Welcome to you, this repository is used to automate the installation of my debian, by installing the windows manager, my tools and software, and all my configuration.

## Installation guide

Debian must be installed on your system without a graphical user interface

First we'll install sudo and git

1. Login as root
```bash
$ apt update
$ apt install -y sudo git
```

2. Add a user to the sudo group
```bash
$ usermod -aG sudo username
```

3. Log out and log in with your user account. Once log in
```bash
$ git clone https://github.com/gamingdy/linux-config.git
$ cd linux-config
$ bash install.sh
```

## Shortcuts

Here's a quick reminder of the different keyboard shortcuts available

| Shortcuts        | Action                                        |
|------------------|-----------------------------------------------|
| ctrl+alt+right   | go to next desktop                            |
| ctrl+alt+left    | go to previous desktop                        |
| shift+alt+left   | send active window to previous desktop        |
| shift+alt+right  | send active window to next desktop            |
| win+number       | go to number desktop (win+3, go to desktop 3) |
| win+shift+number | send active window to desktop                 |
| win+d            | show desktop/hide                             |
| win+e            | open file manager                             |
| win+semicolon    | open rofi emoji                               |
| win+space        | open rofi app choice                          |
| win+return       | open alacritty                                |
| win+l            | lock session                                  |
| print            | take screen shot                              |
| win+shift+x      | open powermenu                                |

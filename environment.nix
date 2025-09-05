
{ config, pkgs, ... }:

let 
  icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/sswastik02/dotfiles/refs/heads/main/fuzzel/power.png";
    sha256 = "sha256-DCUb8RthYMvWEKIKgSPPjlMOmZmHK7RpaA8/+sJqbRU=";
  };
  firefoxFileMangerDesktop = pkgs.makeDesktopItem {
    name = "firefox-filemanager";
    desktopName = "File Manager - Firefox";
    comment = "Open File/Folders in Firefox";
    exec = "${pkgs.firefox}/bin/firefox --new-window file://${config.users.users.sswastik02.home}";
    icon = "firefox";
    type = "Application";
  };
  shutdown = pkgs.makeDesktopItem {
    name = "poweroff";
    desktopName = "Poweroff";
    comment = "Poweroff";
    exec = "systemctl poweroff";
    icon = "${icon}";
    type = "Application";
  };
  reboot = pkgs.makeDesktopItem {
    name = "reboot";
    desktopName = "Reboot";
    comment = "Reboot";
    exec = "systemctl reboot";
    icon = "${icon}";
    type = "Application";
  };
  unstable = import <nixos-unstable> {};
in 
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    firefoxFileMangerDesktop
    shutdown
    reboot
    git
    zsh
    oh-my-zsh
    zsh-completions
    zsh-syntax-highlighting
    unstable.neovim
    tmux
    wl-clipboard
    ripgrep
    gnupg
    zip
    unzip
    gnutar
    usbutils
    file
    binutils
    xwayland
    python3
    bluez
    pinentry-curses
    pass
    dig
    bashmount
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    fira-code
    fira-code-symbols
  ];
}  


{ pkgs, ... }:
{
  programs = 
  let
    unstable = import <nixos-unstable> {};
  in
  {
    sway = {
      enable=true;
      extraPackages = with pkgs; [
        pamixer
        capitaine-cursors
        waybar
        brightnessctl
        foot
        grim
        slurp
        swayidle
        (
          unstable.sddm-astronaut.override {
            embeddedTheme = "pixel_sakura";
          } # need to place it here as well, as sddm is not able to find it other wise
        )
        swaylock-effects
        fuzzel
      ];
    };
    zsh ={
      enable=true;
      shellAliases={
        ns="nix-shell";
      };
      autosuggestions.enable=true;
      syntaxHighlighting.enable=true;
      interactiveShellInit=''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
        export VIRTUAL_ENV_DISABLE_PROMPT=1
      '';
      ohMyZsh = {
        enable=true;
        custom="$HOME/.config/.oh-my-zsh";
        theme = "agnosterzak";
      };
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [

      ];
    };
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
      enableSSHSupport = true;
    };
  };
  virtualisation.docker = {
    enable = true;
  };
}

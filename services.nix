let
  unstable = import <nixos-unstable> {};
in
{
  services = {
    pcscd.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
    displayManager = 
      {
      sddm = {
        theme = "sddm-astronaut-theme";
        package = unstable.kdePackages.sddm;
        enable = true;
        wayland = {
          enable = true;
        };
        extraPackages = [
          unstable.sddm-astronaut
           # If not specified errors out with "QtMultimedia is not installed"
        ];
      };
    };
  };
}

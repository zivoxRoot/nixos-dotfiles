{ pkgs, ... }:

{
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
        --time \
        --remember \
        --remember-session \
        --cmd Hyprland \
      '';
    };
  };

  services.openssh.enable = true;

  console.keyMap = "fr";

  programs.hyprland.enable = true;

  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General = {
      EnableNetworkConfiguration = true;
    };
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

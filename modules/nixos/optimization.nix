{ pkgs, ... }:

{
  # Use the Zen kernel:
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Automatically scale CPU frequency:
  services.auto-cpufreq.enable = true;

  # Intel CPU microcode updates:
  hardware.cpu.intel.updateMicrocode = true;

  # Use compressed RAM instead of disk swap:
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25; # 8 GB zram on a 32 GB system
  };

  # Tune kernel memory behavior:
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  # Enable regular SSD TRIM:
  services.fstrim.enable = true;

  # Put /tmp in RAM:
  boot.tmp.useTmpfs = true;

  # Faster boot by skipping unnecessary waits
  systemd.services.systemd-udev-settle.enable = false;

  # Parallelize early boot using systemd in initrd
  boot.initrd.systemd.enable = true;

  # Reduce kernel logging noise:
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "nowatchdog"
  ];

  # Use the modern Intel modesetting driver:
  services.xserver.videoDrivers = [ "modesetting" ];

  # Optimize Nix store automatically:
  nix.settings.auto-optimise-store = true;

  # Let Nix use all available cores
  nix.settings.max-jobs = "auto";
  nix.settings.cores = 0;

  # Hyprland optimization
  services.xserver = {
    displayManager.sessionCommands = ''
      # Reduce unnecessary cursor redraws
      export WLR_NO_HARDWARE_CURSORS=1
      # Enable adaptive vsync for smoother animation
      export WLR_DRM_NO_ATOMIC=1
    '';
  };

  # Automatic garbage collection:
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Disable unused services
  services.printing.enable = false;
  services.avahi.enable = false;
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.martin = {
    isNormalUser = true;
    description = "martin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  #xsession
  services.xserver.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.i3.enable = true;
 # services.xserver.windowManager.i3.configFile = "/home/martin/i3/config";

  services.picom.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #zsh
   #programs.zsh.enable = true;
   users.defaultUserShell = pkgs.zsh;
	programs = {
    	zsh = {
      		enable = true;
      	autosuggestions.enable = true;
      	syntaxHighlighting.enable = true;
      	ohMyZsh = {
        	enable = true;
        theme = "pygmalion";
       	 plugins = [
	  "git"
        ];
      };
    };
  }; 


 environment.systemPackages = with pkgs; [
 lightdm
 xorg.xinit
 xorg.libWindowsWM
 neovim
 git
 i3
 vifm
 zsh
 oh-my-zsh
 rofi-file-browser
 yadm
 fzf
 picom
# picom-jonaburg
 terminus-nerdfont
 atuin
 kitty
 sxiv
 dunst
 unzip
 pywal
 nitrogen
 font-awesome_5
 lxappearance 
 clipit
 wget
 brave
 polybar
 pcmanfm
 neofetch
 zoxide
]; 

#programs.pcmanfm.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
#  environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#  wget
#  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

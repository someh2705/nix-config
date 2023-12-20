{ ... }:

{
  imports = [
    ./programs
    ./shell
  ];

  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}

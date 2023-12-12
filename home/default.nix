{ ... }:

{
  imports = [
    ./programs
    ./shell
  ];

  home = {
    username = "someh";
    homeDirectory = "/home/someh";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}

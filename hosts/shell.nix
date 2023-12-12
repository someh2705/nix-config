{ pkgs, ... }:

{
  # home-manager cannot change the default shell.
  programs.fish.enable = true;
  programs.starship.enable = true;
  
  users.defaultUserShell = pkgs.fish;
}

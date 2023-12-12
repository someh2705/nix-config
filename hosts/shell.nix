{ pkgs, ... }:

{
  programs.fish.enable = true;
  programs.starship.enable = true;

  users.users.someh.shell = pkgs.fish;
}

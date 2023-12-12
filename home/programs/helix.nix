{ ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "github_light_high_contrast";
      editor = {
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}

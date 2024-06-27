{pkgs, ...}: {
  hm.programs.alacritty = {
    enable = true;
    settings = {
      env = {"TERM" = "xterm-256color";};

      import = [ pkgs.alacritty-theme.tokyo-night ];

      window = {
        opacity = 0.90;
        padding.x = 10;
        padding.y = 10;
        decorations = "None";
      };

      font = {
        size = 16;
        normal.family = "JetBrainsMono Nerd Font Mono";
        bold.family = "JetBrainsMono Nerd Font Mono";
        italic.family = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
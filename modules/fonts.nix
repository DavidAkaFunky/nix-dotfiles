{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      symbola
      font-awesome
      material-design-icons
      roboto
      jetbrains-mono
      fira-code
      fira
      _0xproto
      iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      noto-fonts-cjk-sans
    ];
  };

  #services.flatpak.enable = true;
}

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
      (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka"];})
      noto-fonts-cjk-sans
    ];
  };

  #services.flatpak.enable = true;
}

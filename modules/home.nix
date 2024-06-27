{ config, pkgs, options, lib, ... }:

with lib; {
    options.hm = mkOption {type = types.attrs;};
    
    config = {
        home-manager.users.funky = mkAliasDefinitions options.hm;

        # Home Manager needs a bit of information about you and the
        # paths it should manage.
        hm.home.username = "funky";
        hm.home.homeDirectory = "/home/funky";

        # This value determines the Home Manager release that your
        # configuration is compatible with. This helps avoid breakage
        # when a new Home Manager release introduces backwards
        # incompatible changes.
        #
        # You can update Home Manager without changing this value. See
        # the Home Manager release notes for a list of state version
        # changes in each release.
        hm.home.stateVersion = "24.05";

        # Let Home Manager install and manage itself.
        hm.programs.home-manager.enable = true;
    };
}
{...} :

{
  programs.zsh.enable = true;
  hm.programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    initContent = ''
      bindkey ';5D' emacs-backward-word
      bindkey ';5C' emacs-forward-word
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
    '';
  };
}
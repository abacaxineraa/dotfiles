
{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraConfig = builtins.readFile ./config.org;
    extraConfigTangle = true;
    extraEmacsPackages =
      epkgs: with epkgs; [
        htmlize
        corfu-terminal
        nix-mode
        exotica-theme
        ef-themes
        aggressive-indent
        corfu
        orderless
        marginalia
        all-the-icons
        all-the-icons-completion
        all-the-icons-dired
        vertico
        which-key
        org-appear
        org-superstar
        lsp-mode
        flycheck
        treemacs
        treesit-grammars.with-all-grammars
        projectile
      ];
    extraPathPackages = with pkgs; [
      nixfmt-rfc-style
      texlive.combined.scheme-full
      wl-clipboard
      nixd
      python3 # For treemacs
    ];
  };

  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
  ];
}

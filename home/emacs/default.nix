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
        ef-themes
        catppuccin-theme

        flycheck
        which-key
        nix-mode
        aggressive-indent
        highlight-indent-guides

        corfu
        corfu-terminal
        orderless
        marginalia
        vertico

        all-the-icons
        all-the-icons-dired
        all-the-icons-completion

        treemacs
        treesit-grammars.with-all-grammars

        org-download
        org-fragtog
        org-appear
        org-superstar
        htmlize
        auctex
        cdlatex

        eglot
        flycheck-eglot

        pdf-tools
        org-noter
        org-pdftools
        org-noter-pdftools
        
        telephone-line
        avy
        jinx
      ];

    extraPathPackages = with pkgs; [
      nixfmt-rfc-style
      texlive.combined.scheme-full
      wl-clipboard
      nix
      # rnix-lsp
      python3 # For treemacs
    ];
  };

  home.packages = with pkgs; [ emacs-all-the-icons-fonts ];
}

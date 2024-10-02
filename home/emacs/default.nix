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
        modus-themes
        org-modern
        perfect-margin
        valign
        doom-modeline

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

        treemacs
        treesit-grammars.with-all-grammars
        treemacs-nerd-icons
        nerd-icons-ibuffer
        nerd-icons-dired
        nerd-icons-completion
        nerd-icons
        
        org-download
        org-fragtog
        org-appear
        org-superstar
        htmlize
        auctex
        cdlatex

        eglot
        flycheck-eglot
        jinx
        magit

        pdf-tools
        org-noter
        org-pdftools
        org-noter-pdftools
        
        org-anki
        anki-connect
        anki-editor
        anki-mode
        anki-vocabulary # TODO: try this out!!
      ];

    extraPathPackages = with pkgs; [
      nixfmt-rfc-style
      wl-clipboard
      nix
      nil
      python3 # For treemacs

      (texlive.combine {
        inherit (texlive)
          scheme-full
          ieeetran
          algorithm2e;
      })
    ];
  };

  home.packages = with pkgs; [ inconsolata-nerdfont ];
}

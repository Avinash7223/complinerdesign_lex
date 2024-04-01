{ pkgs }: {
  deps = [
    pkgs.flex_2_5_35
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
    pkgs.flex
  ];
}
{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      udev-gothic-nf
      udev-gothic
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Noto Sans CJK JP"
        ];
        serif = [
          "Noto Serif JP"
        ];
      };

      subpixel = {
        lcdfilter = "light";
      };
    };
  };
}

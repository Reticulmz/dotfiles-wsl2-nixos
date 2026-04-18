{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wslu
  ];

  environment.variables.BROWSER = "wslview";
  environment.sessionVariables.LD_LIBRARY_PATH = "/usr/lib/wsl/lib:/run/current-system/sw/share/nix-ld/lib";
  wsl.enable = true;
  wsl.defaultUser = "reticulmz";
  wsl.wslConf.interop.enabled = true;
  wsl.wslConf.interop.appendWindowsPath = false;
  wsl.useWindowsDriver = true;
  wsl.interop.register = true;
  wsl.interop.includePath = false;
}

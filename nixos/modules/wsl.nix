{ ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "reticulmz";
  wsl.wslConf.interop.enabled = true;
  wsl.wslConf.interop.appendWindowsPath = false;
  wsl.interop.register = true;
  wsl.interop.includePath = false;
}

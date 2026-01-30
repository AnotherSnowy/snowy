[
  {
    role = "laptop";
    style = "light"; # light ? dark
    username = "muxue";
    hostname = "snowy";
    extraHomeArgs = {};
    extraNixOSArgs = {};
    system = "x86_64-linux";
    extraHomeModules = [./snowy/home.nix];
    extraNixOSModules = [./snowy/nixos.nix];
    userHashPasswd = "$6$WIKRqq0Yhh3BtyQZ$GbH0N5HaSEx9ZXyMpAmBzpHsrkLHOs6buCJ1DmAJg6.MR0JxmIJkYUacW63FCJsuVcNdNEmsoXP3j9DWXmYPn/";
  }
]

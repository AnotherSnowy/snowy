{role, ...}: {
  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation =
        if (role != "server")
        then true
        else false;
    };
    openFirewall = true;
    nssmdns4 = true;
  };
}

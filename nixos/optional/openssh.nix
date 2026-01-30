{username, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    ports = [22];
    openFirewall = true;
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOA540eh889hZCmRDnfdMZ6yuq/AlFz0c5BacHhTgxNn"
  ];
}

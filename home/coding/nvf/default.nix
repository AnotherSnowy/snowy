# NVF is a Neovim configuration that provides a minimal setup with essential plugins and configurations.
{pkgs, ...}: {
  imports = [
    ./mini.nix
    ./utils.nix
    ./snacks.nix
    ./picker.nix
    ./options.nix
    ./keymaps.nix
    ./languages.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      startPlugins = [pkgs.vimPlugins.vim-kitty-navigator];
    };
  };
}

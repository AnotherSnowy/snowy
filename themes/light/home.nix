{
  programs.noctalia-shell = {
    colors = {
      mError = "#cf222e";
      mHover = "#eaeef2";
      mOnError = "#ffffff";
      mOnHover = "#1f2328";
      mOnPrimary = "#ffffff";
      mOnSecondary = "#ffffff";
      mOnSurface = "#1f2328";
      mOnSurfaceVariant = "#656d76";
      mOnTertiary = "#ffffff";
      mOutline = "#d0d7de";
      mPrimary = "#0969da";
      mSecondary = "#1a7f37";
      mShadow = "#ffffff";
      mSurface = "#ffffff";
      mSurfaceVariant = "#f6f8fa";
      mTertiary = "#8250df";
    };
    settings = {
      colorSchemes.darkMode = false;
      wallpaper.directory = ./wallpapers;
    };
  };
  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "github";
    style = "light";
    transparent = true;
  };
}

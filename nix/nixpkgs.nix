with {
  rev = "a18112a7e8fb6207ef36f667fa4fb4d39fa7584a";

  config = {
    packageOverrides = super: let self = super.pkgs; in {
    };
  };

  overlays = [];
};

import (builtins.fetchTarball {
  url    = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  # recalculate this hash using `nix-prefetch-url --unpack URL`
  sha256 = "1arfc4y08i66prazqwpc44hj3nhn8gj6553lm1by2gdl8bb731fp";
}) { inherit config overlays; }

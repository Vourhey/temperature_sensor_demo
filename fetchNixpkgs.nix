{ rev    ? "b365b36bbca7a542a29b6862c0a2d8db9846764f"             # The Git revision of nixpkgs to fetch
, sha256 ? "0yfff0qxp2cfbncrfcbcifli4bsj2pzv482kn08m50p1ypp1ivik" # The SHA256 of the downloaded data
}:

builtins.fetchTarball {
  url = "https://github.com/airalab/airapkgs/archive/${rev}.tar.gz";
  inherit sha256;
}

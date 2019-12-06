{ rev    ? "30e950867bb08e3d1ee88bfa911eef0131262e30"             # The Git revision of nixpkgs to fetch
, sha256 ? "0mj34j22ziafr17c6js97qqy6vh7vqxf9917dwjcq6zi8qm5qzcx" # The SHA256 of the downloaded data
}:

builtins.fetchTarball {
  url = "https://github.com/airalab/airapkgs/archive/${rev}.tar.gz";
  inherit sha256;
}

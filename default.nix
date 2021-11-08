let
  pkgs = import <nixpkgs> { };
  hi = (pkgs.hello.overrideAttrs (_: {
    a = "7";
    preBuild = "sleep infinity";
  }));
  jobs = {
    job = pkgs.releaseTools.aggregate {
      name = "hello";
      constituents = [
        hi
      ];
    };
  };
in
jobs

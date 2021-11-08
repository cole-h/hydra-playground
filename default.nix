let
  pkgs = import <nixpkgs> { };
  hi = (pkgs.hello.overrideAttrs (_: {
    a = "7";
    # postFixup = "false";
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

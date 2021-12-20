let
  pkgs = import <nixpkgs> { };
  hi = (pkgs.hello.overrideAttrs (_: {
    b = "3";
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

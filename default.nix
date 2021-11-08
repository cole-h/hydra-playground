let
  pkgs = import <nixpkgs> { };
  hi = (pkgs.hello.overrideAttrs (_: {
    a = "11";
    preBuild = "sleep infinity";
  }));
  hi2 = (pkgs.hello.overrideAttrs (_: {
    a = "10";
  }));
  jobs = {
    job = pkgs.releaseTools.aggregate {
      name = "hello";
      constituents = [
        hi
        pkgs.hello
      ];
    };
    job2 = pkgs.releaseTools.aggregate {
      name = "hello2";
      constituents = [
        pkgs.hello
      ];
    };
  };
in
jobs

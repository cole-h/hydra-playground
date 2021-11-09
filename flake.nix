{
  description = "test";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { ... }@inputs: {
    hydraJobs =
      let
        pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
        hi = (pkgs.hello.overrideAttrs (_: {
          a = "15";
          preBuild = "sleep infinity";
        }));
        hi2 = (pkgs.hello.overrideAttrs (_: {
          a = "16";
        }));
        jobs.x86_64-linux = {
          job = pkgs.releaseTools.aggregate {
            name = "hello";
            constituents = [
              hi
            ];
          };
          job2 = pkgs.releaseTools.aggregate {
            name = "hello2";
            constituents = [
              hi2
            ];
          };
        };
      in
      jobs;
  };
}

{ pkgs, ... }:

{

  home.packages =
    let python = pkgs.python3.withPackages (ps: with ps; 
    [ jupyter
      # ipython
      numpy
      matplotlib
      # scikitimage
      scipy 
      pandas
      networkx
    ]); in
    [
      python
    ];

}

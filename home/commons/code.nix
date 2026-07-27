{ pkgs, ... }:

{

  home.packages =
    let mycoq = pkgs.coq.withPackages (ps: with ps; [ equations stdlib metarocq
    ]); in
      with pkgs; 
    [
      mycoq
      mycoq.ocamlPackages.findlib 
    ];

  
}

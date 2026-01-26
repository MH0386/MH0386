{ pkgs, lib, ... }:
{
  scripts.typst-build.exec = "${lib.getExe pkgs.typst} compile resume.typst docs/resume.pdf";

  languages.typst = {
    enable = true;
    lsp.enable = true;
  };

  git-hooks.hooks = {
    typstyle.enable = true;
  };

  treefmt.config.programs = {
    typstfmt.enable = true;
    typstyle.enable = true;
  };
}

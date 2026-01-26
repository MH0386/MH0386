{
  pkgs,
  lib,
  config,
  ...
}:
{
  env = {
    DOCS_DIR = "docs/";
  };

  scripts.typst-build.exec = ''
    mkdir -p ${config.env.DOCS_DIR}
    ${lib.getExe pkgs.typst} compile resume.typst ${config.env.DOCS_DIR}/resume.pdf
  '';

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

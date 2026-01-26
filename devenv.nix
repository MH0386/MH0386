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

  files = {
    ".yamllint.yaml".yaml = {
      extends = "default";
      rules = {
        document-start = "disable";
        truthy = "disable";
        comments = "disable";
        line-length.max = 130;
      };
    };
    ".yamlfmt.yaml".yaml = {
      line_ending = "lf";
      formatter = {
        type = "basic";
        line_ending = "lf";
        trim_trailing_whitespace = true;
        eof_newline = true;
        force_array_style = "block";
        force_quote_style = "double";
        scan_folded_as_literal = true;
      };
    };
  };

  git-hooks.hooks = {
    typstyle.enable = true;
  };

  treefmt.config.programs = {
    typstfmt.enable = true;
    typstyle.enable = true;
  };
}

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
    action-validator.enable = true;
    actionlint.enable = true;
    nixfmt.enable = true;
    check-added-large-files.enable = true;
    check-builtin-literals.enable = true;
    check-case-conflicts.enable = true;
    check-docstring-first.enable = true;
    check-json.enable = true;
    check-merge-conflicts.enable = true;
    check-python.enable = true;
    check-toml.enable = true;
    check-vcs-permalinks.enable = true;
    check-xml.enable = true;
    check-yaml.enable = true;
    comrak.enable = true;
    deadnix.enable = true;
    detect-private-keys.enable = true;
    # lychee.enable = true;
    markdownlint.enable = true;
    mixed-line-endings.enable = true;
    name-tests-test.enable = true;
    prettier.enable = true;
    ripsecrets.enable = true;
    statix.enable = true;
    taplo.enable = true;
    trim-trailing-whitespace.enable = true;
    trufflehog.enable = true;
    yamllint.enable = true;
    yamlfmt.enable = true;
    python-debug-statements.enable = true;
    hadolint.enable = true;
  };

  treefmt = {
    enable = true;
    config.programs = {
      # typstfmt.enable = true;
      typstyle.enable = true;
      actionlint.enable = true;
      jsonfmt.enable = true;
      nixf-diagnose.enable = true;
      nixfmt.enable = true;
      statix.enable = true;
      taplo.enable = true;
      xmllint.enable = true;
      yamlfmt.enable = true;
    };
  };
}

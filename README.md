# Claude Code LSP (Language Server Protocol) Plugin for Perl

A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) plugin
that provides Perl language support via
[PerlNavigator](https://github.com/bscan/PerlNavigator).

## Prerequisites

PerlNavigator must be installed:

```bash
npm install -g perlnavigator-server
```

## Installation

```bash
claude plugin add yuji-hatakeyama/claude-code-perlnavigator
```

## Supported Extensions

| Extension | Language |
|-----------|----------|
| `.pl`     | Perl     |
| `.pm`     | Perl     |
| `.t`      | Perl     |
| `.cgi`    | Perl     |
| `.psgi`   | Perl     |

## Customizing initializationOptions

If you need project-specific settings (e.g., `perlPath`, `includePaths`),
fork this repository and edit the `initializationOptions` in `.lsp.json`.

See the
[PerlNavigator README](https://github.com/bscan/PerlNavigator#configuration)
for available configuration options.

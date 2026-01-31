#!/usr/bin/env bash
set -euo pipefail

RED=$'\033[0;31m'
YELLOW=$'\033[0;33m'
CYAN=$'\033[0;36m'
BOLD=$'\033[1m'
DIM=$'\033[2m'
RESET=$'\033[0m'
LINE="${DIM}$(printf '%.0s─' {1..60})${RESET}"

output_msg() {
  if [ -e /dev/tty ]; then
    cat > /dev/tty
  else
    # TODO: /dev/tty is unavailable on Windows etc.
    #       Need to investigate the best fallback
    cat > /dev/null
  fi
}

# 1. If not installed, show installation instructions
if ! command -v perlnavigator >/dev/null 2>&1; then
  output_msg <<EOF

${LINE}
${RED}${BOLD}[perlnavigator plugin] perlnavigator command not found${RESET}
${LINE}

PerlNavigator LSP server is required for Perl language support.

Install:
  ${CYAN}npm install -g perlnavigator-server${RESET}

Verify:
  ${CYAN}perlnavigator --version${RESET}

${LINE}

EOF
  exit 0
fi

# 2. If outdated, show update instructions
if ! npm outdated -g perlnavigator-server >/dev/null 2>&1; then
  output_msg <<EOF

${LINE}
${YELLOW}${BOLD}[perlnavigator plugin] update available${RESET}
${LINE}

  ${CYAN}npm update -g perlnavigator-server${RESET}

${LINE}

EOF
fi
exit 0

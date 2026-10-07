# Codex CLI と Codex.app のコマンド実行では .zshrc の mise activate zsh が効かないため、
# mise shims を PATH に追加する。
if [ -n "$CODEX_SANDBOX" ]; then
  PATH=${XDG_DATA_HOME}/mise/shims:$PATH
fi

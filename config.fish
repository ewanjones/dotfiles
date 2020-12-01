test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Fish keeps prepending the following paths if you don't clear it here
set -Ux fish_user_paths

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

alias t="run-kraken-test"
set --export OCTODEV_REPO_PATH ~/Sites/octodev

describe() {
  echo "--- $1…"
}

squelch() {
  $@ > /dev/null 2>&1
}

elixir_install_hex_and_rebar() {
  describe "Install hex and rebar"
  mix local.hex --force
  mix local.rebar --force
}

asdf_bootstrap() {
  [ ! -d "$HOMEBREW_CELLAR/asdf" ] || {
    brew uninstall asdf
    describe "Uninstall asdf from homebrew"
  }
  [ -d "$HOME/.asdf" ] || {
    describe "Install asdf via git"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    . $HOME/.asdf/asdf.sh
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bash_profile
    asdf update
  }
}

asdf_add_plugins() {
  if [ -f .tool-versions ]; then
    describe "Add asdf language plugins"
    asdf plugin add nodejs || true
    asdf plugin add erlang || true
    asdf plugin add elixir || true
  fi
}

asdf_install_tools() {
  if [ -f .tool-versions ]; then
    describe ":elixir: :erlang: :nodejs: Install language versions"
    asdf install
  fi
}

asdf_update_plugins() {
  if [ -f .tool-versions ]; then
    describe "Update asdf language plugins"
    asdf plugin-update --all
  fi
}

coveralls_report_coverage() {
  describe ":star: report code coverage"
  local repo_token=$1
  local author_name=$(git log -1 --pretty=format:'%ae')
  local sha=$(git rev-parse HEAD)
  local message=$(git log -1 --pretty=%B)
  local branch=$(git rev-parse --abbrev-ref HEAD)
  mix coveralls.post \
    --token "$repo_token" \
    --branch "$branch" \
    --committer "$author_name" \
    --message "$message" \
    --sha "$sha"
}
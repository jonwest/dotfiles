# ╔═════════════════════╗
# ║     DEVELOPMENT     ║
# ╚═════════════════════╝

# ZSH completion for Kubernetes
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh);
fi

# Add composer packages to path
if command -v composer >/dev/null 2>&1; then 
  export PATH="${HOME}/.composer/vendor/bin:${PATH}";
fi

# GPT4 API
[[ -f "${HOME}/.secrets/shellgpt.key" ]] && export OPENAI_API_KEY=$(cat "${HOME}/.secrets/shellgpt.key");

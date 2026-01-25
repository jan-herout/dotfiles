# Ralph Container Usage

This image provides an isolated environment for running GitHub Copilot CLI and Ralph scripts with a mapped working directory.

## Build

```bash
# Docker
docker build -t ralph:latest .

# Podman
podman build -t ralph:latest .
```

## Run (interactive bash)

```bash
# Docker
mkdir -p /home/$(whoami)/ralph

docker run -it --name ralph \
  -v /home/$(whoami)/ralph:/home/ralph \
  --workdir /home/ralph \
  -e HOME=/home/ralph \
  ralph:latest

# Podman
mkdir -p /home/$(whoami)/ralph

podman run -it --name ralph \
  -v /home/$(whoami)/ralph:/home/ralph:Z \
  --workdir /home/ralph \
  -e HOME=/home/ralph \
  --replace \
  ralph:latest
```

- Entrypoint is `bash`; you will drop into an interactive shell.
- Container runs as non-root user `ralph`.

## Inside the container

Install/authenticate Copilot CLI only at runtime (no login during build):

```bash
# Authenticate Copilot CLI
copilot -i auth
# In the interactive UI enter /login and follow instructions in your host browser.
# Credentials persist under the mapped HOME: /home/ralph/.config/github-copilot-cli/hosts.json
```

Optionally copy Ralph project scaffolding from host into the mapped directory:

```bash
# On host (example)
cp -r ~/dotfiles/ralph/*.* ~/ralph/<projekt>
```

Run Ralph inside the container (adjust prompt/path as needed):

```bash
./ralph.sh --prompt prompts/default.txt --allow-profile dev 20
```

## Notes

- Timezone defaults to `Europe/Prague`. Change `TZ` in Dockerfile if needed.
- Installed tools: nodejs, npm, Copilot CLI, curl, gpg, git, gosu, vim, uv.
- No authentication is performed at build time; do it interactively inside the container.

# opencode

Opencode (https://opencode.ai) configuration managed by Stow.

## What is where

| File | Repo | Why |
|---|---|---|
| `.config/opencode/cli.json` | this repo (public) | theme + TUI preferences only, nothing sensitive |
| `.config/opencode/opencode.jsonc` | `dotfiles-private` | provider endpoints (LAN IPs / tailnet hosts) |
| `.config/opencode/service.json` | `dotfiles-private` | contains a password |
| `.local/share/opencode/auth.json` | `dotfiles-private` | provider API keys |
| `~/dev/home/opencode/skills` | Syncthing (`~/dev`) | global agent skills |
| `~/dev/home/opencode/AGENTS.md` | Syncthing (`~/dev`) | global ambient instructions |

The private `opencode.jsonc` imports the skills and AGENTS.md from the
Syncthing-synced `~/dev/home/opencode` via its `skills` and `instructions`
fields — see `~/dev/home/opencode/README.md` for that side.

Intentionally **not** tracked (regenerated at runtime): the opencode binary
and `node_modules` under `~/.opencode` and `~/.config/opencode`,
`opencode.db`, logs, snapshots, prompt history, model catalog cache, and
per-project `.opencode/` dirs (those live in `~/dev`).

## Restore on a new machine

```sh
# 1. opencode itself
curl -fsSL https://opencode.ai/install | bash    # installs ~/.opencode/bin

# 2. dotfiles (public)
git clone <public-dotfiles-url> ~/dotfiles
stow -d ~/dotfiles opencode

# 3. dotfiles (private, same steps)
git clone <private-dotfiles-url> ~/dotfiles-private
stow -d ~/dotfiles-private opencode

# 4. make sure opencode's data dirs exist before stowing, so stow links
#    the individual files into them instead of replacing the dirs
mkdir -p ~/.config/opencode ~/.local/share/opencode

# 5. restore ~/dev (Syncthing) for skills + AGENTS.md, then
chmod 600 ~/.config/opencode/service.json ~/.local/share/opencode/auth.json
```

Ordering note: if `~/.config/opencode` does not exist yet when you stow,
stow symlinks the *whole directory* into the repo — run opencode once (or
`mkdir -p`) first so it links just the files.

Config reload quirk: the background service watches the global config
*directory*, so in-place edits (e.g. through a stow symlink) are not
hot-reloaded. After editing `opencode.jsonc` either rename it
(`mv x x.tmp && mv x.tmp x`) or run `opencode service restart`. New
sessions pick up config either way.
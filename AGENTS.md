# Agents

This document describes the AI agents configured for this dotfiles repository.

## Important: Use Stow for Symlinks

This dotfiles repository uses GNU Stow to manage symlinks to `~/.config`. **Never edit files directly in `~/.config`**. Always make changes here in the dotfiles directory, then run:

```bash
stow <directory>
```

For example, to update fastfetch configuration:
1. Edit files in `/home/asus/dotfiles/fastfetch/.config/fastfetch/`
2. Run: `stow fastfetch`

This ensures `~/.config/fastfetch/` stays synchronized with your dotfiles.
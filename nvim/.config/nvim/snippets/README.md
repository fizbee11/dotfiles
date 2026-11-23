# Personal snippets

VSCode-format snippet collection loaded by [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
(wired up in `lua/plugins/nvim-cmp.lua`).

## Layout

- `package.json` — manifest telling LuaSnip which snippet file belongs to
  which language. Add an entry for every new snippet file.
- `*.json` — one snippet file per group (the filename doesn't matter, the
  language comes from `package.json`).

To add snippets for a new language, create `lua.json` (or similar) and add:

```json
{ "language": ["lua"], "path": "./lua.json" }
```

to `contributes.snippets` in `package.json`. Use `"language": ["all"]` for
snippets that should be available everywhere.

## Writing a snippet

```json
{
  "My snippet": {
    "prefix": "trig",
    "body": ["first line $1", "second line $2"],
    "description": "shown in the completion menu"
  }
}
```

- `prefix` — the trigger word (string, or an array of triggers).
- `body` — string, or array of lines. `$1`, `$2`, … are tab stops, `$0` is
  the final one.
- `scope` (optional) — restricts a snippet to specific filetypes, e.g.
  `"scope": "python,python3"`. Without it, the language from
  `package.json` applies.
- `luasnip` (optional) — LuaSnip-specific options:
  `"luasnip": { "priority": 100, "wordTrig": true, "autotrigger": true }`.

## Reloading

Saving a changed snippet file in this Neovim instance reloads it
automatically (`BufWritePost`). In other instances, call
`:lua require("luasnip.loaders").reload_file("<path-to-json-file>")`
or restart Neovim.
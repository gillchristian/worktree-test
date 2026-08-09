# worktree-test

A throwaway repository for exercising `wtx` (see `~/.zsh/wtx/`). It is shaped to
have every feature the tool cares about:

| Thing | Where | Exercises |
|---|---|---|
| trunk is `master` | this repo | trunk is per-repo, not hardcoded |
| trunk is `main` | `notes/` | a companion repo whose trunk differs from its parent's |
| a nested repo | `notes/` | `nested=(notes:mirror:fold)` — its own worktree per branch |
| ignored build state | `node_modules/`, `dist/` | seeding by APFS clone |
| local-only config | `.envrc`, `local.config.json` | seeding by symlink, and `.git/info/exclude` |
| throwaway state | `tmp/`, `*.log` | seeding skipped |
| a dev server | `npm run dev` on :4311 | the port scan attributing by cwd |
| migrations | `db/migrations/` | a profile probe |
| an append-heavy index | `docs/index.md` | the false-conflict case |

# wt profile for worktree-test — see `wtx help profile`. Everything is optional.
# Started by `wtx init`, then edited by hand where the guesses were only guesses.

name=wtest
trunk=master
remote=origin
home=$HOME/dev/worktree-test-wt

# How a branch name becomes a directory name. Branches here are
# <type>/<TICKET>/<desc> with the ticket lowercased, but the directory should
# read like the ticket does everywhere else.
ticket='[A-Za-z]+-[0-9]+'
ticket_case=upper
label_format='%n'          # %n worktree, %p repo — what the prompt marker shows

# Seeding. Ignored paths not named here follow seed_default.
seed_default=clone
link=(
  .envrc
  local.config.json
)
skip=(
  build.log
  tmp
  dist                     # rebuilt in seconds; not worth carrying
)

# The companion repository. Its trunk is `main` while this repo's is `master`,
# which is the point: every containment question about the mirror is asked
# against ITS trunk. `fold` squash-merges the mirror into that trunk on teardown
# once the parent PR is merged.
nested=(
  notes:mirror:fold:kb
  shared:link
)

ports=(4311:web)
shared_note='the dev server binds :4311, so one worktree at a time'

# Probes — this repo's own answers to "how has this diverged".
wt_probe mig '%F{13}mig:{}%f' \
  'git diff --name-only --diff-filter=A $WTX_BASE...HEAD -- db/migrations | wc -l'

# docs/index.md is one long line per row, so two branches editing DIFFERENT rows
# still conflict: the changed lines are adjacent with no common line between
# them, and git treats that as a single region. Worth knowing before the second
# PR is the one that has to resolve it.
wt_probe idx '%F{13}idx%f' \
  'git diff --quiet $WTX_BASE...HEAD -- docs/index.md || echo 1'

gc_paths=('dist')

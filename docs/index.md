# Index

One row per stream of work. Rows are long single lines on purpose: two branches
editing *different* rows still conflict, because the changed lines are adjacent
with no common line between them and git treats that as one region.

| Stream | State | Notes |
|---|---|---|
| bootstrap | done | the repo exists |
| add-endpoint | wip | WTEST-001 adds POST /widget |
| add-endpoint | wip | WTEST-001 adds POST /widget |

# SQP_Classic

SQP_Classic is the Classic-only fork of SimpleQuestPlates. Work on the `classic-fork` branch and keep it distinct from Retail `main`. `SQP_Classic.toc` targets Classic Era (`11509`), Burning Crusade Classic (`20506`), and Mists of Pandaria Classic (`50504`); it must not gain the Retail interface target. The addon requires `RGX-Framework` and stores settings in `SQPClassicSettings`.

## Layout

- `SQP_Classic.toc` loads `SimpleQuestPlates.xml`, which defines localization and runtime load order.
- `locales/` contains the `enUS` baseline and locale overrides.
- `data/` contains the fork's compatibility layer, quest/nameplate logic, event handling, commands, and hand-built options UI.
- `media/` contains the fork's icon, logo, screenshots, and other documentation assets.
- `docs/` contains the fork changelog, README, description, and roadmap.

## Fork Rules

- Preserve Classic compatibility guards in `data/compat.lua` and `data/compat_mop.lua`; do not replace them with Retail-only APIs.
- Use the RGX database, lifecycle, timer, and slash-command integrations already present, but preserve raw event/timer compatibility paths where the fork currently needs them.
- Port shared changes from SimpleQuestPlates selectively. Do not overwrite fork-specific TOC metadata, `SQPClassicSettings`, compatibility code, options modules, media paths, or Classic version labeling.
- Preserve the script order in `SimpleQuestPlates.xml`. Keep `SQP_Classic.toc` and `SQP.VERSION` in `data/core.lua` synchronized when changing versions.
- `docs/CHANGES.md` contains the current fork release notes.

## Testing And Release

- There is no build step or automated test suite. Install the repository as `SQP_Classic` with a matching Classic build of `RGX-Framework`. Test each changed supported flavor with `/reload`, `/sqp help`, `/sqp status`, `/sqp test`, quest/nameplate updates, target and mouseover detection, options and previews, persistence, and locale fallback behavior.
- Release tags and versions must retain the fork's `-classic` identity. The inherited `.github/workflows/release.yml` currently references the absent `SimpleQuestPlates.toc` and accepts only plain semantic-version tags, so do not claim or rely on automated packaging until that workflow is repaired for `SQP_Classic.toc` and Classic-suffixed versions.

## Repository Workflow

- The GitLab project under `rgxmods/warcraft` is authoritative. Normal work belongs on task branches and must merge through GitLab merge requests, never directly to the default branch.
- Shared CI is included from `rgxmods/warcraft/RGX-Framework` at `/.gitlab/ci/addon.yml`; validation must pass before publishing to the GitHub mirror.
- The GitHub `RGXMods` repository is downstream distribution, not development authority.
- Keep GitLab and GitHub release tags identical, and use protected GitLab release tags.
- Preserve any existing working Wago connection and ID exactly. Never create a new Wago connection without explicit user direction.
- Publishing integrations prohibited by the shared validation policy are retired and must not be restored.
- The root `README.md` must remain detailed and project-specific. Narrow distribution edits must not replace or truncate installation, features, compatibility, usage, media, or support content.
- Verify relative README assets. Do not overwrite newer compatibility facts with stale monorepo or history text.

## Building With RGX-Framework

- Contract first: build addon behavior from the declarative `RGXAddon(name, opts)` table using only keys the framework ships today. Read `docs/DECLARATIVE-API.md` in `rgxmods/warcraft/RGX-Framework` before writing code; tier 4 keys are future targets, not runtime features. Use `onInit` and addon-scoped methods only where the shipped declarative surface genuinely cannot express the behavior.
- MCP tool loop: before writing UI, timer, event, aura, or slash code, run the rgx-framework MCP tools in order: `rgx_get_contract` -> `rgx_generate_addon` -> `rgx_validate_addon` -> `rgx_audit_lua`. Compare generated Lua with existing integration, validate the actual opts table, and audit every changed Lua file. Never hand-roll what the framework ships.
- Prefer framework subsystems over raw WoW API: timers and repeating schedules, event registration, slash commands, minimap button, saved-settings database, aura watching, UI controls and dropdowns, colors, fonts, theming, tooltips, and sound. The fork's existing raw event/timer compatibility paths are deliberate Classic guards; migrate them to framework-managed equivalents deliberately, never silently.
- Forbidden patterns that fail `rgx_audit_lua`: raw `C_Timer`, manual event frames, `SLASH_` globals, unguarded `SetAttribute`, raw aura plumbing, and raw hook reassignment.
- Validation: Lua 5.1 (`luac5.1 -p`) and XML (`xmllint`) must pass through the shared CI include before every MR, and the root README stays nonempty and substantive.
- Dependencies: keep `## RequiredDeps: RGX-Framework` and any `## X-RGX-Framework-MinVersion` accurate against the framework version line, and match the TOC SavedVariables name (`SQPClassicSettings`) with the declarative `dbName`.
- Repo facts: this fork serves Classic Era (`11509`), Burning Crusade Classic (`20506`), and Mists of Pandaria Classic (`50504`), installs as `SQP_Classic`, and commands run through `/sqp` (`/sqp help`, `/sqp status`, `/sqp test`). The TOC owns the `X.Y.Z-classic.N` version; `SQP.VERSION` in `data/core.lua` bumps with it. Recheck facts in the TOC and README when they change.

## Keeping Interface Versions Current

- Ground truth is the game client's own `.build.info` in the WoW installation root: one pipe-delimited row per installed product; the Product column names the flavor and the Version column gives `major.minor.patch.build`. Read it immediately before changing a TOC or releasing.
- Derive `## Interface:` as `major * 10000 + minor * 100 + patch` (verified: `1.60.1` -> `16001`, `1.15.9` -> `11509`, `2.5.6` -> `20506`, `5.5.4` -> `50504`). This addon's TOC carries its three Classic flavors as a comma-separated list and must not gain the Retail target.
- Online cross-checks for builds not installed locally: the wago.tools build pages and versions.wowtools.io. Verify a feed is reachable at runtime before trusting it; if it is unreachable, the installed client's `.build.info` is authoritative and an uninstalled flavor's live version is never guessed.
- A stale `## Interface:` value is a bug: fix it in a task-branch MR with green shared validation before any release.
- Release through GitLab MR and green shared validation, then patch-bump through the same discipline and create a protected GitLab release tag matching the TOC version while retaining the `-classic` identity. Verify the identical tag on the downstream `RGXMods/SimpleQuestPlates_Classic` mirror before reporting distribution pickup.

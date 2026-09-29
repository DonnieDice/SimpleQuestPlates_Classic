# /.github/workflows

CI/CD workflows for SimpleQuestPlates.

## release.yml

Triggered on tag push (`v*`).

Responsibilities:

- Determine release type (`release`, `beta`, `alpha`)
- Extract addon version from `SimpleQuestPlates.toc`
- Feed `docs/CHANGES.md` into release text
- Run the in-house packager for distribution (GitHub, CurseForge, Wago)
- Send Discord notifications on success/failure

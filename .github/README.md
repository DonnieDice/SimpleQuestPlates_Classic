# /.github

Repository automation and platform metadata.

## Contents

- `workflows/` - GitHub Actions workflows used for packaging and release

## Notes

- Release automation is tag-driven (`v*`).
- Packaging uses the in-house deterministic packager (`tools/release/packager.mjs` + `tools/release/publish-release.mjs`) plus platform API tokens from repository secrets.

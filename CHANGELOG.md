# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Added

- Added automated monitoring for changes to the official Minnesota Secretary of State precinct source.
- Added GitHub Actions security auditing with zizmor.
- Pinned GitHub Actions dependencies to immutable commit SHAs.

### Changed

- Updated Minnesota source metadata from the April 2025 source to the May 1, 2026 source.
- Updated repository dependencies and managed configuration.
- Aligned repository licensing metadata with CC BY 4.0.
- Aligned repository version metadata for the upcoming 1.1.0 release.

### Removed

- Removed the obsolete `DEVELOPER.md`; development instructions are maintained in `README.md`.
- Removed the Dependabot auto-merge workflow; Dependabot continues to propose GitHub Actions updates for review.

---

## [1.0.4] - 2025-11-10

---

## [1.0.4] - 2025-11-10

### Changed

- Use **combined file** rather than individual json (geojson) files
- Page: <https://www.sos.mn.gov/election-administration-campaigns/data-maps/geojson-files/>
- Combined: <https://www.sos.mn.gov/media/2791/mn-precincts.json>

---

## [1.0.3] - 2025-11-09

### Added

- **Functional adapter (js/adapter.js)** to fetch and transform precinct data.
- **Functional transformer (js/transform.js)** with manifest-driven schema mapping.

---

## [1.0.1] - 2025-11-08

### Changed

- **Clarified licensing and provenance.**
  - Updated README, LICENSE, and CITATION.cff to specify that precinct geometries
    are obtained from the Minnesota Secretary of State and not redistributed.
  - Added clear description of derived materials licensed under CC BY 4.0.

---

## [1.0.0] - 2025-11-08

### Added

- **Initial**

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** – breaking changes
  - **MINOR** – backward-compatible additions
  - **PATCH** – fixes, documentation, tooling
- Versions are driven by git tags via `setuptools_scm`.
  Tag the repository with `vX.Y.Z` to publish a release.
- Documentation and badges are updated per tag and aliased to **latest**.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### One-Time Zenodo Authorization

1. Sign in to Zenodo.
2. Open your profile menu in the upper-right.
3. Select My account / Settings / GitHub.
4. In GitHub Repositories / Click **Sync now**.
5. Find structural-explainability/ this repo.
6. Turn on the repository toggle/slider.
7. Refresh the page and confirm it appears as enabled.
8. Zenodo will ingest future GitHub Releases from this repo.

### Task 1. Update release metadata (manual edits)

1.1. CHANGELOG.md: add section, move unreleased entries, update links
1.2. CITATION.cff: update version and date-released (version appears twice)
1.3. manifest.json:
1.4. package.json: update version (near top of the file)

### Task 2. Validate

Run:

```powershell
# update
npx npm-check-updates -u
npm install
npm run validate
npm test
npm run check

# Update GitHub Actions and pin all action references to immutable SHAs
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Hooks
uvx prek update
git add -A
uvx prek run --all-files

# Then audit the resulting GitHub configuration for security findings
uvx zizmor@latest .github/

# validate files
uvx cffconvert --validate

# format markdown
npx markdownlint-cli2 --fix
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully,
including the combined Zensical and Lean API documentation deployment.

### Task 4. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

Create GitHub Release after setting up Zenodo and pushing a tag,
for example with a command like this:

```shell
gh release create v1.1.0 --verify-tag --title "1.1.0"  --generate-notes
```

After pushing a new tag:

1. Increment the version in `scripts/make_dataset_zip.sh`.
2. Create a new zipfile by running: `./scripts/make_dataset_zip.sh`
3. Upload new release archive (civic-data-boundaries-us-mn-2025-04-r#.zip) to Zenodo where # is the next incremental zipfile iteration.
4. Zenodo generates a new record ID.
5. Copy that record DOI into CITATION.cff under preferred-citation.doi.
6. Copy that record into README.md Zenodo badge.
7. Git add-commit-push CITATION.cff and README.md updates referencing the new DOI.

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/civic-interconnect/civic-data-boundaries-us-mn/compare/v1.0.4...HEAD
[1.0.4]: https://github.com/civic-interconnect/civic-data-boundaries-us-mn/releases/tag/v1.0.4
[1.0.3]: https://github.com/civic-interconnect/civic-data-boundaries-us-mn/releases/tag/v1.0.3
[1.0.0]: https://github.com/civic-interconnect/civic-data-boundaries-us-mn/releases/tag/v1.0.0

<!-- markdownlint-enable MD024 -->

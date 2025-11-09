# Minnesota Geographic Data

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17560656.svg)](https://doi.org/10.5281/zenodo.17560656)
[![License: CC BY 4.0](https://img.shields.io/badge/license-CC--BY--4.0-green.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Validate Status](https://github.com/civic-interconnect/civic-data-boundaries-us-mn/actions/workflows/validate.yml/badge.svg)](https://github.com/civic-interconnect/civic-data-boundaries-us-mn/actions/workflows/validate.yml)

> Metadata, configuration, and reproducible workflows for official Minnesota precinct boundaries.  
> Boundary geometries obtained directly from Minnesota Secretary of State.

---

## Quick Start

```javascript
// Example: load precinct boundaries from the official MN Secretary of State site
const url = "https://www.sos.mn.gov/media/2785/mn-cd1-precincts.json";
const precincts = await fetch(url).then((r) => r.json());
```

---

## Machine-Readable Catalog

For programmatic discovery and reproducible workflows, see:

- API catalog:  
  `https://raw.githubusercontent.com/civic-interconnect/civic-data-boundaries-us-mn/main/api/v1.0.0/catalog.json`
- US index (latest):  
  `https://raw.githubusercontent.com/civic-interconnect/civic-data-boundaries-us-mn/main/data/us/latest/index.json`
- Minnesota index:  
  `https://raw.githubusercontent.com/civic-interconnect/civic-data-boundaries-us-mn/main/data/us/mn/index.json`

---

## Source and Licensing

Official precinct boundary data are published by the  
[Minnesota Secretary of State](https://www.sos.mn.gov/election-administration-campaigns/data-maps/voting-precincts/)  
through the **Maps and Geodata** resources (e.g., Voting Precincts Shapefiles and GeoJSON).

The Secretary of State website does **not specify an open data license** and includes  
terms that restrict redistribution of materials from the site.

This repository and associated Zenodo record therefore:

- Reference, but do not redistribute, official precinct geometry files.
- Provide metadata, schemas, and configuration files for reproducible local use.
- License all derivative documentation and configuration files under  
  [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

Users should review and comply with the Minnesota Secretary of State’s Terms & Conditions when accessing the original data.

---

## Version History

- **v2025-04 (original):** Included locally derived precinct geometry files.
- **v2025-04-r1 (current):** Geometry files omitted; repository focuses on metadata and reproducible configurations.

---

See `CITATION.cff` for full citation details.

# ADR Rules

Create an ADR only for technical decisions with long-term impact.

ADR path:

`docs/adrs/{ADR_NUMBER}-{JIRA_ID optional}-{decision-slug}.md`

ADR numbering is sequential for the whole repository.

Examples:

- `docs/adrs/0001-use-hls-for-vod-streaming.md`
- `docs/adrs/0002-TELA-123-use-exoplayer-trackselector.md`

Create ADRs for decisions like:

- HLS vs MP4 range requests
- SQLite local cache
- ExoPlayer TrackSelector
- BunnyCDN/B2 strategy
- Worker architecture
- Auth/security/media token strategy

Do not create ADRs for trivial implementation details.

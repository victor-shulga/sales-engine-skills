# sales-engine

Sales execution skills for B2B service companies: discovery prep, call scripts, value propositions, pipeline analysis.

Part of the GTM-system methodology by [Victor Shulga](https://victorshulga.com) (Fractional CRO).

## Install (Claude Code)

```
/plugin marketplace add victor-shulga/sales-engine-skills
/plugin install sales-engine@sales-engine-skills
```

Restart your Claude Code session after install — skills load at session start.

## Skills included

- `cold-call-script`
- `meeting-prep`
- `pipeline-analysis`
- `value-prop-lister`

## Requirements & integrations

| Integration | Used for | Required? | Auth / setup |
|---|---|---|---|
| Claude Code | running the skills | yes | claude.com/claude-code |
| Notion MCP | writing reports/audits as Notion pages | optional | connect Notion in Claude settings |
| Outreach platform MCP (Instantly / HeyReach / Grinfi / Aimfox) | pulling live campaign & reply data | optional | connect the platform you use |
| CRM MCP | pulling deals/accounts | optional | connect your CRM |

Skills degrade gracefully: without MCP connections they work from pasted data (CSV, sheets, text).

## Changelog

**0.2.0** — `28-meeting-intent-scorer` removed. Scoring a reply for meeting intent is one step of
answering that reply, not a separate job: it has been folded into `reply-objection-handler` in the
[outbound-engine](https://github.com/victor-shulga/outbound-engine-skills) bundle, which triages the
reply for intent and speed and then writes the actual response. Numeric prefixes dropped throughout.

**0.1.0** — initial bundle.

## License

MIT — see [LICENSE](LICENSE).

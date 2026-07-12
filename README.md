# sales-engine

Sales execution skills for B2B service companies: discovery prep, call scripts, meeting-intent scoring, value propositions, pipeline analysis.

Part of the GTM-system methodology by [Victor Shulga](https://victorshulga.com) (Fractional CRO).

## Install (Claude Code)

```
/plugin marketplace add victor-shulga/sales-engine-skills
/plugin install sales-engine@sales-engine-skills
```

Restart your Claude Code session after install — skills load at session start.

## Skills included

- `28-meeting-intent-scorer`
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

## License

MIT — see [LICENSE](LICENSE).

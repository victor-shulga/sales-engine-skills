# sales-engine

Sales execution skills for B2B service companies: discovery prep, call scripts, value propositions, pipeline analysis, an offer ladder and the proposal that closes — the draft → brief → proposal chain in one pack.

Part of the GTM-system methodology by [Victor Shulga](https://victorshulga.com) (Fractional CRO).

## Install (Claude Code)

```
/plugin marketplace add victor-shulga/sales-engine-skills
/plugin install sales-engine@sales-engine-skills
```

Restart your Claude Code session after install — skills load at session start.

## Skills included

**From first call to proposal**

- `meeting-prep` — a ≤500-word brief before the call
- `cold-call-script` — the script for the call itself
- `value-prop-lister` — the value propositions the offer is built from
- `offer-ladder` — free → low → mid → high tiers around one core transformation, grounded in real services and cases
- `proposal-generator` — two proposals on the client's brand: a call deck and a send version, plus a critique of the quotes they send today
- `pipeline-analysis` — where deals stall and the follow-ups that move them

## Requirements & integrations

| Integration | Used for | Required? | Auth / setup |
|---|---|---|---|
| Claude Code | running the skills | yes | claude.com/claude-code |
| Notion MCP | writing reports/audits as Notion pages | optional | connect Notion in Claude settings |
| Outreach platform MCP (Instantly / HeyReach / Grinfi / Aimfox) | pulling live campaign & reply data | optional | connect the platform you use |
| CRM MCP | pulling deals/accounts | optional | connect your CRM |

Skills degrade gracefully: without MCP connections they work from pasted data (CSV, sheets, text).

## Changelog

**0.3.0** — the sales block now ends in a proposal. `proposal-generator` moved here from
[gtm-skills](https://github.com/victor-shulga/gtm-skills) (one home per skill, as before) and
`offer-ladder` was added, so draft → brief → offer → proposal lives in one pack.

**0.2.0** — `28-meeting-intent-scorer` removed. Scoring a reply for meeting intent is one step of
answering that reply, not a separate job: it has been folded into `reply-objection-handler` in the
[outbound-engine](https://github.com/victor-shulga/outbound-engine-skills) bundle, which triages the
reply for intent and speed and then writes the actual response. Numeric prefixes dropped throughout.

**0.1.0** — initial bundle.

## License

MIT — see [LICENSE](LICENSE).

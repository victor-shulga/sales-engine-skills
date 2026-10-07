---
name: pipeline-analysis
description: >-
  Reviews the deal pipeline of a B2B service company (dev or IT outsourcing, agency, AEC/BIM
  outsourcing, consultancy) and builds a single-file HTML dashboard from the real deal data.
  Handles project, retainer and dedicated-team deals on one value scale, checks data hygiene,
  finds where deals stall (proposal sent with no answer, procurement and contract, deals with
  one contact), calculates win rate, cycle length and coverage from the company's own closed
  deals, splits the forecast into commit, best case and pipeline, compares owners, and ends
  with up to 8 named actions. Input: a CRM export (CSV or sheet) or a connected CRM. Use when
  the user says "analyze my pipeline", "pipeline review", "forecast this month", "where are
  deals stuck", "which deals will close", "who is my top rep", "розбери пайплайн",
  "що з угодами", "прогноз на місяць", "де застрягають угоди". NOT deal qualification of one
  deal (scope-qualifier), NOT outreach campaign stats (outbound reporting skills).
---

# Pipeline analysis for service companies

A service pipeline breaks in places a SaaS pipeline does not. Deals are bigger and fewer, so
one slipped deal moves the month. The proposal stage is long and quiet. Procurement, an MSA
and a security questionnaire can add six weeks after a verbal yes. And a retainer worth
8,000 a month sits in the CRM next to a fixed-price project worth 60,000 as if the two
numbers meant the same thing.

This skill puts the deals on one scale, shows where they stall, and names who should do what
this week. Answer in the user's language. Never show a number the data does not support; an
assumption is labelled as one.

---

## 1. Load the data

**From a file or sheet.** Map whatever columns exist to this schema and show the user the
mapping in one table before going further:

| Field | Meaning | Required |
|---|---|---|
| `deal` | deal name | yes |
| `account` | company | yes |
| `stage` | current stage | yes |
| `value` | total contract value | yes, or derived |
| `model` | project / retainer / team | if available |
| `monthly` and `months` | for retainers and teams | if `value` is empty |
| `owner` | who runs the deal | yes |
| `created` | date the deal was opened | for cycle length |
| `close` | expected close date | for the forecast |
| `last_activity` | last call, email or meeting | for stall checks |
| `stage_entered` | date it moved into the current stage | for stall checks |
| `contacts` | number of people engaged on the buyer side | if available |
| `lost_reason` | for closed-lost | if available |

**From a connected CRM.** Pull open deals plus deals closed in the last 12 months, with the
fields above. Closed deals are needed: they give this company's own win rate and cycle.

**Putting deals on one scale.** Contract value = `value` if present, otherwise
`monthly × months`. If a retainer has no committed term, use 6 months and mark every such
deal "term assumed". Show monthly recurring value as its own KPI next to total value.

## 2. Check hygiene first

List problems in a small block at the top of the report, then continue with what is usable:
- no value, or a value of zero
- close date in the past on an open deal
- no owner
- no activity logged for 30+ days
- duplicates (same account and similar deal name)
- stage names that do not match the rest (typos, retired stages)

Give the share of deals affected. If more than a third of deals have no `close` date or no
`last_activity`, say the forecast or the stall check is unreliable and why.

## 3. Calculations

### 3.1 Snapshot
Open deals, total contract value, monthly recurring value, median deal size (the median,
because one large deal distorts the average in a small pipeline).

### 3.2 Stages
For each stage: count, value, median days in stage. If closed deals exist, the conversion
from each stage to the next, measured on the company's own history.

Probabilities per stage come from history when there are at least 20 closed deals. Otherwise
use these starting points, label them "default, not measured", and suggest replacing them:

Defaults in stage order: discovery call held 10%, scoping or solution 20%, proposal sent 35%,
negotiation or procurement 60%, verbal yes with the contract in progress 85%. Rename the stages
to match the CRM and keep the order.

### 3.3 Where deals stall
Flag a deal when any of these holds, and give the reason in words:
- **Proposal silence:** in "Proposal sent" for 14+ days with no logged activity.
- **Slow stage:** days in stage above twice the median for that stage among won deals
  (or among all deals if there are fewer than 10 won).
- **Paper stage:** in procurement or contract for 30+ days.
- **Overdue:** close date passed while the deal is still open.
- **One contact:** `contacts` = 1 on a deal in proposal or later.
- **Old and early:** opened 90+ days ago and still before the proposal.

For each flagged deal: account, owner, stage, days, value, reason, and the next step from the
table in section 5.

### 3.4 Win rate, cycle, coverage
From closed deals of the last 12 months: win rate by count and by value, median days from
open to won, top three lost reasons with counts.

Coverage needed = 1 ÷ win rate (by value). A team that wins 25% needs 4× the target in open
pipeline, so the familiar 3× rule only fits a team that wins about a third. If the user gives a monthly or quarterly target, compare
pipeline closing in that period against target × needed coverage.

### 3.5 Forecast
For each of this month, next month and this quarter:
- **Commit:** verbal yes or contract in progress, close date inside the period.
- **Best case:** commit plus negotiation and procurement inside the period.
- **Pipeline:** everything else with a close date inside the period, weighted by probability.

Flag deals expected this month that are still before the proposal stage: they will almost
certainly slip.

### 3.6 Owners
Per owner: open deals, value, flagged deals, commit this month, median days since last
activity. Rank by commit, then by best case. With one owner, fold this into the snapshot.

## 4. The dashboard

One self-contained HTML file. Chart.js from a CDN is fine; data is baked into the file, so
it opens offline once the library is cached.

Layout, top to bottom:
1. Title, data source, export date, and the hygiene block.
2. KPI cards: open value, monthly recurring value, commit this month, win rate, median cycle.
   Where a target exists, the card shows the target next to the fact.
3. Value by stage: horizontal bars with the value printed on each bar.
4. Forecast: commit, best case and pipeline per period as grouped bars, one value axis.
5. Flagged deals: a table sorted by value, the reason in plain words, colour only on the
   reason column.
6. Owners: a table, sortable by clicking a header.
7. Lost reasons: a bar chart, or a donut with at most 4 slices (top 3 plus a grey "Other").

Design rules:
- Each panel has a short title; the one-line reading of the panel ("3 of 5 proposals have had
  no answer for 2+ weeks") sits behind a small ⓘ icon next to the title.
- One accent colour for the item that matters; everything else neutral. Red only for overdue.
- Value labels on bars; no empty gridlines; no dual axes.
- Money in the currency of the data; dates in the user's locale.
- `<meta name="viewport">`, grid tracks that shrink, tables that scroll inside their panel,
  one column on phones.

## 5. Actions

After the dashboard, a list of 8 actions or fewer, ordered by value at risk. Each one names
the deal, the owner, the step and the day.

```
1. [Account], [value], proposal silent 19 days. Owner: [name].
   Call the day-to-day contact today and ask what is blocking the decision; if no answer by
   Friday, ask the sponsor directly.
```

Next steps by situation:

| Situation | Step |
|---|---|
| Proposal silence | A call, not another email: ask what changed since the proposal went out. |
| One contact | Ask the contact who else signs off and offer a short session for that person. |
| Paper stage | Get the procurement contact's name; send the MSA and security answers they still need. |
| Slow early stage | Requalify with the qualification framework; close it as lost if there is no "why now". |
| Overdue | Move the close date with a reason, or close the deal. Do not leave it overdue. |

## 6. Before you hand it over

- The user saw the column mapping table before any calculation ran.
- Defaults for probabilities and retainer terms carry a label inside the dashboard.
- Numbers in the actions match the numbers in the dashboard.
- Every deal and person in the report exists in the data.

## Credits

Idea adapted from a public outbound-skills collection; rewritten.
Written by Victor Shulga (victorshulga.com).

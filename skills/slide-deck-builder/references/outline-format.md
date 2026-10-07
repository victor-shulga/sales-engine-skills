# Outline format for `scripts/build_deck.py`

One JSON file. `slides` is the approved outline, in order. Each slide has a `layout` and a
`headline` (the takeaway sentence). `notes` becomes speaker notes.

```json
{
  "title": "Pilot proposal for a regional logistics firm",
  "brand": {
    "background": "#FFFFFF", "ink": "#1A1A1A", "body": "#3A3A3A", "muted": "#6B6B6B",
    "primary": "#1F3A5F", "accent": "#2F7D6D", "surface": "#F4F4F2",
    "font_heading": "Arial", "font_body": "Arial",
    "logo": "assets/logo.png", "footer": "Company name · Confidential"
  },
  "slides": [
    {"layout": "title", "headline": "Cut quote turnaround from 5 days to 2", "sub": "Pilot proposal · March"},
    {"layout": "bullets", "headline": "Quotes stall because estimates wait on one engineer",
     "bullets": ["3 of 4 late quotes waited on the same reviewer", "No template for repeat jobs"],
     "notes": "Source: client's own tracker, Jan to Feb."},
    {"layout": "stat", "headline": "The delay already costs about one deal a month",
     "stats": [{"value": "5 days", "label": "median quote turnaround"},
               {"value": "4", "label": "quotes lost to faster bidders in Q1"}],
     "source": "client CRM export, Q1"},
    {"layout": "two_col", "headline": "Keep review in-house, move drafting out",
     "left": {"title": "You keep", "bullets": ["final pricing", "client calls"]},
     "right": {"title": "We take", "bullets": ["first-draft estimates", "template library"]}},
    {"layout": "quote", "headline": "What the sales lead said",
     "quote": "We lose the fast ones, not the big ones.", "attribution": "Head of Sales"},
    {"layout": "table", "headline": "Six weeks, one stop point after week 2",
     "rows": [["Week", "What you hold"], ["2", "Audit + go/no-go"], ["6", "Live template library"]]},
    {"layout": "section", "headline": "Appendix"},
    {"layout": "closing", "headline": "Decision needed: start the 2-week audit on 3 March?", "sub": "Next step: kickoff call"}
  ]
}
```

## Layouts

| Layout | Use for | Fields |
| :-- | :-- | :-- |
| `title` | cover | headline, sub |
| `section` | divider between parts | headline |
| `bullets` | an argument with up to 5 supporting points | headline, sub?, bullets |
| `stat` | 1 to 4 numbers that carry the message | headline, stats[{value,label}], source (required) |
| `two_col` | before/after, us/you, option A/B | headline, left{title,bullets}, right{title,bullets} |
| `quote` | a customer's or stakeholder's own words | headline, quote, attribution |
| `table` | plan vs actual, timelines, pricing (8 rows max) | headline, rows (first row = header) |
| `closing` | the ask and the next step | headline, sub |

## Brand keys

All optional. Missing keys fall back to the neutral palette in the script. Colors are hex.
`logo` is a path relative to where you run the script. Fonts must be installed on the machine
that opens the deck; otherwise PowerPoint substitutes them, so prefer common fonts or tell the
user which font files to install.

## Limits the script warns about

- headline over 16 words
- more than 5 bullets on a slide
- text that likely overflows its box (rough estimate from character count and font size)
- a stat slide without a source
- a table with more than 8 rows

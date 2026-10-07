---
name: slide-deck-builder
description: >-
  Turns a source document, call notes or a finished narrative into an editable .pptx deck for a
  B2B service company: sales/pitch, QBR/board, case study, or onboarding/training deck. Ingests
  the source, picks the deck type, drafts an outline where every headline is the takeaway
  sentence, gets it approved, builds with python-pptx (bundled script) or the pptx skill if
  available, applies the client's brand if a design system is given (neutral otherwise), renders
  and checks every slide for overflow, then delivers the file plus a list of gaps. Use when the user says "зроби
  презентацію", "збери деку", "слайди з цього документа", "pptx", "deck from these notes",
  "turn this into slides", "pitch deck", "board deck", "onboarding deck", "кейс у слайдах". NOT
  the call deck that goes with a proposal (proposal-generator), NOT the QBR content itself
  (qbr-builder writes it, this skill lays it out), NOT the case study story (case-study-writer).
---

# Slide deck builder

A deck is a sequence of claims. Each slide proves one claim, and its headline states that claim
as a full sentence. If someone reads only the headlines, they should get the whole argument.
Most weak decks fail here: topic labels for headlines ("Our approach"), several messages per
slide, and numbers with no source.

This skill does the layout and production. It does not invent content. Everything on a slide
comes from the source the user gave; whatever is missing goes on the gaps list.

## Files in this skill

- `references/deck-types.md`: default outlines for the four deck types, plus the headline test.
- `references/outline-format.md`: the JSON outline the build script reads, with a full example.
- `scripts/build_deck.py`: builds a 16:9 .pptx from the outline (python-pptx), applies a brand,
  writes speaker notes, and warns about likely overflow, long headlines and slides with too much on them.
- `scripts/render_check.sh`: converts the .pptx to PDF and PNG thumbnails for a visual check
  (needs LibreOffice; poppler for PNGs).

## Step 1. Ingest the source

Accept whatever the user has: a .docx, .pdf, .md, a Notion page, a transcript, pasted notes,
or an existing deck to rework.

- .docx or .pdf: use the docx or pdf skill if available, or `markitdown` if installed
  (`pip install markitdown`, then `markitdown file.pdf > source.md`). Otherwise extract text
  with whatever the environment offers and say what was lost (tables, images).
- An existing .pptx: read its text with python-pptx and treat it as source, not as a template.
- Notion: fetch the page through the Notion connector if it is available; otherwise ask the
  user to paste or export it.

Then write a 5-line source summary for yourself: audience, the decision the deck should lead to,
the 3 to 5 strongest facts, the numbers and where each comes from, what is clearly missing.

## Step 2. Pick the deck type and draft the outline

Ask the user only what the source does not answer: who is in the room, what decision you want
from them, how long the slot is (rule of thumb: one slide per 1 to 2 minutes of talk).

Pick one type from `references/deck-types.md` and adapt its default outline:

| Type | Audience | The deck must end with |
| :-- | :-- | :-- |
| Sales / pitch | prospect who has not bought | one next step with a date |
| QBR / board | existing client's buyer, or a board | decisions requested, with deadlines |
| Case study | prospects similar to the featured client | "if this is you" plus the next step |
| Onboarding / training | new client team or new hires | the first task and its deadline |

Outline rules:
- One message per slide. Two messages make two slides.
- Headline = the takeaway sentence, 8 to 14 words. Topic labels fail the headline test.
- Every number has a source in the speaker notes or on the slide. No source, no number.
- A slide the source cannot support is cut and goes on the gaps list. Do not pad.
- Name a real client only if the source shows permission; otherwise describe them by type.

## Step 3. Get the outline approved

Show the outline as a numbered list: `layout · headline · what supports it · source`.
Do not build anything until the user approves it or edits it. Changing an outline takes a
minute; rebuilding a finished deck takes an hour.

## Step 4. Build

Preferred: the pptx skill, if it is available in this environment, because it handles templates
and complex layouts. Otherwise use the bundled script:

```bash
pip install python-pptx            # once
python3 scripts/build_deck.py outline.json deck.pptx --brand brand.json
```

Write the approved outline into `outline.json` in the format from `references/outline-format.md`.
PptxGenJS is a fine alternative if the environment is Node-based; keep the same outline and the
same rules.

**Brand.** If the user gives a design system (a design-system page, a brand kit, an existing
branded deck, or the output of `design-system-generator` if installed), take colors, fonts and
the logo from it and put them in `brand.json`. Never re-derive brand colors from memory. If no
brand is given, keep the neutral palette and say so in the delivery note. Do not apply your own
company's brand to a client's deck.

## Step 5. Render check

1. Read the script's warnings. Fix every one in the outline (shorten, split, add the source) and rebuild.
2. Render: `bash scripts/render_check.sh deck.pptx`. Open the PNGs (or the PDF) and look at every
   slide: text cut off or running past its box, overlapping shapes, unreadable contrast,
   substituted fonts, orphan words on headlines, empty placeholders.
3. If LibreOffice is not available, say so, rely on the build warnings, and ask the user to flip
   through the file once before sending it. Do not claim a visual check you did not do.
4. Repeat until a full pass finds nothing.

## Step 6. Deliver

Give the user:
- the .pptx file (and the PDF if one was rendered);
- the headline-only storyline (so they can check the argument in 20 seconds);
- the **gaps list**: every slide that was cut or weakened for lack of source, every number
  without a source, every placeholder the user must fill (logo, client permission, price).

## Hand-offs (use if installed)

- Call deck that accompanies a proposal: `proposal-generator` (pack `sales-engine-skills`)
  builds it. Do not duplicate it here.
- QBR or board content: `qbr-builder` (pack `account-management-skills`) writes the narrative;
  this skill lays out the finished narrative only.
- Case study story and numbers: `case-study-writer` (pack `account-management-skills`) first,
  then the case study deck here.
- Delivery process slide: `delivery-process-builder` (pack `sales-engine-skills`) gives the
  phase content for a one-slide timeline.

## Rules

- Content comes from the source. A missing fact becomes a gap, never a guess.
- Write slides in the language of the audience; talk to the user in the user's language.
- Keep slides sparse: up to 5 bullets, up to 4 stats, up to 8 table rows. Detail goes into
  speaker notes or an appendix section.
- The deck is editable: native text boxes and tables, no slides flattened into images.

## Credits

Idea adapted from lemlist's public `slide-deck-builder` skill (github.com/l3mpire/claude-skills); rewritten.
Written by Victor Shulga (victorshulga.com).

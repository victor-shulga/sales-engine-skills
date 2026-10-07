---
name: delivery-process-builder
description: >-
  Builds a service company's buyer-facing delivery process (what clients call "methodology")
  for an IT agency, AEC outsourcing firm or consultancy. It shows what the buyer receives week
  by week, where they can stop, what their team must put in, what happens when things go wrong,
  how they see progress, and why timelines and price grow with size. From a founder interview it
  fills a 12-block process template, runs a reality gate against the last 3 real projects and
  the price list, then writes a website page, a call-deck slide and a proposal block in the
  client's brand and language. Trigger on "методологія", "процес роботи для покупця", "як ми
  працюємо", "delivery process", "how we work page", "опиши делівері", "сторінка методології",
  or when an audit finds a buyer-trust gap (strong case studies, no clear answer to what happens
  after signing). Not for internal SOPs or runbooks, and not for full proposals
  (proposal-generator).
---

# Delivery process builder

A buyer choosing between agencies with similar case studies is really asking one thing: what
happens to my money over the next few months? Case studies prove past skill. A clear delivery
process makes the future concrete. Most founders refuse to "write a methodology" because they
picture a 30-page document. This skill produces one page, one slide and one proposal block. The
founder talks for 60 to 90 minutes and proofreads; whoever runs the skill writes.

## Files in this skill

- `references/interview-guide.md`: the 10 interview questions (Ukrainian and English) and how
  answers map to template blocks.
- `references/process-template.md`: the 12-block fill-in template (blocks 0 to 11). Copy it
  into a Notion page if the Notion connector is available and the client keeps docs there;
  otherwise fill it as a markdown file `<client>-delivery-process.md`.

## Language

- Talk to the user in the user's language.
- Internal template copy: the client team's language, plain words. In Ukrainian avoid
  anglicisms (аудит, показники, ОПР).
- Website page, slide and proposal block: the language of the client's buyers (usually English).
- If `anticopywriting-ai` (pack `gtm-skills`) is installed, run all prose through it before delivery.

## Workflow

### 1. Intake (collect before the interview)

Ask for or find:
- offers and the price list, word for word (formats, minimum term, what each includes)
- the last 3 completed projects: planned vs actual timeline, what went wrong
- case studies with numbers
- 2 or 3 proposals they have already sent
- the client's design system or brand kit (colors, fonts, logo). If `design-system-generator`
  is installed and none exists, build one first.

If the client has no offer ladder or positioning yet, stop and say so. A delivery process
without them describes nothing. If installed, `08-offers` and `06-positioning`
(pack `gtm-strategy-skills`) cover those steps.

### 2. Interview

Use the 10 questions in `references/interview-guide.md` (they match block 0 of the template).
If there is no transcript yet, output the interview guide and stop. Never invent phases,
timelines, guarantees or numbers. Anything unknown is marked "to clarify in the interview".

If the client side has one stakeholder, run one conversation. Do not add role tables for people
who do not exist.

### 3. Fill the template

Copy `references/process-template.md` into the client's workspace (Notion page under the
client's area if available, else the markdown file). Fill blocks 1 to 9 from the interview.
Rules per block:

- Who it is for (block 1): type of company and the problem in the buyer's own words. No size
  range.
- Phases (block 2): 3 to 5 phases. Each has a timeline, 2 to 4 actions, and **what the buyer
  holds in their hands on which day**. Actions without a deliverable get rewritten or cut.
- Stop point (block 3): at least one, usually after phase 1 (audit, discovery, pilot),
  with its standalone price.
- What we need from you (block 4): owner on the client side, hours per week, access by
  which day, meeting cadence. Say plainly what the project cannot start without.
- When things go wrong (block 5): missed deadline, quality miss, a person replaced, scope
  change, the client does not deliver their part. Take each from a real project. An honest story
  about your own failure earns more trust than "this never happens to us".
- Progress (block 6): what the buyer sees, how often, in what format.
- Timelines and price (block 7): timelines are written for a named baseline scenario
  ("a company with one delivery team"). One sentence says what grows both timeline and price:
  more teams, more volume, more markets, and so more people who have to change how they work.
  Do not cap the audience by size ("up to 200 people"); size changes scope, not eligibility.
- Principles (block 8): 3 to 6, each with a consequence for the buyer. No consequence, no
  principle.
- FAQ (block 9): price, can we start small, how much of my team's time, where are the results.

### 4. Reality gate (block 10), mandatory before anything public

- Walk the described process through each of the last 3 projects. If any project ran
  differently, fix the description or the process first.
- Cross-check against the price list and the live site: phase lengths, minimum term, audit
  delivery time, prices, number of sessions, channels. Any mismatch blocks publishing.
  One real case: a published process page said "mentoring, 3 months" and "audit on day 14"
  while the price list said "6 months minimum" and "audit in 7 days". Buyers spot that before
  the seller does.

Report the gate to the user as a table: project, phases match?, timeline match?, what differed, fix.

### 5. Outputs

Write all three from the same filled template so they never drift apart.

**A. Website page.** Section order:
1. Hero: who it is for (type of company, no size range), the problem in the buyer's words,
   primary CTA "book a call" **on the first mobile screen**, and a one-line objection answer
   under the button ("60 minutes, free, no pitch" or the client's equivalent).
2. Short problem section (optional; one screen max).
3. What we build (the system or service), with the same block count everywhere.
4. What you receive, week by week: phase cards, each ending in "Day/Week N: deliverable". Mark
   the stop point. One line names the baseline scenario and what scales timeline and price.
5. What we need from your team (4 cards).
6. What happens when something goes wrong (3 cards; a story about your own failure is allowed
   if the client agrees).
7. How you see progress (what the weekly or monthly report contains).
8. Principles (each with a buyer consequence).
9. FAQ next to the final CTA: price, start small, team time, results (link to cases).
10. Final CTA, same wording as the hero CTA.

Build it in the client's design system (your own brand stays off client pages). Every number on the page must
be backed on the page or one click away; otherwise remove it. If `page-builder` is installed,
it can assemble the page.

**B. Call-deck slide.** One slide: the phases as a timeline with the deliverable per phase,
the stop point highlighted, one line on what is needed from the client. If
`slide-deck-builder` is installed (pack `sales-engine-skills`), use it to produce the file.

**C. Proposal block.** 150 to 250 words for the proposal template: phases with deliverables and
days, stop point with price, what we need from you, how progress is reported. Hand it to
`proposal-generator` (pack `sales-engine-skills`) if a full proposal is being built.

### 6. Review and ship

- Before a page goes public, get a blind review: a fresh subagent or a colleague who has not
  seen the drafting scores the page against the section order above and the anti-patterns below,
  returns the single biggest fix, and you apply it. Up to 3 rounds, a new reviewer each round.
  Then the client decides.
- Publish wherever the client hosts its site.
- Definition of done: blocks 1 to 10 filled and the reality gate is green. Definition of
  adopted: the process was shown on 3 prospect calls and the reactions are logged in block 11.

## Anti-patterns (reject on sight)

- "Discovery, Design, Development, QA". Every agency has it; buyers read it as noise.
- Actions instead of deliverables ("we analyse, we build, we launch").
- A process lifted from a sales deck that no real project followed.
- Different timelines or prices on the page, in the price list and in proposals.
- A 30-page document. The buyer reads one page.
- Unbacked claims ("75% of agencies...", "~160 tasks") with nothing on the page behind them.
- Size caps in the audience line when bigger clients simply cost more and take longer.

## After a run

Log what the interview surfaced that the template did not ask for. If the same gap shows up
with two clients, update your master copy of `references/process-template.md`. Client copies
never feed back into the master silently.

## Credits

Method and template by Victor Shulga (victorshulga.com).

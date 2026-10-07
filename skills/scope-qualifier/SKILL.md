---
name: scope-qualifier
description: >-
  Qualifies a deal with SCOPE, a qualification framework built for B2B service companies:
  Signal (why now), Capability gap (why not in-house), Outcome at stake (in the buyer's numbers),
  Players and path (who decides, budget, timeline, competition), Engagement fit and next move
  (verdict: pursue, nurture or disqualify). Produces the verdict, the CRM field set and the list
  of missing information for the next touch. Maps onto MEDDPICC or BANT fields when the CRM
  already runs one. Use when the user says "кваліфікуй лід", "qualify this
  deal", "qualification framework", "чи варто вести цю угоду", "SCOPE", "по якому фреймворку
  кваліфікуємо", "поля кваліфікації в CRM", "MEDDIC/MEDDPICC/BANT", "розбери цей дзвінок, що ми
  не з'ясували", or pastes call notes or a transcript and asks for a verdict. NOT the pre-call
  brief (meeting-prep), NOT scoring a cold prospect before contact (lead-scoring), NOT objection
  handling mid-thread (reply-objection-handler).
---

# SCOPE: deal qualification for service businesses

Borrowed frameworks miss what agencies actually sell against. SPICED was built for SaaS;
MEDDPICC was built for enterprise software procurement. Neither asks the question that decides
an outsourcing deal: **why aren't you doing this in-house?** SCOPE puts that question at the centre.

The form is a **map, not a script**. Talk 30% of the time, listen 70%, one question at a time.
Ask in the prospect's language. Ukrainian versions of every question are in
`references/questions-uk.md`.

---

## The five blocks

### S: Signal (why now)
What changed: a new project won, a deadline moved, someone left, a tool broke, a standard
changed, a market opened. No "why now" means this is a research conversation, not a deal.
- What changed in the last 3 months that made this a question now?
- What happens if this stays as it is until the end of the year?

### C: Capability gap (build vs buy), the axis specific to service companies
The competitor is rarely another agency. It is their own team, a future hire, or doing nothing.
- What stops you from closing this with your own team?
- Have you tried hiring for it? What happened?
- Which part do you want to keep in-house for good, and which part are you ready to hand over?

A prospect who can do it in-house cheaply and calmly is a disqualify, and that is a fine outcome.

### O: Outcome at stake (quantified)
This is what keeps you out of a price fight. Money, time or risk, in their numbers.
- How is this measured on your side: money, hours, a missed deadline, a penalty risk?
- What does it cost you per month right now?
- If we solve it, what exactly changes in the numbers?

If the number cannot be reached, write `[unknown]` and make it the goal of the next touch.
**Never estimate their impact for them and record it as fact.**

### P: Players and path
- Who else is in the decision besides you? Who says "no" last?
- How does a decision like this usually go here, from "yes" to signature?
- Is the budget already allocated, or does it still have to be defended?
- Who else are you looking at or comparing with?

### E: Engagement fit and next move
- Model: dedicated team, embedded (staff augmentation), or project. Which one fits what they described?
- Scope, rough size, start window.
- **Verdict: pursue, nurture or disqualify.** Always written, always with the reason.
- **A mutual next step booked on the call**: a date, an owner, a deliverable. "I'll send some
  information and get back to you" does not count.

---

## Output

| Field | Rule |
| :-- | :-- |
| Verdict | pursue / nurture / disqualify + one-line reason |
| S to E fields | filled, or `[unknown]`; never guessed |
| Red flags | from the list below, or "none" |
| Missing information | the 1 to 3 unknowns that block the verdict, each with who asks and when |
| Next step | date, owner, what gets delivered |
| CRM stage | which stage this moves to and why |

Write the internal write-up in the user's language. In Ukrainian use `[не з'ясовано]` for unknowns
and plain words (ОПР for decision maker, показники for metrics).

## Red flags: the verdict drops to nurture or disqualify

- No "why now": nothing changed, just curiosity
- No named consequence of doing nothing
- The buyer is never in the room, and there is no path to them
- Price asked before scope was discussed, and asked again after
- Comparing 5 or more vendors on rate alone
- The gap is a role they intend to hire for anyway, and hiring is going fine
- The timeline is "next quarter" across two touches in a row

Disqualifying early is a result. A pipeline full of nurture-grade deals hides the real number.

---

## Compatibility layer: the CRM already runs MEDDPICC or BANT

Do not rebuild their CRM. Map SCOPE onto their fields and fill both:

| SCOPE | MEDDPICC | BANT |
| :-- | :-- | :-- |
| S: Signal | Implicate the Pain (the trigger half) | none (BANT has no trigger, which is why it under-qualifies) |
| C: Capability gap | Competition (including do-nothing and in-house) | none |
| O: Outcome at stake | Metrics + Identify Pain | Need |
| P: Players and path | Economic buyer, Decision criteria, Decision process, Champion, Paper process | Authority, Budget, Timeline |
| E: Fit and next move | Champion + next step | none |

MEDDPICC and BANT both miss two things that matter for a service business: the **capability
gap** (why not in-house) and the **signal** (why now). Fill those regardless of which fields the
CRM shows.

Use MEDDPICC at full depth only where a real enterprise procurement path exists: legal, security
review, a procurement portal. Everywhere else it adds fields nobody fills, and half-filled
qualification is worse than none because it reads as complete.

---

## Process

1. Take the input: call notes, a transcript, an email thread, or a live prep request.
2. Fill S, C, O, P, E in that order. Problem before budget, always. Mark every unknown.
3. Check the red flags. Write the verdict with its reason.
4. Produce the CRM field set and the missing-information list.
5. If the input is a call that already happened, also write **what we failed to ask**, so the
   next touch has a job. That list is the real value of a post-call qualification review.
6. Hand off, if these skills are installed: pursue-grade deals to `meeting-prep` (next call) or
   `proposal-generator` (proposal stage), both in pack `sales-engine-skills`; nurture-grade deals
   to `nurture-architect` (pack `marketing-engine-skills`). Record every disqualify with its
   reason in the CRM so closed-lost reviews can use it later.

## Rules

- Fields hold facts the prospect said, or `[unknown]`. Never fill a field to make the card look complete.
- The prospect's language on the call; the user's language in the internal write-up.
- The verdict is mandatory. A qualification without a verdict is note-taking.
- Whoever prepares the qualification may differ from whoever runs the call. Write the card so the
  person on the call can use it without asking you anything.

## Credits

SCOPE is Victor Shulga's own framework (victorshulga.com). MEDDPICC, BANT and SPICED are named
only for the field mapping above; they belong to their respective authors.

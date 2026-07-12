---
name: meeting-intent-scorer
description: Use when asked to score a reply for meeting intent, triage incoming replies, or decide what to do next with a positive response
---

# Meeting Intent Scorer

Read a reply and score its meeting intent — so you know exactly how to respond and what the next action is.

## What you need

- The original email or LinkedIn message you sent
- The reply received (paste the exact text)
- ICP context

## Intent tiers

**Tier 1 — Book it now** (respond within 2 hours)
- Explicitly asks for a meeting, call, or demo
- Asks a qualifying question that implies intent ("what does pricing look like?", "how long does onboarding take?")
- Asks to see a case study or proof relevant to their situation
- Forwards to another person on the buying team

**Tier 2 — Nurture with one reply** (respond same day)
- Says "interesting" or "tell me more" without specifics
- Asks a general question about the product
- Says "send me more info" (without specifying what)
- Engages with the signal reference ("yes, we just hired 3 SDRs, actually")

**Tier 3 — Soft close** (respond, leave door open)
- Politely declines but leaves future possibility ("not right now but maybe in Q3")
- Says they're evaluating options
- Asks to follow up at a specific time

**Not an opportunity** (no further outreach)
- Explicit no with no opening ("we're all set, thanks")
- Unsubscribe request
- Wrong person with no referral

## Process

1. Read the reply carefully
2. Assign a tier based on language and intent signals
3. Draft the appropriate response
4. Define the next action in CRM or campaign platform

## Output format

```
Reply analysis: [name] @ [company]
Date: [date]

ORIGINAL MESSAGE
[summary of what you sent]

THEIR REPLY
"[exact text]"

INTENT TIER: [1 / 2 / 3 / Not an opportunity]
Key signal: [the phrase or word that determined the tier]

RECOMMENDED RESPONSE
---
[drafted reply]
---

NEXT ACTION
CRM: [create opportunity / add note / mark not interested]
Platform: [pause sequence / remove from campaign]
Follow-up date: [if applicable]
```

## Notes

- Tier 1 replies that don't get a response within 2 hours lose interest — speed is the differentiator here
- Tier 2 replies need one good question back, not a pitch — the goal is to qualify, not to close
- Never send more than one reply to a Tier 3 — if they don't engage with the door-open response, close it
- Log all Tier 1 and Tier 2 replies in the campaign's hypothesis-log — they're the proof that the hypothesis worked
- If you're seeing mostly Tier 2 ("tell me more") without conversion to Tier 1, the copy is too vague — the signal isn't landing

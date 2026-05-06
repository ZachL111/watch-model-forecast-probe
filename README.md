# watch-model-forecast-probe

`watch-model-forecast-probe` keeps a focused Haskell implementation around ml utilities. The project goal is to create a Haskell reference implementation for forecast workflows, centered on security rule linting, safe and unsafe fixtures, and remediation hints.

## Problem It Tries To Make Smaller

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Watch Model Forecast Probe Review Notes

The first comparison I would make is `explainability` against `feature drift` because it shows where the rule is most opinionated.

## Working Pieces

- `fixtures/domain_review.csv` adds cases for feature drift and window width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/watch-model-forecast-walkthrough.md` walks through the case spread.
- The Haskell code includes a review path for `explainability` and `feature drift`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Design Notes

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Haskell addition stays small enough to inspect in one sitting.

## Example Run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Known Limits

No external service is required. A deeper version would add more negative cases and a clearer boundary around invalid input.

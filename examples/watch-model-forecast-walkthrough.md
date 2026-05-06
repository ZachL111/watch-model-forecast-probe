# Watch Model Forecast Probe Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | feature drift | 202 | ship |
| stress | window width | 158 | ship |
| edge | metric stability | 183 | ship |
| recovery | explainability | 204 | ship |
| stale | feature drift | 145 | ship |

Start with `recovery` and `stale`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

If `stale` becomes less cautious without a clear reason, I would inspect the drag input first.

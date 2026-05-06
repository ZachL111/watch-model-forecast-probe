# watch-model-forecast-probe

`watch-model-forecast-probe` is a focused Haskell codebase around create a Haskell reference implementation for forecast workflows, centered on security rule linting, safe and unsafe fixtures, and remediation hints. It is meant to be easy to inspect, run, and extend without a hosted service.

## Watch Model Forecast Probe Walkthrough

I would read the project from the outside in: command, fixture, model, then roadmap. That keeps the ml utilities idea grounded in files that can be checked locally.

## Reason For The Project

I use this kind of project to make a rule visible before adding more machinery around it. The important part here is not the size of the codebase. It is that the input signals, scoring rule, fixture data, and expected output can all be checked in one sitting.

## Capabilities

- Models feature signals with deterministic scoring and explicit review decisions.
- Uses fixture data to keep metric checks changes visible in code review.
- Includes extended examples for windowed behavior, including `recovery` and `degraded`.
- Documents explainable outputs tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## How It Is Put Together

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps feature signals, metric checks, and windowed behavior in one explicit decision path. The threshold is 172, with risk penalty 7, latency penalty 4, and weight bonus 6. The Haskell code keeps the pure scoring function isolated so tests can check it without setup.

## Where Things Live

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Getting It Running

Clone the repository, enter the directory, and run the verifier. No database server, cloud account, or token is required.

## Command Examples

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Check The Work

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Data Notes

`baseline` is the first example I would inspect because it lands on the `review` path with a score of 99. The broader file also keeps `degraded` at -79 and `recovery` at 175, which gives the model a useful low-to-high spread.

## Tradeoffs

This code is local-first. It makes no claim about deployed usage and avoids credentials, hosted state, and environment-specific setup.

## Possible Extensions

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more ml utilities fixture that focuses on a malformed or borderline input.

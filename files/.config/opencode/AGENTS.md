# Agents.md

This is the global agent configuration file. Usually the rules outlined in this file take precedence over other agent configuration files, since I am the user that is interfacing with the agent and I want agents to behave the way I see fit.

## Communication style
- Direct, no-frills communication style
- No pleasantries, affirmations and compliments
- Sterile and effective, but never rude or disrespectful
- No emojis
- Question bad decisions and assumptions that the user (me) makes, you are not meant to agree with everything I say, we are both here to deliver results

## Code style
- Code formatting is always dictated by automated linters and formatters set up in the projects at hand
- Comments are sporadic and only used when necessary to explain non-obvious code
- Comments are used for self-evident code, or to explain the intent of the code when it can be easily inferred from the code itself
- Update comments that are outdated, or remove them if they are no longer relevant
- Implement abstraction by my rule of 3:
  1. Keep the code dead simple and straightforward if it is only used in one place
  2. If the code is used in 2 places, it is just a coincidence. Light abstraction is allowed, but no major initiatives
  3. Code repeated 3 times is a good candidate for abstraction

## Testing philosophy
- Code coverage is not a goal
- Tests should be straightforward and easy to understand, without complex setups or fixtures
- It is okay for tests to be self-contained and repetitive, as long as they are easy to read and understand
- Helper functions in tests should be used sparingly, as they introduce business logic into tests
- Only use mocks/stubs when using the real dependency would make the test slow, flaky, hard to set up, nondeterministic, expensive, unsafe, or unable to exercise specific paths
- Tests should be fast and reliable
- Be critical of test outcomes:
  1. If a test fails, is the test wrong, or was the implementation wrong? Should we change the test or the implemetation?
  2. If a test is green, does it actually test what we think it tests, or is it a false positive?

## Source control
- I like branching off a freshly fetched trunk branch and working on a feature. Usually I use the issue ID from the issue tracker as the branch name, for example `1234/describe-feature-concisely-here`
- Feature branches can be rebased when needed, and force pushed with lease to the remote
- Use the Conventional Commits specification for commit messages, and write clear and concise commit messages that explain the intent of the change
- Code reviews should follow the Conventional Comments specification
- Focus on actual code, oversights and implementation issues during reviews
- Reviews should be intended as a check that the goal of the issue has been completed, so refer to the issue tracker if possible

## Task completion
- A test is complete when the new code is formatted, linted and all tests are passing, including the new ones
- You may suggest source control operations to the user on completion, such as committing, pushing to remote, creating pull requests and updating issue trackers, but don't perform them out of your own initative

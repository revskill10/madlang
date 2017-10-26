BUGS:
  - [ ] scoping/ordering should be handled correctly
  - [ ] show enough precision when displaying tree w/ small probabilities
  - [ ] unpacking fails on 'ç'
LIBRARIES:
  - [ ] English nouns
  - [ ] Place for staging libraries before they're released
  - [ ] Documentation for standard libraries
  - [ ] Bundled libraries with `data-files` field of cabal?
DEFICIENCIES:
  - [ ] linter should be more thorough
  - [ ] Improve circular dependency error message
    - [ ] specify what exactly went wrong
    - [ ] Should include location information
    - [ ] error test suite
  - [ ] dependency management should work better
  - [ ] overlapping categories?
FEATURES:
  - [ ] user-defined modifiers
  - [ ] a "perhaps you meant..." think would be quite nice
  - [ ] index for vim
  - [ ] install `madlang-miso` template for pi?
  - [ ] library/DSL being able to call dependencies
  - [ ] markov chain generator (?)
  - [ ] replication for strings
  - [ ] making (verb) agreement work?
  - [ ] `--explain` flag for error messages
  - [ ] alliteration
  - [ ] generate tagfiles for vim
  - [ ] download from git + add to your libraries
CODE MAINTENANCE:
  - [ ] use prisms for errors
  - [ ] better test suite, e.g. run `madlang install` on Appveyor.
  - [ ] use a catamorphism + better monad for randomness
  - [ ] monorepo w/ main libraries
  - [ ] test suite for error messages
  - [ ] `strip` should be implemented literally any other way than the current
    implementation
  - [ ] self-updating based on github releases!
CI:
  - [ ] appveyor builds (+ tweet needs travis!)
  - [ ] automatic deploys w/ releases
  - [ ] hlint/weeder on travis
DOCUMENTATION:
  - [ ] mention modifiers in the `README.md`
  - [ ] tutorial
  - [ ] paper
  - [ ] documentation generator
  - [ ] example CI

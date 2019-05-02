#+5am (in-package :newport-tests)
#+5am (def-suite tests :description "All tests.")
#+5am (def-suite mandatory :in tests
        :description
        "Tests expected to pass on all systems in order to be approved for upstream.")
#+5am (def-suite broken :in tests
        :description
        "Tests that don't pass, but should.")

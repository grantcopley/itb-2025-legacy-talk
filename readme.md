# Legacy Code: Nightmares, Hellscapes, and Lessons Learned

## Into The Box 2025

This repository contains my code for the "Legacy Code: Nightmares, Hellscapes, and Lessons Learned" session at Into The Box 2025.

After pulling down the repository, you can run the code using the following command using CommandBox:

```bash
box install
box server start
```

These commands will install Boxlang, any dependencies, and start the server. You can then access the application at `http://localhost:55474/` in your web browser.

## Test Suite

As part of the session, I showed how you can write a simple integration test using TestBox before refactoring very problematic legacy code. The test suite is located in the `tests` directory. You can run the tests using the following command:

```bash
box testbox run
```

You can also run the tests in your browser by navigating to `http://localhost:55474/tests` after starting the server. This will give you a nice UI to see the results of the tests.



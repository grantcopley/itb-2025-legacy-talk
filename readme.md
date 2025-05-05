# Legacy Code: Nightmares, Hellscapes, and Lessons Learned

## Into The Box 2025

This repository contains my code for the "Legacy Code: Nightmares, Hellscapes, and Lessons Learned" session at Into The Box 2025.

## Introduction

In this session, I discussed the challenges of working with legacy code and how to approach refactoring it. I shared some of my experiences with legacy code, including the difficulties of understanding and modifying it, and the importance of writing tests to ensure that changes do not break existing functionality.

The idea behind this repo is to show how we can take very problematic legacy code that is stored within the `views/legacy/profile.cfm` view and refactor it into something that is more maintainable and testable. I also wanted to show how we can use Boxlang to make the code more readable and easier to work with.

Take a look at the individual commits in this repo. You will find small comits that I've added to the repo that show the step-by-step process of refactoring the code. Each commit is a small step in the right direction, and I encourage you to take a look at them to see how I approached the problem.

## Installation

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



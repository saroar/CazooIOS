# Cazoo

## Technical overview
- [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture)
- Swift Package Manager
- Modularisation
- Unit tests(Small test for VechilesFeatureTests)

This is a project demonstrating the capabilities of [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture) and Swift Package Manager.
TCA allows developers to fully encapsulate state, actions and environment to control its side effects.

This allows for easier dependency management where we can have more control of what goes where when needed.

Compared to other ways of building and developing applications, TCA allows for building new **Features** in parallel in a big team.
Productivity increases while cognitive load stays at a manageable level.

## Features
- App
- List of Vechiles
- Vechile Details 

## Requirements
You can found inside app PDF file with All Require

### Build
- Xcode 13
- SwiftUI 100%
- Swift 5

### Deployment target
- iOS 15.0

## Why i choose the Composable Architecture?

This library provides a few core tools that can be used to build applications of varying purpose and complexity. It provides compelling stories that you can follow to solve many problems you encounter day-to-day when building applications, such as:

* **State management**
  <br> How to manage the state of your application using simple value types, and share state across many screens so that mutations in one screen can be immediately observed in another screen.

* **Composition**
  <br> How to break down large features into smaller components that can be extracted to their own, isolated modules and be easily glued back together to form the feature.

* **Side effects**
  <br> How to let certain parts of the application talk to the outside world in the most testable and understandable way possible.

* **Testing**
  <br> How to not only test a feature built in the architecture, but also write integration tests for features that have been composed of many parts, and write end-to-end tests to understand how side effects influence your application. This allows you to make strong guarantees that your business logic is running in the way you expect.

* **Ergonomics**
  <br> How to accomplish all of the above in a simple API with as few concepts and moving parts as possible.

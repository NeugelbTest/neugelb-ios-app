# Neugelb iOS App

This repository contains the main iOS application for Neugelb, developed in Swift. The app integrates various internal packages to provide a seamless and efficient user experience. Built with modularity in mind, it utilizes reusable components, optimized network handling, and structured data management to ensure maintainability and scalability.

## Features

- **Movie List & Details**: Displays a simple list of the latest movies from TMDB and provides a detailed view for each movie.

## Submodules

The Neugelb app follows a modular approach to development.

Below you can find the list of modules used in the Neugelb project. All modules are distributed via SPM.

- **Neugelb Network**:
A network layer for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-network)
         
- **Neugelb UI Components**:
A collection of SwiftUI UI components for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-ui-components)
         
- **Neugelb Fonts**:
A collection of fonts for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-fonts)
         
- **Neugelb Images**:
A collection of images and icons for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-images)
         
- **Neugelb Colors**:
A collection of colors for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-colors)
         
- **Neugelb Localized Strings**:
A collection of localized strings for the Neugelb iOS app.
[GitHub](https://github.com/NeugelbTest/neugelb-ios-localized)

## Requirements

- iOS 13.0 or later
- Swift 5.0 or later
- Xcode 12.0 or later

## Installation

Clone the repository and open the project in Xcode:

```sh
git clone https://github.com/NeugelbTest/neugelb-ios-app.git
cd neugelb-ios-app
open NeugelbApp.xcodeproj
```

## App Architecture

The app follows a **modular architecture**, breaking the application into independent and reusable modules. This approach offers several benefits:
- **Scalability**: Modules can be developed, tested, and maintained independently, making it easier to scale the app.
- **Reusability**: Common components, such as UI elements and networking, can be reused across multiple projects.
- **Improved Build Times**: By splitting the project into modules, incremental builds become faster.
- **Better Code Maintainability**: Each module has a clear responsibility, reducing complexity and improving collaboration.

### UIKit Base with SwiftUI
The app is primarily built with **SwiftUI**, leveraging its declarative syntax, efficient UI updates, and seamless integration with modern iOS features. However, the base app is structured with **UIKit**, taking advantage of its powerful navigation system.

- **UIKit Navigation**: UIKit is used to manage navigation efficiently, ensuring a smooth and familiar experience.
- **SwiftUI Benefits**:
  - Simplifies UI development with less boilerplate code.
  - Provides real-time previews for faster UI iteration.
  - Improves accessibility and animation performance.
  - Automatically adapts to different device sizes and themes.

### MVVM with Coordinator Pattern
The app follows the **MVVM (Model-View-ViewModel) architecture**, ensuring a clear separation of concerns:
- **Model**: Represents data and business logic.
- **ViewModel**: Handles UI logic and communicates with models.
- **View**: Displays UI and reacts to ViewModel updates.

To simplify navigation, the app implements the **Coordinator Pattern**:
- **Why Coordinator?** The app is relatively simple, making Coordinator a great choice for managing navigation without adding unnecessary complexity.
- **Easy to Implement & Understand**: Coordinators provide a clear structure for handling navigation, making it easier to manage and extend the app.
- **Decoupling Navigation Logic**: Keeps navigation logic separate from UI components, improving maintainability.

## Future Improvements

- **CI/CD Enhancements**: Further improve automation by refining build, test, and deployment workflows.
- **More Unit Tests**: Although high code coverage is not the only measure of reliability, I will ensure that the entire codebase is covered by tests to improve maintainability and prevent regressions.
- **Performance Optimizations**: Enhance app performance by optimizing network calls, UI rendering, and memory management.
- **Documentation Improvements**: Add detailed API usage examples and developer guidelines.

         
## Time Effort
* **Total time invested**: Approximately 25 hours.
* **Planning**: Conceptualizing tasks, defining the modular structure, and setting up the project: ~1 hour.
* **Data Layer**: Implementing API calls, caching strategies, and handling local storage: ~5 hours.
* **Domain Logic**: Developing business logic, dependency management, and optimizing performance: ~5 hours.
* **ViewModels & SwiftUI Views**: Designing UI logic, implementing dynamic components, and handling state management: ~10 hours.
* **Navigation & Coordinator Implementation**: Setting up and managing navigation using the Coordinator pattern: ~2 hours.
* **Review & Testing**: Refactoring code, fixing bugs, writing unit tests, and documenting: ~2 hour.

# clean-architecture-swiftui
CharacterExplorer-RickAndMorty SampleApp built in swiftui using clean architecture and MVVM design pattern

# SwiftUI-CleanMVVM-SampleApp
CharacterExplorer-RickAndMorty SampleApp built in swiftui using  clean architecture and MVVM design pattern

# CleanMVVM Project

A SwiftUI-based application demonstrating the **Clean Architecture** and **MVVM** design pattern for fetching and displaying character data from an API. This project focuses on modularity, scalability, and testability while showcasing modern SwiftUI and Combine features.

---

## Features

- **Character Listing**: Displays a paginated list of characters with their details.
- **Character Details**: Shows detailed information about a selected character.
- **Error Handling**: Graceful error handling for API failures.
- **Pagination**: Automatically loads more characters when the user scrolls to the end of the list.
- **Loading States**: Loading indicators for both full-screen and paginated fetches.
- **Clean Architecture**: Separation of concerns using the Clean Architecture principles.
- **Unit Testing**: Well-tested ViewModels with mocked dependencies.

---

## Technology Stack

- **Language**: Swift
- **Frameworks**: 
  - SwiftUI: Modern UI framework for building responsive user interfaces.
  - Combine: Reactive programming for handling asynchronous events.
- **Third-party Libraries**:
  - `SDWebImageSwiftUI`: Efficient asynchronous image loading.
- **Architecture**: Clean Architecture with MVVM design pattern.

---

## Project Structure

```
CleanMVVM/
├── Data/
│   ├── Models/        # Data models like `Character`
│   ├── Repositories/  # Repositories for API calls
├── Domain/
│   ├── Entities/      # Core domain entities
│   ├── UseCases/      # Use cases, e.g., FetchCharactersUseCase
├── Presentations/
│   ├── Views/         # SwiftUI views like CharactersView, CharacterDetailView
│   ├── ViewModels/    # ViewModels like CharactersViewModel
├── Resources/         # Assets and Constants
└── Tests/             # Unit and UI test cases
```

---

## Installation and Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/CleanMVVM.git
   ```
2. Open the project in Xcode:
   ```bash
   cd CleanMVVM
   open CleanMVVM.xcodeproj
   ```
3. Run the project on the simulator or a real device:
   - Ensure you have Xcode 15 or higher installed.
   - Use `Cmd + R` to build and run.

---

## Usage

1. **View Character List**: Launch the app to see a paginated list of characters.
2. **Character Details**: Tap on any character to navigate to the detailed view.
3. **Error Handling**: If the API fails, an error message will appear.

---

## Unit Testing

- Run all tests using:
  ```bash
  Cmd + U
  ```
- Test coverage includes:
  - **ViewModels**: Ensuring business logic functions as expected.
  - **Use Cases**: Verifying domain interactions.

Example Test Case:

- **Failure Handling**: Ensure the `errorMessage` is updated when API requests fail.

```swift
func testLoadMoreCharactersFailure() {
    // Arrange: Set up mock dependencies to return an error.
    let mockUseCase = MockFetchCharactersUseCase()
    mockUseCase.shouldReturnError = true
    viewModel = CharactersViewModel(fetchCharactersUseCase: mockUseCase)
    
    // Act: Trigger the loadMoreCharacters method.
    viewModel.loadMoreCharacters()
    
    // Assert: Check that the error message is correctly set.
    XCTAssertEqual(viewModel.errorMessage, "Failed to load characters")
}
```

---

## UI Testing

- Launch `CharacterDetailView` on tap:
  ```swift
  func testCharacterDetailLaunchOnTap() {
      let app = XCUIApplication()
      app.launch()
      let firstCell = app.tables["CharactersList"].cells.firstMatch
      XCTAssertTrue(firstCell.exists)
      firstCell.tap()
      XCTAssertTrue(app.staticTexts["CharacterDetailView"].exists)
  }
  ```

---

## Future Enhancements

- Add support for filtering and sorting characters.
- Implement offline caching for characters.
- Improve UI animations and transitions.

---

## Acknowledgments

- **API**: [Rick and Morty API](https://rickandmortyapi.com/) for character data.
- **SDWebImageSwiftUI**: For image caching and async loading.
  
--- 

#  LearningPA
A modern learning progress and achievement app built with SwiftUI.

---

## Requirements
- macOS with Xcode 18+
- iOS 18.0+ deployment target
- Internet connection (to load package dependencies)


## Setup Instruction
1. Clone the repository
2. Open the project: open LearningPA.xcodeproj
3. Wait on internet a sec, to Install dependencies
   - Dependencies are managed via Swift Package Manager
   - Xcode will automatically resolve packages on first open
4. Build project: `Cmd + B`
5. Select a simulator or device
   - Choose an iOS 18+ simulator or a physical device
6. Run the app: Press ▶︎ or use `Cmd + R`


## App Architecture
LearningPA follows a MVVM (Model–View–ViewModel) architecture aligned with SwiftUI best practices.
1. Model
- Pure data structures and domain models, No UI or business logic
- Examples: UserData
2. View
- SwiftUI views responsible only for rendering UI
- Examples: DashboardView
3. ViewModel
- Handles business logic and state transformations, Exposes observable state to views
- Examples: DashboardViewModel


## State Management
- Uses SwiftUI’s modern tools:
  - `@State`
  - `@Environment`
  - `@Observable`
  - `@AppStorage`
- Shared app-wide state (e.g. `UserData`) is injected via the environment


## Figma Design Guide
- Design Guide [Figma](https://www.figma.com/design/kGNoaeVy0jw09PNnfLOJ0J/Mobile-engineer-task?node-id=224-228&t=foTxzATogDE5HRWw-0)


## Project Info
- Swift UI
- iOS 18.0+


## Branches
- main


## Packages
- GoogleSignIn: Enables authentication using Google accounts.

## Demo Video
- Google Drive [Link](https://drive.google.com/file/d/1kSdlS6sW4ALkGb_C6oGZ9xxy5ZWlq9NH/view?usp=share_link)


## Views
- Splash
- Login
- Dashboard
- Acheivement
- Learning
- Coming Soon

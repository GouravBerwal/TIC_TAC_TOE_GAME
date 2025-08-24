
A simple, clean **Tic-Tac-Toe** game built with **SwiftUI**, converted from my original **HTML + CSS + JavaScript** version.

- 3×3 grid with "O" and "X" alternating turns  
- Instant win detection with all classic patterns  
- Draw detection  
- Overlay with the result and a **New Game** button  
- Visual style closely matches the web version

## 🧠 How it works (Quick)
- The board is a 9-element array of `String` (`""`, `"O"`, `"X"`).
- `turnO` toggles turns.
- All winning triplets (rows, columns, diagonals) are checked after every move.
- If someone wins, a message overlay appears; if all 9 moves are made with no winner, it’s a draw.

## 🛠 Tech Stack
- Swift 5.9+  
- SwiftUI  
- Xcode 15+  
- iOS 17+ target (can be lowered if you adjust the project settings)

## 🚀 Run Locally
1. Open the project in **Xcode**.
2. Build & Run on **iOS Simulator** or a real device.

If you’re adding just the view file:
- Create a new SwiftUI iOS App project.
- Replace `ContentView.swift` with the code from this repo.
- Run.

## 📁 Project Structure (minimal)
```

TicTacToeSwiftUI/
├─ TicTacToeSwiftUI.xcodeproj
├─ TicTacToeSwiftUI/
│  ├─ ContentView\.swift
│  └─ TicTacToeSwiftUIApp.swift
└─ README.md

```

## 🤖 About AI Assistance
I originally built this game in **HTML, CSS, and JavaScript**.  
I then provided that code to an AI assistant, which helped me convert the project to **SwiftUI** and refine the native iOS UI/UX.  
All logic and structure were reviewed and tested by me.


## 🙌 Credits
- Original Web Version: Built by me in HTML/CSS/JS  
- SwiftUI Conversion: AI-assisted + my testing & tweaks

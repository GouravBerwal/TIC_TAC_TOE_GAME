import SwiftUI

struct ContentView: View {
    // Each box has a value: "O", "X", or empty
    @State private var boxes: [String] = Array(repeating: "", count: 9)
    @State private var turnO: Bool = true
    @State private var message: String = ""
    @State private var showMessage: Bool = false
    @State private var count: Int = 0
    
    // Winning combinations
    let winPatterns: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8], // rows
        [0,3,6],[1,4,7],[2,5,8], // columns
        [0,4,8],[2,4,6]          // diagonals
    ]
    
    var body: some View {
        ZStack {
            Color(red: 158/255, green: 183/255, blue: 229/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("TIC_TAC_TOE 🧩")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 3/255, green: 4/255, blue: 94/255))
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.86))
                
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    ForEach(0..<9) { index in
                        Button(action: {
                            boxTapped(index)
                        }) {
                            Text(boxes[index])
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(Color(red: 61/255, green: 11/255, blue: 55/255))
                                .frame(width: 100, height: 100)
                                .background(Color(red: 237/255, green: 242/255, blue: 239/255))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .disabled(boxes[index] != "" || showMessage)
                    }
                }
                .frame(width: 330, height: 330)
                
                Spacer()
                
                Button(action: resetGame) {
                    Text("Reset Game")
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                        .frame(width: 180)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                Spacer()
            }
            
            if showMessage {
                VStack(spacing: 20) {
                    Text(message)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.yellow)
                    Button(action: resetGame) {
                        Text("New Game")
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                            .frame(width: 180)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.7))
            }
        }
    }
    
    func boxTapped(_ index: Int) {
        if boxes[index] == "" {
            boxes[index] = turnO ? "O" : "X"
            turnO.toggle()
            count += 1
            if checkWinner() {
                showMessage = true
            } else if count == 9 {
                message = "Game was a Draw."
                showMessage = true
            }
        }
    }
    
    func checkWinner() -> Bool {
        for pattern in winPatterns {
            let pos1 = boxes[pattern[0]]
            let pos2 = boxes[pattern[1]]
            let pos3 = boxes[pattern[2]]
            
            if pos1 != "" && pos1 == pos2 && pos2 == pos3 {
                message = "Congratulations, Winner is \(pos1)"
                return true
            }
        }
        return false
    }
    
    func resetGame() {
        boxes = Array(repeating: "", count: 9)
        turnO = true
        count = 0
        message = ""
        showMessage = false
    }
}

#Preview {
    ContentView()
}



//
//  AddHobbyView.swift
//  HobbyTracker
//
//  Created by Romerico David on 9/29/24.
//

import SwiftUI

struct AddHobbyView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var hobbies: [Hobby]
    @State private var hobbyName: String = ""
    @State private var selectedEmoji: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    let emojis = ["📚", "🏊‍♀️", "🎮", "🍳", "✈️", "🎨", "💃", "🌱", "🏃‍♂️", "✍️", "📷", "🎧", "🎸", "🎤", "🎬", "🏀", "🏈", "⚽️", "🏐", "🎾"]
    
    var body: some View {
        VStack {
            // HStack for the 'X' button at the top
            HStack {
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            TextField("Add new Hobby", text: $hobbyName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
                .padding(.horizontal)
            
            Picker("Select an Emoji", selection: $selectedEmoji) {
                Text("Select an Emoji").tag("")
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji).tag(emoji)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .shadow(radius: 1)
            .padding(.horizontal)
            
            Button(action: {
                let trimmedName = hobbyName.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Check for duplicates (case-insensitive)
                if hobbies.contains(where: { $0.name.caseInsensitiveCompare(trimmedName) == .orderedSame }) {
                    alertMessage = "This hobby has already been added."
                    showAlert = true
                } else {
                    hobbies.append(Hobby(name: trimmedName, emoji: selectedEmoji))
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Submit")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .background(isValidInput() ? Color.blue : Color.gray)
            .cornerRadius(8)
            .disabled(!isValidInput())
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(Color(red: 245/255, green: 245/255, blue: 220/255).ignoresSafeArea()) // beige-colored background
        .alert(isPresented: $showAlert) {
           Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .cancel())
       }
    }
    
    // Helper function to check if the input is valid length
    private func isValidInput() -> Bool {
        let trimmedName = hobbyName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedName.count >= 3 && trimmedName.count <= 16 && !selectedEmoji.isEmpty
    }
}

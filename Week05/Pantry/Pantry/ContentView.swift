//
//  ContentView.swift
//  Pantry
//
//  Created by Stella Wang on 10/8/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username: String = ""
    @AppStorage("loggedIn") var loggedIn: Bool = false
    
    @State private var showNameInput: Bool = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cream.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Welcome, \(username)")
                        .font(.system(size: 32, weight: .bold, design: .monospaced))
                    HStack {
                        if !loggedIn {
                            Button("Log in") {
                                showNameInput = true
                                username = "Guest"
                                loggedIn = true
                            }
                            .padding(10)
                            .foregroundStyle(Color.cream)
                            .background(Color.ocean)
                            .cornerRadius(15)
                            .font(.system(size: 16, design: .monospaced))
                        }
                        if loggedIn {
                            Button("Log out") {
                                username = "Guest"
                                loggedIn = false
                            }
                            .padding(10)
                            .foregroundStyle(Color.cream)
                            .background(Color.ocean)
                            .cornerRadius(15)
                            .font(.system(size: 16, design: .monospaced))
                        }
                    }
                    if loggedIn {
                        NavigationLink(destination: PantryView().navigationBarBackButtonHidden()) {
                            Text("Enter pantry")
                                .padding(15)
                                .foregroundStyle(Color.cream)
                                .background(Color.darkOcean)
                                .cornerRadius(20)
                                .font(.system(size: 20, design: .monospaced))
                        }
                    }
                    Spacer()
                }
            }
        }
        .overlay() {
            if showNameInput {
                Color.autumn.ignoresSafeArea()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                VStack {
                    Text("What is your name?")
                        .padding(15)
                        .foregroundStyle(Color.cream)
                        .font(.system(size: 20, design: .monospaced))
                    TextField("Name", text: $username)
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    HStack {
                        Button("Cancel") {
                            showNameInput = false
                            loggedIn = false
                            username = "Guest"
                        }
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        Button("Confirm") {
                            showNameInput = false
                            //username = "Guest"
                            loggedIn = true
                        }
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

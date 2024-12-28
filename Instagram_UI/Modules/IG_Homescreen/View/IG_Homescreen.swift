//
//  IG_Homescreen.swift
//  Instagram_UI
//
//  Created by jo on 25/12/24.
//


import SwiftUI

struct IG_Homescreen: View {
    @StateObject var userviewmodel = UserViewModel()
    
    let adaptive: [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea() // Background color
               
                VStack {
                    ScrollView {
                        // IG_Story view -> section
                        VStack(spacing: 0) {
                            Divider()
                                .padding(.bottom, -30)
                            
                            Section {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach(userviewmodel.users) { user in
                                            IG_storyview(isLive: user.online,
                                                         isStoryPosted: .constant(true),
                                                         user_name: user.name)
                                                .frame(width: 62, height: 82)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 15)
                                        }
                                    }
                                }
                            }
                            
                            Divider()
                                .padding(.bottom, 10)
                        
                            // Second section
                            Section {
                                ScrollView {
                                    LazyVStack {
                                        ForEach(1...10, id: \.self) { _ in
                                            IG_postview()
                                            Divider()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Instagram Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .accessibilityLabel("Instagram Logo")
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            print("Camera tapped")
                        }) {
                            Image("camera")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Camera")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Messages tapped")
                        }) {
                            Image("IGTV")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Messages")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Messages tapped")
                        }) {
                            Image("paperplane")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Messages")
                        }
                    }
                }
            }
            .onAppear {
                userviewmodel.loadUsers()
                
            }
        }
    }
}


#Preview {
    IG_Homescreen()
}

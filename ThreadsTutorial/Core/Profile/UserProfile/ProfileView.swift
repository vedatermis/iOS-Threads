//
//  ProfileView.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 28.08.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
        
    var body: some View {
            ScrollView(showsIndicators: false) {
                // Bio And Stats
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: user)
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    // User content listview
                    UserContentListView(user: user)

                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}

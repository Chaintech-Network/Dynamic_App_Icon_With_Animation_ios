//
//  ContentView.swift
//  ChangeAppIcons
//
//  Created by Puneet Bhagat02 on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("icon") var selectedIcon: String = "chaintech-logo-01"
    
    @State private var isPresentAppIconsList: Bool = false
    
    var body: some View {
        Button {
            isPresentAppIconsList = true
        } label: {
            VStack {
                if selectedIcon == "Animate\nicon" {
                    VStack {
                        Text("Note:- ")
                            .font(.system(size: 18).bold())
                            .foregroundStyle(.black)
                        +
                        Text("Closing the app. Animation will begin in 3 seconds.")
                            .font(.system(size: 18))
                            .foregroundStyle(.black)
                        Text("Animation\nicon")
                            .font(.system(size: 18).bold())
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 100)
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .bottom))
                            .cornerRadius(6)
                        
                    }
                } else {
                    Image(uiImage: UIImage(named: selectedIcon) ?? UIImage())
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                }
                Text("Change App icon")
                    .font(.system(size: 18).bold())
            }
        }
        .sheet(isPresented: $isPresentAppIconsList, content: {
            AppIconsListView()
                .presentationDetents([.medium])
                .presentationCornerRadius(21)
        })

    }

}

#Preview {
    ContentView()
}

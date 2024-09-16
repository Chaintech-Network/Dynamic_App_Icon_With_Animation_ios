//
//  AppIconsListView.swift
//  ChangeAppIcons
//
//  Created by Puneet Bhagat02 on 01/08/24.
//

import SwiftUI

struct AppIconsListView: View {
    
    @AppStorage("icon") var selectedIcon: String = "chaintech-logo-01"
    
    @Environment(\.dismiss) var dismiss
    let animator: IconAnimatorHandler = IconAnimatorHandler()
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
  
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
               
                Text("App icons")
                    .font(.system(size: 22).bold())
                
                ScrollView(showsIndicators: false) {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<animator.iconNames.count, id: \.self) { index in
                            let iconName = animator.iconNames[index]
                            Image(uiImage: UIImage(named: iconName) ?? UIImage())
                                .resizable()
                                .frame(width: geometry.size.width / 3 - 30, height: 100)
                                .cornerRadius(6)
                                .onTapGesture {
                                    animator.changeAppIcon(to: iconName) {
                                        selectedIcon = iconName
                                        dismiss()
                                    }
                                    
                                }
                        }
                        Button {
                            animator.performIconAnimation()
                            dismiss()
                            selectedIcon = "Animate\nicon"
                        } label: {
                            VStack {
                                Text("Animate\nicon")
                                    .font(.system(size: 18).bold())
                                    .foregroundStyle(.white)
                            }
                            .frame(minWidth: geometry.size.width / 3 - 30, minHeight: 100)
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .bottom))
                            .cornerRadius(6)
                        }
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.horizontal)
                
            }
            .padding(.vertical)
        })
    }
   
}

#Preview {
    AppIconsListView()
}

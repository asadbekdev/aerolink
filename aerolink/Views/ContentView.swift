//
//  ContentView.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
        
        var body: some View {
            ZStack(alignment: .bottom) {
                // Main content view based on selected tab
                VStack {
                    Spacer()
                    
                    if selectedTab == 0 {
                        StoreView()
                    } else if selectedTab == 1 {
                        Text("My eSIMs")
                    } else {
                        Text("Profile")
                    }
                    
                    Spacer()
                }
                .padding(0)
                .edgesIgnoringSafeArea(.all)
                
                // Custom tab bar
                HStack(alignment: .firstTextBaseline) {
                    Spacer().frame(width: 55)
                    
                    CustomTabItem(
                        image: "shoppingbag",  inactiveImage: "unfill_shoppingbag", imageSize: 24, text: "Store", isSelected: selectedTab == 0,
                        action: { selectedTab = 0 },
                        padding: 5
                    )
                    
                    Spacer()
                    
                    CustomTabItem(
                        image: "applogo", inactiveImage: "unfill_applogo", imageSize: 44, text: "My eSIMs", isSelected: selectedTab == 1,
                        action: { selectedTab = 1},
                        padding: 8
                    )
                    
                    Spacer()
                    
                    CustomTabItem(
                        image: "circleperson", inactiveImage: "unfill_circleperson",  imageSize: 24, text: "Profile", isSelected: selectedTab == 2,
                        action: { selectedTab = 2 },
                        padding: 5
                    )
                    
                    Spacer().frame(width: 55)
                }
                .padding(.bottom, 12)
                .frame(height: 100)
                .background(Color.white)
            }
            .padding(.bottom, 0)
            .edgesIgnoringSafeArea(.bottom)
        }
}

struct CustomTabItem: View {
    let image: String
    let inactiveImage: String
    let imageSize: CGFloat
    let text: String
    let isSelected: Bool
    let action: () -> Void
    let padding: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            if(isSelected){
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageSize, height: imageSize)
            } else{
                Image(inactiveImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageSize, height: imageSize)
                
            };
            
            Spacer().frame(height: padding)
            
            Text(text)
                .font(.customSize(10))
                .foregroundColor(isSelected ? .black : .customGray)
                .frame(alignment: .bottom)
            
        }
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ContentView()
}

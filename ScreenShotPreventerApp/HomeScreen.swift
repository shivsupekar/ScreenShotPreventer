//
//  ContentView.swift
//  ScreenShotPreventerApp
//
//  Created by Shivam on 01/02/26.
//

import SwiftUI

struct HomeScreen: View {
    @State private var preventScreenshot: Bool = true
    var body: some View {
        NavigationStack{
            List {
                Section("API Keys"){
                    Text("123_456_7890abcdef")
                        .monospaced()
                }
                Section("Server Key"){
                    Text("Bh1234_5678_90ABCDEF")
                        .monospaced()
                }
                Toggle("Prevent ScreenShot", isOn: $preventScreenshot)
            }
            .navigationTitle("Confidential Data")
            
        }
        .mask {
           ScreenShotPreventerMask()
                .ignoresSafeArea()
        }
        .background(
            ContentUnavailableView(
                "Not Allowed",
                image: "iphone.slash",
                description: Text("Taking screenshots is not allowed for security reasons."))
        )
        .screenShotPreventerMask(preventScreenshot)
    }
}
extension View {
    @ViewBuilder
    func screenShotPreventerMask(_ isEnabled: Bool) -> some View {
        self
            .mask {
                Group{
                    if isEnabled{
                        ScreenShotPreventerMask()
                    }
                    else{
                        Rectangle()
                    }
                }
                .ignoresSafeArea()
            }
    }
}

#Preview {
    HomeScreen()
}

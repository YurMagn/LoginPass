//
//  ContentView.swift
//  Login
//
//  Created by Татьяна Магнушевская on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        if !viewModel.authenticated {
            LoginView(viewModel: viewModel)
        } else {
            VStack {
                Text("Hello, \(viewModel.user.name)!")
                    .font(.largeTitle)
                Button("Log Out") {
                    viewModel.logOut()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

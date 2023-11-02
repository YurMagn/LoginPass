//
//  LoginView.swift
//  Login
   

import SwiftUI

struct LoginView: View {
    @Bindable var viewModel: LoginViewModel
   
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.03)
                .ignoresSafeArea()
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 100)
                VStack(spacing: 15) {
                    TextField("Username", text: $viewModel.user.name)
                        .customStyle()
                    SecureField("Password", text: $viewModel.user.password)
                        .customStyle()
                }
                .padding()
                
                ButtonView(isDisabled: viewModel.isLoginButtonDusabled) {
                    viewModel.login()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}

struct TFStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func customStyle() -> some View {
        modifier(TFStyleViewModifier())
    }
}


struct ButtonView: View {
    let isDisabled: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Text("Sing In")
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
        
                .frame(width: 300, height: 60)
                .background(
                    LinearGradient(
                        colors: isDisabled
                        ? [.gray.opacity(0.6)]
                        : [.orange, .blue.opacity(0.5)],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(isDisabled)
        })
    }
}



#Preview {
    ContentView()
}

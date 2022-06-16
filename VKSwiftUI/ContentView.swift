//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Tim on 16.06.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var login = ""
    @State var password = ""
    @State var shouldShowLogo = true
    
    private let keyboardPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification in true } ,
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { notification in false }
    ).eraseToAnyPublisher()
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            
            ScrollView {
                
                VStack {
                    
                    if self.shouldShowLogo {
                        Image("logo")
                            .resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 40)
                    }
       
                    VStack(alignment: .leading)  {
                        
                        Text("Phone number or e-mail:")
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .foregroundColor(.white)
                        
                        TextField("login", text: $login)
                            .frame(maxWidth: 200)
                        
                        Text("Enter Password:")
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .foregroundColor(.white)
                        
                        TextField("password", text: $password)
                            .frame(maxWidth: 200)
                    }
                    .padding(.top, 20)
                    
                    HStack {
                        Button {
                            print("Login Pressed")
                        } label: {
                            Label("Log in", systemImage: "chevron.right.circle")
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .disabled(self.login.isEmpty || self.password.isEmpty)
                        
                        Button {
                            print("Cancel Pressed")
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                        }
                        .foregroundColor(.white)
                        .disabled(self.login.isEmpty || self.password.isEmpty)
                    }
                    .padding(.top, 20)
                    
                    Text("No account yet?")
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                        .foregroundColor(.white)
                    
                    Button {
                        print("Register Pressed")
                    } label: {
                        Label("Registration", systemImage: "chevron.right.circle")
                            .frame(maxWidth: 180)
                    }
                    
                    .foregroundColor(.white)
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
                .frame(maxWidth: 350)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .onReceive(self.keyboardPublisher) { isKeyboardShow in
            withAnimation(.easeIn(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardShow
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Hoda Elnaghy on 08/06/2024.
//

import SwiftUI

public struct SouhoolaTextField: View {
    @State public var name: String = ""
    @Binding public var showError: Bool
    @Binding public var verified: Bool
    @Binding public var errorMessage: String?
    public let placeholderText: String
    
    private enum Constant {
        static let verticalSpacing: CGFloat = 8
        static let padding: CGFloat = 16
        static let textFieldHeight: CGFloat = 48
        static let cornerRadius: CGFloat = 6
        static let stokeWidth: CGFloat = 1
    }
    
    public init(name: String, showError: Bool, verified: Bool, errorMessage: String? = nil, placeholderText: String) {
        self.name = name
        self.showError = showError
        self.verified = verified
        self.errorMessage = errorMessage
        self.placeholderText = placeholderText
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Constant.verticalSpacing) {
            HStack {
                TextField(placeholderText, text: $name)
                    .padding(.horizontal, Constant.padding)
                if showError {
                    Image(SouhooleImages.textFieldError.imageName)
                    
                        .padding(.trailing, Constant.padding)
                } else if verified {
                    Image(SouhooleImages.checkMark.imageName)
                        .padding(.trailing, Constant.padding)
                }
                
            }
            .frame(height: Constant.textFieldHeight, alignment: .center)
            
            .background(
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .fill(SouhoolaColors.textFieldColor.color)
                    .overlay(
                        withAnimation {
                            RoundedRectangle(cornerRadius: Constant.cornerRadius)
                                .stroke(showError ? SouhoolaColors.textFieldError.color : Color.clear, lineWidth: Constant.stokeWidth)
                        }
                    )
                
            )
            if showError {
                if let errorMessage = errorMessage {
                    SouhoolaText(.errorText(errorMessage))
                }
            }
            
        }
    }
}

#Preview {
    @State var showError = false
    @State var verified = true
    @State var erroMessage: String? = "Error"
    return SouhoolaTextField(showError: $showError, verified: $verified, errorMessage: $erroMessage, placeholderText: "Enter your name")
}

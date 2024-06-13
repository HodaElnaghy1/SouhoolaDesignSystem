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
    public let isDisabled: Bool
    
    private enum Constant {
        static let verticalSpacing: CGFloat = 8
        static let padding: CGFloat = 16
        static let textFieldHeight: CGFloat = 48
        static let cornerRadius: CGFloat = 6
        static let stokeWidth: CGFloat = 1
    }
    
    public init(showError: Binding<Bool>, verified: Binding<Bool>, errorMessage: Binding<String?>? = nil, placeholderText: String, isDisabled: Bool = false) {
        _showError = showError
        _verified = verified
        _errorMessage = errorMessage ?? Binding.constant(nil)
        self.placeholderText = placeholderText
        self.isDisabled = isDisabled
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Constant.verticalSpacing) {
            HStack {
                TextField(placeholderText, text: $name)
                    .disabled(isDisabled)
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


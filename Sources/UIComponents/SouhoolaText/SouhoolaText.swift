//
//  SwiftUIView.swift
//  
//
//  Created by Hoda Elnaghy on 08/06/2024.
//

import SwiftUI

public struct SouhoolaText: View {
    public let text: SouhoolaText.FontStyle
    init(_ text: SouhoolaText.FontStyle) {
        self.text = text
    }
    public var body: some View {
        Text(text.style.text)
            .foregroundColor(text.style.textColor)
            .font(text.style.textFont)
            .fontWeight(text.style.textFontWeight)
    }
    
    public struct TextStyles {
        var text: String
        var textColor: Color
        var textFont: Font
        var textFontWeight: Font.Weight
    }

    public enum SouhoolaFontSize {
        case h1, h2, h3
        var size: Int {
            switch self {
            case .h1:
                20
            case .h2:
                25
            case .h3:
                14
            
            }
        }
    }
    
    public enum FontStyle {
        case title(String, size: SouhoolaFontSize, color: Color)
        case subTitle(String, size: SouhoolaFontSize, Color: Color)
        case errorText(String)
        
        var style: TextStyles {
            switch self {
            case let .title(text, size, color):
                return TextStyles(text: text, textColor: color, textFont: .custom("Helvetica", size: CGFloat((size.size))), textFontWeight: .bold)
            case let .subTitle(text, size, color):
                return TextStyles(text: text, textColor: color, textFont: .custom("Helvetica", size: CGFloat((size.size))), textFontWeight: .regular)
            case let .errorText(text):
                return TextStyles(text: text, textColor: SouhoolaColors.textFieldError.color, textFont: .custom("Helvetica", size: CGFloat(12)), textFontWeight: .regular)
            }
        }
    }
}

#Preview {
    SouhoolaText(.title("Hello", size: .h1, color: .black))
}

//
//  File.swift
//  
//
//  Created by Hoda Elnaghy on 08/06/2024.
//

import SwiftUI

enum SouhoolaColors: ShapeStyle {
    case textFieldColor
    case textFieldError
    case darkGrey
    var color: Color {
        
        switch self {
            
        case .textFieldColor:
            Color(red: 0.97, green: 0.97, blue: 0.98)
        case .textFieldError:
            Color(red: 241/255, green: 75/255, blue: 62/255)
        case .darkGrey:
            Color(red: 49/255, green: 48/255, blue: 48/255)
        }
    }
}

enum SouhooleImages {
    case textFieldError
    case checkMark
    case camera
    case delete
    var imageName: String {
        switch self {
        case .textFieldError:
            "alert-circle"
        case .checkMark:
            "checkmark"
        case .camera:
            "photo-camera"
        case .delete:
            "delete"
        }
    }
}

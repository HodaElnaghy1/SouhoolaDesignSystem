//
//  SwiftUIView.swift
//  
//
//  Created by Hoda Elnaghy on 08/06/2024.
//

import SwiftUI

struct DocumentUploadView: View {
    @State public var openCameraRoll = false
    @State public var imageName: String = "IMG.jpeg"
    @State public var isImageSelected: Bool = false
    @Binding public var showError: Bool
    @Binding public var errorMessage: String?
    @State public var imageSelected = UIImage()
    public var documentUploadText: String
    
    private enum Constant {
        static let imageHeight: CGFloat = 30
        static let imageWidth: CGFloat = 30
        static let cornerRadius: CGFloat = 6
        static let documentViewHeight: CGFloat = 48
        static let stokeWidth: CGFloat = 1
    }
    
    public init(showError: Binding<Bool>, errorMessage: Binding<String?>? = nil, imageSelected: UIImage = UIImage(), documentUploadText: String) {
        _showError = showError
        _errorMessage = errorMessage ?? Binding.constant(nil)
        self.imageSelected = imageSelected
        self.documentUploadText = documentUploadText
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    if !isImageSelected {
                        SouhoolaText(.subTitle(documentUploadText, size: .h3, Color: .gray))
                        Spacer()
                        Button(action: {
                            openCameraRoll = true
                        }, label: {
                            Image(SouhooleImages.camera.imageName)
                        })
                    } else {
                        HStack {
                            Image(uiImage: imageSelected)
                                .resizable()
                                .frame(width: Constant.imageWidth, height: Constant.imageHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            SouhoolaText(.subTitle(imageName, size: .h3, Color: .gray))
                        }
                        Spacer()
                        Button(action: {
                            isImageSelected = false
                            imageSelected = UIImage()
                        }, label: {
                            Image(SouhooleImages.delete.imageName)
                        })
                        
                    }
                }
                .padding()
                .frame(height: Constant.documentViewHeight, alignment: .center)
                
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
        .sheet(isPresented: $openCameraRoll, onDismiss: {
            
            if imageSelected == UIImage() {
                isImageSelected = false
            } else {
                isImageSelected = true
            }
        }) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    @State var showError = false
    @State var erroMessage: String? = "Error"
    return DocumentUploadView(showError: $showError, errorMessage: $erroMessage, documentUploadText: "Attach front copy of KYC form")
}

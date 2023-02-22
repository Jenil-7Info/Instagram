//
//  OpenGallery.swift
//  Instagram
//
//  Created by SevenInfosystem on 21/01/23.
//


import SwiftUI


struct OpenGallery: UIViewControllerRepresentable {
    
    @Binding var image: UIImage
    
    class Coordinator: NSObject,
            UIImagePickerControllerDelegate,
            UINavigationControllerDelegate {

            var parent: OpenGallery

            init(_ parent: OpenGallery) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = uiImage
                }
                else {
                    debugPrint("Somethings Promblem")
                }
                
                picker.dismiss(animated: true)
            }
        }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<OpenGallery>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
}

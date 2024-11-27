//import SwiftUI
//
//struct AsyncImage: View {
//    let url: URL?
//    let placeholder: Image
//    let errorImage: Image
//    
//    @State private var imageData: Data? = nil
//    @State private var isLoading = true
//    @State private var loadError = false
//    
//    init(url: URL?, placeholder: Image = Image(systemName: "photo"), errorImage: Image = Image(systemName: "exclamationmark.triangle")) {
//        self.url = url
//        self.placeholder = placeholder
//        self.errorImage = errorImage
//    }
//    
//    var body: some View {
//        Group {
//            if let data = imageData, let uiImage = UIImage(data: data) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFill()
//            } else if loadError {
//                errorImage
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(.red)
//            } else {
//                placeholder
//                    .resizable()
//                    .scaledToFit()
//                    .overlay(ProgressView().opacity(isLoading ? 1 : 0))
//            }
//        }
//        .clipShape(Circle())
//        .frame(width: 50, height: 50)
//        .onAppear(perform: loadImage)
//    }
//    
//    private func loadImage() {
//        guard let url = url else {
//            loadError = true
//            isLoading = false
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            DispatchQueue.main.async {
//                isLoading = false
//                if let data = data, error == nil {
//                    self.imageData = data
//                } else {
//                    loadError = true
//                }
//            }
//        }.resume()
//    }
//}

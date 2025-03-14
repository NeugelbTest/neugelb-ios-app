import UIKit
import NeugelbUIComponents

// class DefaultImageService: ImageService {
//
//    func loadImage(from path: String) async -> NeugelbUIComponents.ImageStatus {
//        
//        guard let url = URL(string: path),
//              let folder = url.pathComponents.first else { return .failed }
//        let imageName = url.lastPathComponent
//        //print("folder: \(folder), imageName: \(imageName)")
//
//        guard let image = await getImage(imageName: imageName, folder: folder) else { return .failed }
//        return .success(image)
//    }
//    
//    private func getImage(imageName: String, folder: String) async -> UIImage? {
//        if let savedImage = await LocalFileManager.shared.getImage(imageName: imageName, folderName: folder) {
//            //print("ImageService: Retrieved image from File Manager!")
//            return savedImage
//        } else {
//            print("ImageService: Downloading Image")
//            return await downloadImage(imageName: imageName, folder: folder)
//        }
//    }
//    
//    private func downloadImage(imageName: String, folder: String) async -> UIImage? {
//        guard let data = try? await StorageManager.shared.getImage(folder: folder, id: imageName) else { return nil }
//        guard let image = UIImage(data: data) else { return nil }
//        await LocalFileManager.shared.saveImage(image: image, imageName: imageName, folderName: folder)
//        return image
//    }
//    
//    private func downloadCoinImage() {
//        
//        guard let url = URL(string: coin.image) else { return }
//        
//        imageSubscription = NetworkingManager.download(url: url)
//            .tryMap({ (data) -> UIImage? in
//                 return UIImage(data: data)
//            })
//            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
//                guard let self = self, let downloadedImage = returnedImage else { return }
//                self.image = returnedImage
//                self.imageSubscription?.cancel()
//                self.fileManager.saveImage(image: downloadedImage, imageName: imageName, folderName: folderName)
//            })
//    }
// }

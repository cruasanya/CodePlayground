//
//  ImagesStorageViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 26.06.2024.
//

import Foundation
import SwiftUI
import FirebaseStorage

class ImageStorageViewModel: ObservableObject {
    @Published var imageInfos: [ImageInfo] = []

    func fetchImages(type: ImageType) {
        let storage = Storage.storage()
        let storageRef = storage.reference().child(type.rawValue)

        storageRef.listAll { (result, error) in
            if let error = error {
                print("Error fetching images: \(error.localizedDescription)")
                return
            }
            
            if let result = result {
                for item in result.items {
                    item.downloadURL { url, error in
                        if let error = error {
                            print("Error fetching images: \(error.localizedDescription)")
                            return
                        }

                        if let url = url {
                            DispatchQueue.main.async {
                                self.imageInfos.append(ImageInfo(name: item.name, url: url))
                            }
                        }
                    }
                }

            }
        }
    }

    func freeSotrage() {
        self.imageInfos.removeAll()
    }
}

struct ImageInfo: Hashable {
    var name: String
    var url: URL

    init(name: String, url: URL) {
        self.name = name.replacingOccurrences(of: ".png", with: "")
        self.url = url
    }
}

enum ImageType: String {
    case characters = "characters"
    case background = "backgrounds"
}

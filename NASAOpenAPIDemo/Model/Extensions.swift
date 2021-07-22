//
// Created by 楊朝富 on 2021/7/22.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func loadUrl(url: String, onLoadingCompleted loadingCompleted: @escaping () -> Void) {
        if let image = imageCache.object(forKey: url as NSString) as? UIImage {
            self.image = image
            loadingCompleted()
            return
        }

        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data: Data?, response: URLResponse?, error: Error?) -> () in
            if let data = data, error == nil {
                let image = UIImage(data: data)!
                imageCache.setObject(image, forKey: url as NSString)
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                    loadingCompleted()
                }
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
        task.resume()

    }

}

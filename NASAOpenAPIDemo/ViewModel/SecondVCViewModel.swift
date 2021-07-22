//
//  SecondVCViewModel.swift
//  NASAOpenAPIDemo
//
//  Created by 楊朝富 on 2021/7/21.
//
//

import UIKit

class SecondVCViewModel: NSObject {

    var spaceCellViewModels: [SpaceCellViewModel] = []
    var onRequestEnd:(() -> Void)?

    func getAPODData() {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=PD99Ab4nf3ose9HUzwF7HcEvJRAGzSDO4w1YHdIR&count=50")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> () in
            guard let data = data, error == nil else {
                print("Error when download data")
                return
            }
//            print("Apod origin data = \(String(data: data, encoding: String.Encoding.utf8) ?? "(no result)")")
            let apod = try? JSONDecoder().decode(Apod.self, from: data)

            // Unexpected decode issue
            guard apod != nil else {
                print("Cannot get Data, try again......")
                self.getAPODData()
                return
            }
            print("Success to get data!")
            self.convertToViewModel(array: apod!)
        }
        task.resume()
    }

    private func convertToViewModel(array: [ApodElement]) {
        for apodElement in array {
            spaceCellViewModels.append(SpaceCellViewModel(apodElement: apodElement))
        }
        onRequestEnd!()
    }

}

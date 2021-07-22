//
//  SpaceCellViewModel.swift
//  NASAOpenAPIDemo
//
//  Created by 楊朝富 on 2021/7/22.
//
//

import UIKit

class SpaceCellViewModel: NSObject {
    var apodElement: ApodElement

    init(apodElement: ApodElement) {
        self.apodElement = apodElement
    }
}

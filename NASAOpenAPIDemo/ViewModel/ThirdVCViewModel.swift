//
//  ThirdVCViewModel.swift
//  NASAOpenAPIDemo
//
//  Created by 楊朝富 on 2021/7/22.
//
//

import UIKit

class ThirdVCViewModel: NSObject {

    /// Parse YYYY-MM-DD date string to YYYY MMM DD.
    ///
    /// - Parameter original: YYYY-MM-DD date string, ex: 2021-07-22
    /// - Returns: "YYYY MMM DD" date string. ex: 2021 Jul. 22
    func parseDate(original: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        let originalDate = dateFormatter.date(from: original)

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "YYYY MMM. DD"
        return dateFormatter2.string(from: originalDate!)
    }

}

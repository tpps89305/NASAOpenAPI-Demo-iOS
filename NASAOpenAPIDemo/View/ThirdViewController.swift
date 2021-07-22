//
//  ThirdViewController.swift
//  NASAOpenAPIDemo
//
//  Created by 楊朝富 on 2021/7/22.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageHD: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!

    var apodElement: ApodElement?
    let viewModel = ThirdVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelDate.text = viewModel.parseDate(original: apodElement?.date ?? "")
        imageHD.loadUrl(url: apodElement?.url ?? "", onLoadingCompleted: {
            // Do nothing
        })
        labelTitle.text = apodElement?.title
        labelDesc.text = apodElement?.explanation
    }

}

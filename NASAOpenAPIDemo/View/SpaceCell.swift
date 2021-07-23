//
// Created by 楊朝富 on 2021/7/21.
//

import UIKit

class SpaceCell: UICollectionViewCell {

    @IBOutlet weak var imageSpace: UIImageView!
    @IBOutlet weak var labelSpace: UILabel!
    @IBOutlet weak var widthImageView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(viewModel: SpaceCellViewModel) {
        let apodElement = viewModel.apodElement
        if apodElement.mediaType == "image" {
            imageSpace.loadUrl(url: apodElement.url ?? "") {
                self.setNeedsLayout()
            }
        }
        labelSpace.text = apodElement.title
    }

}

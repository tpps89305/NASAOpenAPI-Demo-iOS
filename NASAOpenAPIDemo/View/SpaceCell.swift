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

        // let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        let width = floor((UIScreen.main.bounds.width - 3 * 3) / 4)
        widthImageView.constant = width
    }

    func setup(viewModel: SpaceCellViewModel) {
        let apodElement = viewModel.apodElement
        imageSpace.loadUrl(url: apodElement.url) {
            self.setNeedsLayout()
        }
        labelSpace.text = apodElement.title
    }

}

//
// Created by 楊朝富 on 2021/7/21.
//

import UIKit

class SecondViewController: UICollectionViewController {

    let viewModel = SecondVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCellSize()
        bindViewModel()
        viewModel.getAPODData()
    }

    func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    func configureCellSize() {
        let itemSpace: CGFloat = 3
        let columnCount: CGFloat = 4
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)

        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace
        flowLayout?.minimumLineSpacing = itemSpace
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.spaceCellViewModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SpaceCell
        cell.setup(viewModel: viewModel.spaceCellViewModels[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoThirdPage", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gotoThirdPage", let destinationVC = segue.destination as? ThirdViewController {
            if let row = collectionView.indexPathsForSelectedItems?[0].row {
                destinationVC.apodElement = viewModel.spaceCellViewModels[row].apodElement
            }
        }
    }

}

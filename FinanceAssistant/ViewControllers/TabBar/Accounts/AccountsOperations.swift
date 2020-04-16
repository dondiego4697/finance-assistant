import UIKit

final class AccountsOperationsViewController: UIViewController {
    
    private var operationsCount = 10
    
    func configure(operationsCount: Int) {
        self.operationsCount = operationsCount
    }
}

extension AccountsOperationsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        operationsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccountOperation.reuseIdentifier,
            for: indexPath
        ) as! AccountOperation
        
        cell.setActionStyle()
        cell.setActionData()

        return cell
    }
}

extension AccountsOperationsViewController: UICollectionViewDelegate {}

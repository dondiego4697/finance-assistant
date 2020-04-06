import UIKit

final class AccountsActionsViewController: UIViewController {
    
    private var actionsCount = 0
    
    func configure(actionsCount: Int) {
        self.actionsCount = actionsCount
    }
}

extension AccountsActionsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        actionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccountAction.reuseIdentifier,
            for: indexPath
        ) as! AccountAction
        
        cell.setActionStyle()
        cell.setActionData()

        return cell
    }
}

extension AccountsActionsViewController: UICollectionViewDelegate {}

import UIKit

final class AccountsCardsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var lastVisibleIndexPath = IndexPath(row: 0, section: 0)

    private var accounts: [Account] = []
        
    func configure(with accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsCardsViewController: UICollectionViewDataSource, AccountCardDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        accounts.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccountCard.reuseIdentifier,
            for: indexPath
        ) as! AccountCard
        
        cell.delegate = self

        cell.setCardStyle()
        cell.setCardShadow()
        cell.setCardData(account: accounts[indexPath.section])
        
        return cell
    }
    
    func getCollectionViewBounds() -> CGRect {
        return self.collectionView.bounds
    }
}

extension AccountsCardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        print("asdasdasd")
        let totalCellWidth = collectionView.bounds.width * CGFloat(self.accounts.count)
        let totalSpacingWidth = 20.0 * CGFloat(self.accounts.count - 1)

        let leftInset = (collectionView.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

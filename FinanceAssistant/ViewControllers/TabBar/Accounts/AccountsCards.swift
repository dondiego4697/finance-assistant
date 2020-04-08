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
    
    func someFunction() -> CGFloat {
        return 0.0
    }
}

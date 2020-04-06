import UIKit

class AccountsCardViewCell: UICollectionViewCell {

    class var reuseIdentifier: String {
        return "AccountsCardViewCellId"
    }

    class var nibName: String {
        return "AccountsCardViewCell"
    }
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

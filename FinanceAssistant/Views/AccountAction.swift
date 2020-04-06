import UIKit

class AccountAction: UICollectionViewCell {
    
    static let reuseIdentifier = "AccountAction"
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var container: UIView!
    
    func setActionStyle() {
        self.container.layer.cornerRadius = 25.0
    }
    
    func setActionData() {
        self.imageIcon.image = UIImage(named: "tab-accounts")!
        self.name.text = "Some action"
    }
}

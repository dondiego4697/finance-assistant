import UIKit

protocol AccountCardDelegate {
    func getCollectionViewBounds() -> CGRect
}

class AccountCard: UICollectionViewCell {    

    static let reuseIdentifier = "AccountCard"
    var delegate: AccountCardDelegate?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var container: UIView!
}

extension AccountCard {
    
    func setCardStyle() {
        self.container.layer.cornerRadius = 15.0
    }
    
    func setCardShadow() {
        self.container.layer.shadowColor = UIColor.black.cgColor
        self.container.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.container.layer.shadowRadius = 1.0
        self.container.layer.shadowOpacity = 0.1
        self.container.layer.masksToBounds = false
    }
    
    func setCardData(account: Account) {
        self.sum.text = "12000.01"
        self.name.text = account.name
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
      
        let bounds = self.delegate?.getCollectionViewBounds()
        if (bounds == nil) {
            return
        }
        
//        let featuredWidth = bounds!.width / 6 * 5
//        let standardWidth = bounds!.width / 6 * 3

//        let delta = 1 - ((featuredWidth - frame.width) / (featuredWidth - standardWidth))
//        self.container.alpha = min(delta + 0.5, 1)
//        let minAlpha: CGFloat = 0.3
//        let maxAlpha: CGFloat = 0.75
      
//        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
      
//        let scale = max(delta, 0.5)
//        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
      
//        timeAndRoomLabel.alpha = delta
//        speakerLabel.alpha = delta
    }
}

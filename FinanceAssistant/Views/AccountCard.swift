import UIKit

protocol AccountCardDelegate {
    func someFunction() -> CGFloat
}

class AccountCard: UICollectionViewCell {    

    static let reuseIdentifier = "AccountCard"
    var delegate: AccountCardDelegate?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var container: UIView!
}

extension AccountCard {
    
    private func setCardGradient() {
        let gradientLayer = CAGradientLayer()
        
        let frame = CGRect(
            origin: self.container.layer.bounds.origin,
            size: CGSize(
                width: self.container.layer.bounds.width - 54,
                height: self.container.layer.bounds.height
            )
        )

        gradientLayer.frame = frame
        gradientLayer.colors = [
            UIColor(named: "item-dark-color")!.cgColor,
            UIColor(named: "item-dark-color-0.8")!.cgColor,
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0.45)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.85)
        gradientLayer.locations = [0.5, 0.35]
        self.container.layer.insertSublayer(gradientLayer, at: 0)
        
        self.container.layer.cornerRadius = 15.0
        let sublayers = self.container.layer.sublayers!
        sublayers[0].cornerRadius = 15.0
    }

    func setCardStyle() {
        setCardGradient()
    }
    
    func setCardShadow() {
        self.container.layer.shadowColor = UIColor.black.cgColor
        self.container.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.container.layer.shadowRadius = 2.0
        self.container.layer.shadowOpacity = 0.1
        self.container.layer.masksToBounds = false
    }
    
    func setCardData(account: Account) {
        self.sum.text = "12000.01"
        self.name.text = account.name
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
      
//        print(self.delegate?.getCollectionItemDiff())
        
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

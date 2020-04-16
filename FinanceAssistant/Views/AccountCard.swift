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
    
    private func setCardShadow() {
        
    }

    func setCardStyle() {
        setCardGradient()
        setCardShadow()
    }

    
    func setCardData(account: Account) {
        self.sum.text = "12000.01"
        self.name.text = account.name
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    }
}

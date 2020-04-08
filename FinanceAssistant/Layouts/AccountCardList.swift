import UIKit

class AccountCardListLayout: UICollectionViewFlowLayout {
    
    private let itemScale: CGFloat = 0.8
    private let itemWidthOffset: CGFloat = 30
    
    var cardWidth: CGFloat {
        return collectionView!.bounds.width - 2 * itemWidthOffset
    }
    
    var lastItemIndex: Int = 0
    var currentItemIndex: Int {
        return getCurrentItemIndex(collectionView!.contentOffset.x)
    }
    
    var numberOfItems: Int {
        return collectionView!.numberOfSections
    }

    private func getCurrentItemIndex(_ currentOffset: CGFloat) -> Int {
        return Int(round(max(currentOffset, 0) / (cardWidth)))
    }
    
    override var collectionViewContentSize: CGSize {
        let contentWidth = cardWidth * CGFloat(numberOfItems)
        return CGSize(width: contentWidth, height: collectionView!.bounds.height)
    }
    
    override func prepare() {
        super.prepare()

        for _ in 0..<numberOfItems {
            if (currentItemIndex != lastItemIndex) {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                lastItemIndex = currentItemIndex
            }
        }

        if collectionView?.decelerationRate != UIScrollView.DecelerationRate.fast {
            collectionView?.decelerationRate = UIScrollView.DecelerationRate.fast
        }

        scrollDirection = .horizontal
        minimumLineSpacing = 0

        guard let collectionView = collectionView else { return }

        itemSize = .init(
            width: cardWidth,
            height: collectionView.bounds.height
        )

        sectionInset = .init(top: 0, left: itemWidthOffset, bottom: 0, right: -2 * itemWidthOffset)
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
    
        var newAttributes: [UICollectionViewLayoutAttributes] = []
        for (_, itemAttributes) in attributes.enumerated() {
            guard let newItemAttributes = updateItemAttributes(itemAttributes) else { continue }
            newAttributes.append(newItemAttributes)
        }
        
        return newAttributes
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView, !collectionView.isPagingEnabled,
            let layoutAttributes = self.layoutAttributesForElements(in: collectionView.bounds) else {
                return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
            }
        
        let midSide = collectionView.bounds.size.width / 2
        let proposedContentOffsetCenterOrigin = proposedContentOffset.x + midSide
        
        let targetContentOffset: CGPoint = {
            let closest = layoutAttributes.sorted {
                abs($0.center.x - proposedContentOffsetCenterOrigin) < abs($1.center.x - proposedContentOffsetCenterOrigin)
            }.first ?? UICollectionViewLayoutAttributes()
            
            return CGPoint(x: floor(closest.center.x - midSide), y: proposedContentOffset.y)
        }()
        
        return targetContentOffset
    }
    
    private func updateItemAttributes(
        _ attributes: UICollectionViewLayoutAttributes
    ) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        
        let collectionHorizontalCenter = collectionView.frame.size.width / 2
        let normalizedHorizontalCenter = attributes.center.x - collectionView.contentOffset.x

        let maxDistance = itemSize.width + minimumLineSpacing
        let distance = min(abs(collectionHorizontalCenter - normalizedHorizontalCenter), maxDistance)
        
        let ratio = (maxDistance - distance) / maxDistance
        let scale = ratio * (1 - itemScale) + itemScale

        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        attributes.center.x = attributes.center.x + (1 - ratio)
        
        return attributes
    }
}

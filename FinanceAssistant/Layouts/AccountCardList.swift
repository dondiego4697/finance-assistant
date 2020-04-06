import UIKit

class AccountCardListLayout: UICollectionViewLayout {
    
    var cache: [UICollectionViewLayoutAttributes] = []
  
    var cardWidth: CGFloat {
        return collectionView!.bounds.width / 3 * 2
    }
    
    var cardHeight: CGFloat {
        return collectionView!.bounds.height
    }
    
    var offset: CGFloat = 20.0
    var firstOffset: CGFloat {
        return collectionWidth / 2 - cardWidth / 2
    }
    
    var collectionWidth: CGFloat {
        return collectionView!.bounds.width
    }
    
    var collectionHeight: CGFloat {
        return collectionView!.bounds.height
    }

    var currentItemIndex: CGFloat {
        return getCurrentItemIndex(collectionView!.contentOffset.x)
    }
    var lastItemIndex: CGFloat = 0
    
    var numberOfItems: Int {
        return collectionView!.numberOfSections
    }
    
    private func getCurrentItemIndex(_ currentOffset: CGFloat) -> CGFloat {
        return round(max(currentOffset, 0) / (cardWidth + offset))
    }
}

extension AccountCardListLayout {
    override var collectionViewContentSize: CGSize {
        let contentWidth = CGFloat(numberOfItems) * cardWidth + CGFloat(numberOfItems) * offset + 2 * firstOffset
        return CGSize(width: contentWidth, height: collectionHeight)
    }
  
    override func prepare() {
        cache.removeAll(keepingCapacity: false)
  
        var frame = CGRect.zero
        var x: CGFloat = 0

        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: 0, section: item)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.zIndex = item
            
            if (currentItemIndex != lastItemIndex) {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                lastItemIndex = currentItemIndex
            }
            
            if (indexPath.section == 0) {
                x = x + firstOffset
            } else if (indexPath.section >= 1) {
                x = x + 20
            } else if indexPath.section == Int(currentItemIndex) {

            }

            frame = CGRect(x: x, y: 0, width: cardWidth, height: cardHeight)
            attributes.frame = frame
      
            cache.append(attributes)
            x = frame.maxX
        }
    }
  
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
  
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        let itemIndex = getCurrentItemIndex(proposedContentOffset.x)
        let xOffset = itemIndex * cardWidth + itemIndex * offset
        
        return CGPoint(x: xOffset, y: 0)
    }
  
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

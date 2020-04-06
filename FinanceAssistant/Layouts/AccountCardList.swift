import UIKit

class AccountCardListLayout: UICollectionViewLayout {
    
    var cache: [UICollectionViewLayoutAttributes] = []
  
    var selectedItemIndex: Int {
        return max(Int(collectionView!.contentOffset.x / standardWidth), 0)
    }
    
    var standardWidth: CGFloat {
        return collectionView!.bounds.width / 6 * 5
    }
    
    var dragOffset: CGFloat {
        return collectionView!.bounds.width / 2
    }
  
    var width: CGFloat {
        return collectionView!.bounds.width
    }
  
    var height: CGFloat {
        return collectionView!.bounds.height
    }
  
    var numberOfItems: Int {
        return collectionView!.numberOfSections
    }
}

extension AccountCardListLayout {
    override var collectionViewContentSize: CGSize {
        let contentWidth = (CGFloat(numberOfItems) * standardWidth)
        return CGSize(width: contentWidth, height: height)
    }
  
    override func prepare() {
        cache.removeAll(keepingCapacity: false)
  
        var frame = CGRect.zero
        var x: CGFloat = 0

        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: 0, section: item)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.zIndex = item
            
            if indexPath.section == selectedItemIndex {
                x = min(collectionView!.contentOffset.x, dragOffset)
                x = -x
            } else if indexPath.section == (selectedItemIndex + 1) && indexPath.section != numberOfItems {
                
            }

            frame = CGRect(x: x, y: 0, width: standardWidth, height: height)
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
        let itemIndex = round(proposedContentOffset.x / standardWidth)
        let xOffset = itemIndex * standardWidth
        return CGPoint(x: xOffset, y: 0)
    }
  
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

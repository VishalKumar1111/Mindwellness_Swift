import UIKit

class CardsCollectionViewLayout: UICollectionViewLayout {
    // MARK: - Layout configuration
    
    public var spacing: CGFloat = 10.0 {
        didSet{
            invalidateLayout()
        }
    }
    
    public var maximumVisibleItems: Int = 4 {
        didSet{
            invalidateLayout()
        }
    }
    
    public var alignment = Alignment.centerLeft {
        didSet {
            invalidateLayout()
        }
    }
    
    // MARK: UICollectionViewLayout
    
    override open var collectionView: UICollectionView {
        return super.collectionView!
    }
    
    override open var collectionViewContentSize: CGSize {
        let totalItemsCount = CGFloat(collectionView.numberOfItems(inSection: 0))
            let contentWidth = (collectionView.bounds.width + spacing) * totalItemsCount - spacing
            return CGSize(width: contentWidth, height: collectionView.bounds.height)
        }
//
//        let itemsCount = CGFloat(collectionView.numberOfItems(inSection: 0))
//        return CGSize(width: collectionView.bounds.width * itemsCount, height: collectionView.bounds.height)
//    }
    
    override open func prepare() {
        super.prepare()
        assert(collectionView.numberOfSections == 1, "Multiple sections aren't supported!")
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let totalItemsCount = collectionView.numberOfItems(inSection: 0)
        
        let minVisibleIndex = max(Int(collectionView.contentOffset.x) / Int(collectionView.bounds.width), 0)
        let maxVisibleIndex = min(minVisibleIndex + maximumVisibleItems, totalItemsCount)
        
        let contentCenterX = collectionView.contentOffset.x + (collectionView.bounds.width / 2.0)
        
        let deltaOffset = (Int(collectionView.contentOffset.x) % Int(collectionView.bounds.width)) * (minVisibleIndex == 0 ? 2 : 1)
        
        let percentageDeltaOffset = CGFloat(deltaOffset) / collectionView.bounds.width
        
        let visibleIndices = stride(from: minVisibleIndex, to: maxVisibleIndex, by: 1)
        
        let attributes: [UICollectionViewLayoutAttributes] = visibleIndices.map { index in
            let indexPath = IndexPath(item: index, section: 0)
            return computeLayoutAttributesForItem(indexPath: indexPath, minVisibleIndex: minVisibleIndex, contentCenterX: contentCenterX, deltaOffset: CGFloat(deltaOffset), percentageDeltaOffset: percentageDeltaOffset)
        }
        
        return attributes
    }
    
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let contentCenterX = collectionView.contentOffset.x + (collectionView.bounds.width / 2.0)
        let minVisibleIndex = Int(collectionView.contentOffset.x) / Int(collectionView.bounds.width)
        let deltaOffset = (Int(collectionView.contentOffset.x) % Int(collectionView.bounds.width)) * (minVisibleIndex == 0 ? 2 : 1)
        let percentageDeltaOffset = CGFloat(deltaOffset) / collectionView.bounds.width
        return computeLayoutAttributesForItem(indexPath: indexPath, minVisibleIndex: minVisibleIndex, contentCenterX: contentCenterX, deltaOffset: CGFloat(deltaOffset), percentageDeltaOffset: percentageDeltaOffset)
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // MARK: - Layout computations
    
    fileprivate func computeLayoutAttributesForItem(indexPath: IndexPath, minVisibleIndex: Int, contentCenterX: CGFloat, deltaOffset: CGFloat, percentageDeltaOffset: CGFloat) -> UICollectionViewLayoutAttributes {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let visibleIndex = indexPath.row - minVisibleIndex
        let itemWidth = collectionView.bounds.width
        attributes.size = CGSize(width: itemWidth, height: collectionView.bounds.height)
        let midY = self.collectionView.bounds.midY
        let yOffSet: CGFloat = {
            switch alignment {
            case .bottomLeft: return midY + spacing * CGFloat(visibleIndex)
            case .centerLeft: return midY + spacing
            case .topLeft: return midY - spacing * CGFloat(visibleIndex)
            }
        }()
        
        attributes.center = CGPoint(x: contentCenterX + spacing * CGFloat(visibleIndex), y: yOffSet)
        attributes.zIndex = maximumVisibleItems - visibleIndex
        
        attributes.transform = transform(atCurrentVisibleIndex: visibleIndex, percentageOffset: percentageDeltaOffset)
        switch visibleIndex {
        case 0:
            attributes.center.x -= deltaOffset
        case 1..<maximumVisibleItems:
            attributes.center.x -= spacing * percentageDeltaOffset
            switch alignment {
            case .bottomLeft:
                attributes.center.y -= spacing * percentageDeltaOffset
            case .topLeft:
                attributes.center.y += spacing * percentageDeltaOffset
            case .centerLeft:
                break
            }
            
            if visibleIndex == maximumVisibleItems - 1 {
                attributes.alpha = percentageDeltaOffset
            }
        default:
            attributes.alpha = 0
        }
        return attributes
    }
    
    private func transform(atCurrentVisibleIndex visibleIndex: Int, percentageOffset: CGFloat) -> CGAffineTransform {
        var rawScale = visibleIndex < maximumVisibleItems ? scale(at: visibleIndex) : 1.0
        
        if visibleIndex != 0 {
            let previousScale = scale(at: visibleIndex - 1)
            let delta = (previousScale - rawScale) * percentageOffset
            rawScale += delta
        }
        return CGAffineTransform(scaleX: rawScale, y: rawScale)
    }
    
    private func scale(at index: Int) -> CGFloat {
        let translatedCoefficient = CGFloat(index) - CGFloat(self.maximumVisibleItems) / 2
        return CGFloat(pow(0.95, translatedCoefficient))
    }
}

extension CardsCollectionViewLayout {
    public enum Alignment {
        case bottomLeft
        case topLeft
        case centerLeft
    }
}

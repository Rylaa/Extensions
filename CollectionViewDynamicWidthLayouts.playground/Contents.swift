import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin: CGFloat = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            guard layoutAttribute.representedElementCategory == .cell else {
                return
            }
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}


class CenterAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      
      guard let superAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
      
      guard let attributes = (superAttributes.map { $0.copy() }) as? [UICollectionViewLayoutAttributes] else { return nil }
      
      let leftPadding: CGFloat = 16
      let interItemSpacing = minimumInteritemSpacing
      
      var leftMargin: CGFloat = leftPadding
      var maxY: CGFloat = -1.0
      var rowSizes: [[CGFloat]] = []
      var currentRow: Int = 0
      attributes.forEach { layoutAttribute in
        guard layoutAttribute.representedElementCategory == .cell else {
            return
        }
        
        if layoutAttribute.frame.origin.y >= maxY {
          
          leftMargin = leftPadding
          
          if rowSizes.count == 0 {
            rowSizes = [[leftMargin, 0]]
          } else {
            rowSizes.append([leftMargin, 0])
            currentRow += 1
          }
        }
        
        layoutAttribute.frame.origin.x = leftMargin
        
        leftMargin += layoutAttribute.frame.width + interItemSpacing
        maxY = max(layoutAttribute.frame.maxY, maxY)
        
        rowSizes[currentRow][1] = leftMargin - interItemSpacing
      }
      
      leftMargin = leftPadding
      maxY = -1.0
      currentRow = 0
      attributes.forEach { layoutAttribute in
        guard layoutAttribute.representedElementCategory == .cell else {
            return
        }
        
        if layoutAttribute.frame.origin.y >= maxY {
          
          leftMargin = leftPadding
          
          let rowWidth = rowSizes[currentRow][1] - rowSizes[currentRow][0]
          let appendedMargin = (collectionView!.frame.width - leftPadding  - rowWidth - leftPadding) / 2
          leftMargin += appendedMargin
          
          currentRow += 1
        }
        
        layoutAttribute.frame.origin.x = leftMargin
        
        leftMargin += layoutAttribute.frame.width + interItemSpacing
        maxY = max(layoutAttribute.frame.maxY, maxY)
      }
      
      return attributes
    }
    
    func sizeOfLabel(font: UIFont = UIFont(name: "Any-Font", size: 22)!) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.bounds.size
    }
}


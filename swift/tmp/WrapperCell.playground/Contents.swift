import UIKit


do {
  
  class MyView : UIView {
    
    let imageView: UIImageView = .init()
    let textLabel: UILabel = .init()
  }
  
  class MyViewContainerCell: UICollectionViewCell {
    
    let myView: MyView = MyView()
  }
  
}

public protocol ReusableViewType where Self : UIView {
  func prepareForReuse()
}

public protocol BackingViewMaker {
  associatedtype View : ReusableViewType
  static func makeBackedView() -> View
}

public final class WrapperCell<Maker: BackingViewMaker> : UICollectionViewCell {
  
  public let backed: Maker.View
  
  public override init(frame: CGRect) {
    let backingView = Maker.makeBackedView()
    self.backed = backingView
    super.init(frame: frame)
    self.contentView.addSubview(backingView)
    backingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    backingView.frame = bounds
  }
  
  public override func prepareForReuse() {
    backed.prepareForReuse()
  }
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func update(_ closure: (Maker.View) -> Void) {
    closure(backed)
  }
  
}

#if canImport(Reusable)

extension WrapperCell : Reusable {}

#endif


class MyView : UIView, ReusableViewType, BackingViewMaker {
  
  private let textLabel: UILabel = .init()
  
  func prepareForReuse() {
    setText("")
  }
  
  func setText(_ text: String) {
    textLabel.text = text
  }
  
  static func makeBackedView() -> MyView {
    return MyView.init(frame: .zero)
  }
}

let collectionView = UICollectionView()

collectionView.register(WrapperCell<MyView>.self, forCellWithReuseIdentifier: "WrapperCell<MyView>")

let indexPath = IndexPath()

let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WrapperCell<MyView>", for: indexPath) as! WrapperCell<MyView>

cell.update { (view) in
  
}

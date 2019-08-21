import UIKit

final class Layout : UICollectionViewFlowLayout {

  override func prepare() {
    super.prepare()
  }

  override func invalidateLayout() {
    super.invalidateLayout()
  }
}

final class Adapter : NSObject, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
    return cell
  }

}

let layout = Layout()

let collectionView = UICollectionView(
  frame: .init(x: 0, y: 0, width: 320, height: 500),
  collectionViewLayout: layout
)

let adapter = Adapter()
collectionView.dataSource = adapter









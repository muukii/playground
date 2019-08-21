import UIKit

let label = UILabel()

label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
label.numberOfLines = 0

label.systemLayoutSizeFitting(
  .init(
    width: 30,
    height: UIView.layoutFittingCompressedSize.height
  )
)


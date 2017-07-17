import UIKit
import PlaygroundSupport

// MARK: Common & init

// To add intrinsicContentSize to simple views w/o content
class SizedView: UIView {
    var customIntrinsicContentSize = CGSize.zero
    
    override var intrinsicContentSize: CGSize {
        return customIntrinsicContentSize
    }
}

let containerView = UIView(frame: CGRect(x: 0,
                                         y: 0,
                                         width:  375,
                                         height: 667))
containerView.backgroundColor = UIColor.white

var randomColor: UIColor {
    get {
        let randomValue = {
            return CGFloat((arc4random() % 100 + 100)) / 255.0
        }
        return UIColor(red:   randomValue(),
                       green: randomValue(),
                       blue:  randomValue(), alpha: 1)
    }
}

func someView(with size: CGSize) -> SizedView {
    let view = SizedView(frame: CGRect(origin: CGPoint.zero,
                                       size:   size))
    view.customIntrinsicContentSize = size
    view.backgroundColor = randomColor
    return view
}

PlaygroundPage.current.liveView = containerView

// MARK: UIStackView Samples

let verticalStackView = UIStackView(frame: CGRect(x: 25,
                                                  y: 100,
                                                  width:  325,
                                                  height: 500))
containerView.addSubview(verticalStackView)

verticalStackView.distribution = .fillEqually
verticalStackView.axis = .vertical

let horizontalLine1 = UIStackView(frame: CGRect.zero)
horizontalLine1.distribution = .equalSpacing
horizontalLine1.spacing = 5
horizontalLine1.alignment = .top
horizontalLine1.addArrangedSubview(someView(with: CGSize(width: 100, height: 75)))
horizontalLine1.addArrangedSubview(someView(with: CGSize(width: 75,  height: 50)))
horizontalLine1.addArrangedSubview(someView(with: CGSize(width: 25,  height: 100)))
horizontalLine1.addArrangedSubview(someView(with: CGSize(width: 50,  height: 25)))

let horizontalLine2 = UIStackView(frame: CGRect.zero)
horizontalLine2.distribution = .fillProportionally
horizontalLine2.addArrangedSubview(someView(with: CGSize(width: 25, height: 0)))
horizontalLine2.addArrangedSubview(someView(with: CGSize(width: 50, height: 0)))

let horizontalLine3 = UIStackView(frame: CGRect.zero)
horizontalLine3.layoutMargins = UIEdgeInsets(top:    2,
                                             left:   0,
                                             bottom: 2,
                                             right:  0)
horizontalLine3.isLayoutMarginsRelativeArrangement = true
horizontalLine3.distribution = .fillProportionally
horizontalLine3.axis = .vertical
horizontalLine3.spacing = 2
horizontalLine3.alignment = .center
horizontalLine3.addArrangedSubview(someView(with: CGSize(width: 200, height: 0)))
horizontalLine3.addArrangedSubview(someView(with: CGSize(width: 150, height: 0)))

verticalStackView.addArrangedSubview(horizontalLine1)
verticalStackView.addArrangedSubview(horizontalLine2)
verticalStackView.addArrangedSubview(horizontalLine3)
verticalStackView.addArrangedSubview(someView(with: CGSize.zero))

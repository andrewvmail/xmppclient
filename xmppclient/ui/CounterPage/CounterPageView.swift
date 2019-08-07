import UIKit

func CounterPageView(self: CounterPageController) {
    self.view.backgroundColor = .red

    self.count.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
    self.count.text = "Count"
    self.count.center.x = self.view.center.x
    self.count.center.y = self.view.center.y
    self.count.textAlignment = .center

    // Create the UIButton with frame
    let increment = UIButton()
    increment.frame = CGRect(x: 50, y: 220, width: 170, height: 30)
    increment.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
    increment.setTitle("+", for: .normal)
    increment.setTitle("I am being tapped", for: .highlighted)
    increment.setTitleColor(UIColor.blue, for: .normal)
    increment.setTitleColor(UIColor.black, for: .highlighted)
    increment.addTarget(self, action: #selector(self.tapIncrement(_:)), for: .touchUpInside)
    increment.center.x = self.view.center.x
    increment.center.y = self.view.center.y * 0.5

    // Create the UIButton with frame
    let decrement = UIButton()
    decrement.frame = CGRect(x: 50, y: 220, width: 170, height: 30)
    decrement.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
    decrement.setTitle("-", for: .normal)
    decrement.setTitle("I am being tapped", for: .highlighted)
    decrement.setTitleColor(UIColor.blue, for: .normal)
    decrement.setTitleColor(UIColor.black, for: .highlighted)
    decrement.addTarget(self, action: #selector(self.tapDecrement(_:)), for: .touchUpInside)
    decrement.center.x = self.view.center.x
    decrement.center.y = self.view.center.y * 1.50

    // Add the UIelements to the view controller's root view
    self.view.addSubview(self.count)
    self.view.addSubview(increment)
    self.view.addSubview(decrement)
}

import UIKit

func TodoPageView(self: TodoPageController) {
//    controller().navigationcontroller.navigationBar.topItem?.title = "Todo"

    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.tableView.frame = self.view.bounds
    self.tableView.center.x = self.view.center.x
    self.tableView.center.y = self.view.center.y
    self.tableView.dataSource = self
    self.tableView.delegate = self as! UITableViewDelegate
    self.view.addSubview(self.tableView)
}

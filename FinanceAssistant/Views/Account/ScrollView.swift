import UIKit

class AccountsPageScrollVieDelegat: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(123123123)
    }
}

class AccountsPageScrollView: UIScrollView {
    override var delegate: UIScrollViewDelegate? = 
    override var delegate: AccountsPageScrollVieDelegat?
}

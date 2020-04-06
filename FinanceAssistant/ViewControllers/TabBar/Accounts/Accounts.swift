import UIKit

final class AccountsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    private let owner = Owner()
    private var accounts: [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        self.initAccounts()
        
        if let cardsCollection = segue.destination as? AccountsCardsViewController {
            cardsCollection.configure(with: accounts)
        } else if let actionsCollection = segue.destination as? AccountsActionsViewController {
            actionsCollection.configure(actionsCount: 10)
        }
    }
    
    func initAccounts() {
        accounts.append(Account(name: "Somename_1", descr: "Descr", type: AccountType.Cash, owner: owner))
        accounts.append(Account(name: "Somename_2", descr: "Descr", type: AccountType.Cash, owner: owner))
        accounts.append(Account(name: "Somename_3", descr: "Descr", type: AccountType.CreditCard, owner: owner))
        accounts.append(Account(name: "Somename_4", descr: "Descr", type: AccountType.Cash, owner: owner))
        accounts.append(Account(name: "Somename_5", descr: "Descr", type: AccountType.DebitCard, owner: owner))
    }
}

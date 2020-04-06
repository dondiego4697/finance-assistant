import Foundation
import RealmSwift

/* SQL
 CREATE TYPE account_type AS ENUM (
     'INCOME',
     'EXPENSES',
     'BANK_ACCOUNT',
     'CREDIT_CARD',
     'DEBIT_CARD',
     'CASH'
 );

 CREATE TABLE account (
     id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
     type type NOT NULL,

     start_date timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
     end_date timestamp with time zone DEFAULT NULL,

     name char(250) NOT NULL DEFAULT '',
     description char(250) NOT NULL DEFAULT '',

     owner uuid NOT NULL
 );
*/

enum AccountType: String {
    case Income = "INCOME"
    case Expense = "EXPENSE"
    case BankAccount = "BANK_ACCOUNT"
    case CreditCard = "CREDIT_CARD"
    case DebitCard = "DEBIT_CARD"
    case Cash = "CASH"
}

class Account: Object {
    @objc dynamic var id = UUID().uuidString
    @objc private dynamic var rawType = ""
    dynamic var type: AccountType {
        get {
            return AccountType(rawValue: rawType)!
        }
        set {
            rawType = newValue.rawValue
        }
    }
    @objc dynamic var startDate = Date()
    @objc dynamic var endDate: Date? = nil
    @objc dynamic var name = ""
    @objc dynamic var descr = ""
    @objc dynamic var owner: Owner?
    
    required init() {
        super.init()
    }
    
    init(name: String, descr: String, type: AccountType, owner: Owner) {
        super.init()
        self.name = name
        self.descr = descr
        self.type = type
        self.owner = owner
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["type"]
    }
}

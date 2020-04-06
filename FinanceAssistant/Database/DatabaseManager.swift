import Foundation
import RealmSwift

// Get simulator uuid: xcrun simctl list | egrep '(Booted)'
// Path to the store: /Users/<name>/Library/Developer/CoreSimulator/Devices/<simulator-uuid>
//      /data/Containers/Data/Application/<application-uuid>/Documents/default.realm
// Find files: find . -iname "*.realm"

class DatabaseManager {
    static let sharedInstance = DatabaseManager()
    var realm: Realm
    
    private init() {
        let SCHEMA_VERSION: UInt64 = 3
        let config = Realm.Configuration (
            schemaVersion: SCHEMA_VERSION,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < SCHEMA_VERSION) {
                    
                }
            }
        )
        
        realm = try! Realm(configuration: config)
    }
    
    func create<T: Object>(_ item: T) {
        try! self.realm.write {
            self.realm.add(item)
        }
    }
    
    func update<T: Object>(_ item: T) {
        try! self.realm.write {
            self.realm.add(item, update: .modified)
        }
    }
    
    // USAGE:
    // self.view.backgroundColor = UIColor(named: "background-color")
            
    // let budget = Budget(name: "name1", descr: "descr1")
    // budget.id = "E7FDD637-D14C-47E0-99FB-F03FE8C319B2"

    // let budgetParams = BudgetParams(sum: 10011)
    // budget.params = budgetParams

    // DatabaseManager.sharedInstance.create(budget)
}

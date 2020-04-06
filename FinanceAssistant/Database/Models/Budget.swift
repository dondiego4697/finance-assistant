import Foundation
import RealmSwift

/* SQL
 CREATE TABLE budget (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    date timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_archived boolean NOT NULL DEFAULT 'FALSE',
    owner uuid NOT NULL,
    params uuid NOT NULL,
    name char(250) NOT NULL DEFAULT '',
    description char(250) NOT NULL DEFAULT ''
 );
*/

class Budget: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date = Date()
    @objc dynamic var isArchived = false
    @objc dynamic var params: BudgetParams?
    @objc dynamic var name = ""
    @objc dynamic var descr = ""
    
    required init() {
        super.init()
    }
    
    init(name: String, descr: String) {
        super.init()
        self.name = name
        self.descr = descr
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

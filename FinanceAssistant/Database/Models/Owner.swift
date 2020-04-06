import Foundation
import RealmSwift

/* SQL
 CREATE TABLE owner (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    created_date timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
 );
*/

class Owner: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var createdDate = Date()
    
    required init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

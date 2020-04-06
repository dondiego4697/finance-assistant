import Foundation
import RealmSwift

/* SQL
 CREATE TABLE budget_params (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    sum money DEFAULT NULL,
    start_date timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date timestamp with time zone DEFAULT NULL,
 );
*/

class BudgetParams: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var sum: Double = 0.0
    @objc dynamic var startDate = Date()
    @objc dynamic var endDate: Date? = nil
    
    required init() {
        super.init()
    }
    
    init(sum: Double) {
        super.init()
        self.sum = sum
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

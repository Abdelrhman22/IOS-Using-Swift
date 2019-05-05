import UIKit

class Manager: Person
{
    override init(sal :Double)
    {
        super.init(sal: sal)
    }
    
    override func getSalary() -> Double
    {
        return salary*2.0
    }
}

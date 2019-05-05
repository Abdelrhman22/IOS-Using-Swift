import UIKit

class Employee: Person
{
    override init(sal :Double)
    {
        super.init(sal: sal)
    }
    
    override func getSalary() -> Double
    {
        return salary*1.5
    }
}

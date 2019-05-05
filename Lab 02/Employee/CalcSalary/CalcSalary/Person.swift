import UIKit

class Person: NSObject
{
    var salary :Double
    init(sal :Double) {
        self.salary = sal
    }
    
    func getSalary() -> Double
    {
       return salary
    }
}

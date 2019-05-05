import UIKit

var str = "Hello, playground"
var x = 10

class parent {
    var myStored :Int = 100
    var myComputed : Double {
        get
        {
            return 5*6
        }
        set (myNew)
        {
            print("New Value ", myNew)
        }
    }
    func sayHi()
    {
     print("Hi Parent")
    }
}
class Child : parent
{     override var myStored :Int {
    didSet{
        print("didSet")
    }
    willSet{
        print("willSet")
    }
    }
    override func sayHi()
    {
        print("Hi Child")
    }
}
var obj = parent()
obj.sayHi()
obj.myComputed=10
print(obj.myComputed)

var ch = Child()
ch.sayHi()
print(ch.myStored)

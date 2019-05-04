import UIKit

var str = "Hello, playground"

struct MyStruct
{
    var  name : String
    var title : String
    var age   : Float
    
}
class ClassA
{
    var  name : String = ""
    var title : String = ""
    var age   : Float = 0.0
    var myArray = [10,20,30,40,50,60,70,80]
    subscript (index : Int) -> Int
    {
        get
        {
            return myArray[index]
        }
        set(newValue){
            self.myArray[index] = newValue
        }
    }
}
var objStruct = MyStruct(name: "Arafa" , title :"Android Developer" , age:25.0)
var objClass  = ClassA()

print(objClass[0])

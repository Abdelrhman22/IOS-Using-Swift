import UIKit

func swap (num1: inout Int, num2: inout Int)
{
    let temp=num1
    num1 = num2;
    num2 = temp
}
var a = 5
var b = 9
print("Before Swap a=",a,"b=",b)
swap(&a ,&b)
print("After  Swap a=",a,"b=",b)


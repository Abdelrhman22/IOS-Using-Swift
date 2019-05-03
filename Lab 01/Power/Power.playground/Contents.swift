import UIKit
// Using Loop
func pow (base:Int, power:UInt) -> Int
{
    var answer : Int = 1
    for _ in 0...power { answer *= base }
    return answer
}
print("Result Using loop",pow(2,7))
//////////////////////////////////////////////////
func powRecursion (base:Int, power:UInt) -> Int
{
    var result :Int = 1;
    if (power == 0)
    {
        return 1;
    }
    if (power % 2 == 0)
    {
        result = powRecursion(base: base, power: power / 2);
        return result * result;
    } else
    {
    return base * powRecursion(base: base, power: power - 1);
    }
}

print("Result Using Recusrion",powRecursion(base: 2,power: 7))

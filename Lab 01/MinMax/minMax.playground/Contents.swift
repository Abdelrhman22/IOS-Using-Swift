import UIKit
func minMax (array:[Int]) -> (min:Int , max:Int)?
{
    if (array.isEmpty)
    {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]
    {
        if(value<currentMin)
        {
           currentMin=value
        }
        else if(value>currentMax)
        {
            currentMax=value
        }
    }
    return (currentMin,currentMax)
}
var myarray:[Int] = [5,0,3,4,5]

print(minMax(array: myarray))

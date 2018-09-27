//: Playground - noun: a place where people can play

import UIKit

func findMinMax(myArray: [Int]) ->(min: Int, max: Int)
{
    var mymin = 0
    var mymax = 0
    
    for i in myArray
    {
        if i<mymin {
            mymin = i
        }
        else if i>mymax{
            mymax = i
        }
        
    }
    return (mymin, mymax)
}

let funcArray = findMinMax(myArray: [2,3,57,8,3,-1,-5])
print("Minimum is \(funcArray.min) and Maximum is \(funcArray.max) ")



func findMean(_ num:Int...)->Int{
    
    var total = 0
    for n in num {
        total += n
    }
    return total/num.count
}

print(findMean(2,4,6,7,8,24,5,-7))

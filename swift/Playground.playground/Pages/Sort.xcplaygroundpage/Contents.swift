//: [Previous](@previous)

import Foundation

let array = [1,2,3,4,5,7,6,8,9]


/*:
 > Decsending
 **/
print(array.sorted { $0 > $1 })
/*:
 > Acseding
 */
print(array.sorted { $0 < $1 })
/*:
 > Acseding
 */
print(array.sorted())

//: [Next](@next)

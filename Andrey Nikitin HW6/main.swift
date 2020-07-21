//  main.swift
//  Andrey Nikitin HW6
//
//  Created by Rayen on 7/20/20.
//  Copyright © 2020 Rayen. All rights reserved.
//

struct Queue<T> {
    
    typealias DictType = [T]
    private var contents: [T] = []
    init() { }
    init<S: Sequence>(_ sequence: S) where
        S.Iterator.Element == T {
            for element in sequence {
                contents.append(element)
            }
    }
    public mutating func enqueue(_ element: T) {
        contents.append(element)
    }
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return contents.removeFirst()
        }
    }
}
extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: contents)
    }
}
extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}
extension Queue: Sequence {
    typealias Iterator = AnyIterator<(T)>
    
    func makeIterator() -> Iterator {
        var iterator = contents.makeIterator()
        
        return AnyIterator {
            return iterator.next()
        }
    }
}
extension Queue: Collection {
    typealias Index = DictType.Index
    typealias Element = DictType.Element
    
    var startIndex: Index { return contents.startIndex }
    var endIndex: Index { return contents.endIndex }
    
    subscript(index: Index) -> Iterator.Element {
        get { return contents[index] }
    }
    
    func index(after i: Index) -> Index {
        return contents.index(after: i)
    }
}


var myQueueOfInts: Queue = [1,2,3,4,5,6,7,8,9,10]

print(myQueueOfInts[3])
print(myQueueOfInts.count)

myQueueOfInts.enqueue(256)
print(myQueueOfInts)
myQueueOfInts.dequeue()
myQueueOfInts.dequeue()
myQueueOfInts.dequeue()
print(myQueueOfInts)

for item in myQueueOfInts {
    print ("item is: ", item)
}
let myQueueOfStrings: Queue = ["Antony", "Rayen", "Kurt", "Konstantin", "Lucius", "Jim"]
let shortNames = myQueueOfStrings.filter { $0.count < 6 }
print(shortNames)
print("minimum element is:", myQueueOfInts.min())

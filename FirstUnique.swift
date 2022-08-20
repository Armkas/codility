/*

A non-empty array A consisting of N integers is given. The unique number is the number that occurs exactly once in array A.

For example, the following array A:
  A[0] = 4
  A[1] = 10
  A[2] = 5
  A[3] = 4
  A[4] = 2
  A[5] = 10

contains two unique numbers (5 and 2).

You should find the first unique number in A. In other words, find the unique number with the lowest position in A.

For above example, 5 is in second position (because A[2] = 5) and 2 is in fourth position (because A[4] = 2). So, the first unique number is 5.

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given a non-empty array A of N integers, returns the first unique number in A. The function should return −1 if there are no unique numbers in A.

For example, given:
  A[0] = 1
  A[1] = 4
  A[2] = 3
  A[3] = 3
  A[4] = 1
  A[5] = 2

the function should return 4. There are two unique numbers (4 and 2 occur exactly once). The first one is 4 in position 1 and the second one is 2 in position 5. The function should return 4 bacause it is unique number with the lowest position.

Given array A such that:
  A[0] = 6
  A[1] = 4
  A[2] = 4
  A[3] = 6

the function should return −1. There is no unique number in A (4 and 6 occur more than once).

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [1..100,000];
        each element of array A is an integer within the range [0..1,000,000,000].

*/


/* https://app.codility.com/demo/results/training27HRKC-KJZ/
解法正确但是时间复杂度超时
*/

public func solution(_ A : inout [Int]) -> Int {
    let arr = A.sorted()
    var saveAllUnique = [Int]()
    
    if arr[0] != arr[1] {
        saveAllUnique.append(arr[0])
    }
    
    for i in 1..<(arr.count-1) {
        if arr[i] != arr[i-1] && arr[i] != arr[i+1] {
            saveAllUnique.append(arr[i])
        }
    }
    
    if arr[arr.count-1] != arr[arr.count-2] {
        saveAllUnique.append(arr[arr.count-1])
    }
    
    if saveAllUnique.isEmpty {
        return -1
    }
    
    var index = 0
    while index < A.count {
        if saveAllUnique.contains(A[index]) {
            return A[index]
        }
        index += 1
    }
    return -1
}


 //https://app.codility.com/demo/results/training2HGU66-TWC/ 100%

public func solution(_ A : inout [Int]) -> Int {
    var dict = [Int: Int]()//number: count //number 作为索引
    
    for number in A {
        if let count = dict[number] {
            dict[number] = count + 1
        } else {
            dict[number] = 1
        }
    }
    
    for number in A {
        if dict[number] == 1 {//重点 假如同contain需要遍历一遍 复杂度N^2 这里直接一步查询 复杂度1
            return number
        }
    }
    
    return -1
}
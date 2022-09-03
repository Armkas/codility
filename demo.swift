

/*This is a demo task.

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [1..100,000];
        each element of array A is an integer within the range [−1,000,000..1,000,000].

Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 

*/

public func solution(_ A : inout [Int]) -> Int {
    let brr = A.filter { $0 > 0 }
    if brr.count == 0 {//数组全是负的情况
        return 1
    }
    let crr = Array(Set(brr))//去重
    let arr = crr.sorted()//排序
    var index = 0
    while index < arr.count {
        if arr[index] > index + 1 {//在2维图像上不连贯 y要大于预期
            return index + 1
        }
        index += 1
    }
    return arr.last! + 1
}


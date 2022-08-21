/*


"有序数组中绝对值不同的数的个数"指的是，一个已经排好序的整数数组中绝对值不相同的数字的个数，

例如：
A[0] = -5    A[1] = -3    A[2] = -1
A[3] =  0    A[4] =  3    A[5] =  6

绝对值不同的数的个数为 5， 因为其中有 5 个不同的绝对值： 0, 1, 3, 5, 6

编写一个函数：

    public func solution(_ A : inout [Int]) -> Int

请返回给定有序数组中绝对值不同的数的个数。

例如，给出数组A：
A[0] = -5    A[1] = -3    A[2] = -1
A[3] =  0    A[4] =  3    A[5] =  6

函数应返回5。

假定:

        N 是 [1..100,000] 内的 整数;
        数组 A 每个元素是取值范围 [−2,147,483,648..2,147,483,647] 内的 整数 ;
        数组 A 是 非-递增 序列.

Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 


*/

// https://app.codility.com/demo/results/trainingA9KAG9-XJC/

public func solution(_ A : inout [Int]) -> Int {
    let arr = A.map { abs($0)}
    let setA = Set(arr)
    return setA.count
}
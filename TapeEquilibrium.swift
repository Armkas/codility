/*



A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

For example, consider array A such that:
  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3

We can split this tape in four places:

        P = 1, difference = |3 − 10| = 7
        P = 2, difference = |4 − 9| = 5
        P = 3, difference = |6 − 7| = 1
        P = 4, difference = |10 − 3| = 7

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

For example, given:
  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3

the function should return 1, as explained above.

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [2..100,000];
        each element of array A is an integer within the range [−1,000..1,000].

Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 

*/

// https://app.codility.com/demo/results/trainingDKV983-H8C/
// 普通法 穷举出来 复杂度太高 O(N * N)
public func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    var minDifference = Int.max //先设置最大 就跟一般先设定为0 反向操作
    
    for p in 1..<n {
        let left = A[0...(p-1)]//根据index,取数组部分变成新数组
        let right = A[p...(n-1)]
        let leftSum = left.reduce(0, +)//累加
        let rightSum = right.reduce(0, +)
        let difference = abs(leftSum - rightSum)//绝对值
        minDifference = min(minDifference!, difference)
    }
    return minDifference!
}

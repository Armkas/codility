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


// https://app.codility.com/demo/results/trainingWT45B4-5NP/   复杂度貌似正确 没有超时但是短点有错
public func solution(_ A : [Int]) -> Int {
    let n = A.count
    let sum = A.reduce(0, +)
    
    var leftSum = A.first!
    var rightSum = sum - leftSum
    
    var minDiff = Int.max
    
    // p index 为1~(n-2) 因为切成2个厚都不能为空数组
    // 0~(p-1)   p~(n-1)
    // 此处循环p 到(n-2)为止因为A[p] A[n-1] 不能移动到左边
    for p in 1..<n-1 {
        leftSum += A[p]
        rightSum -= A[p]
        minDiff = min(minDiff, abs(leftSum - rightSum))
    }
     return minDiff
}


https://app.codility.com/demo/results/trainingV3H7S3-YXF/ 100 大神方法
public func solution(_ A : inout [Int]) -> Int {
    let sum  = A.reduce(0, +)
    
    var leftT = 0
    var rightT = sum
    var minDif = Int.max
    let n = A.count
    for p in 0 ..< n-1 {
        let x = A[p]
        leftT += x
        rightT -= x
        
        let dif = abs(leftT - rightT)
        minDif = min(minDif, dif)
    }
    return minDif
}

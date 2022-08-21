/* Distinct
    


编写一个函数

    public func solution(_ A : inout [Int]) -> Int

给出一个以0为起始索引的数组 A，其中包含 N 个整数， 返回 A 中不重复的整数的个数:

    |{ A[i] : 0 ≤ i < N}|.

例如，给出
 A[0] = 2    A[1] = 1    A[2] = 1
 A[3] = 2    A[4] = 3    A[5] = 1

你的函数应该返回 3，因为数组 A 中包括数字 {1,2,3}.

假定:

        N 是 [0..100,000] 内的 整数;
        数组 A 每个元素是取值范围 [−1,000,000..1,000,000] 内的 整数 .



*/

public func solution(_ A : inout [Int]) -> Int {
    let setA = Set(A)
    return setA.count
}
/*

https://app.codility.com/demo/results/trainingR2N9YW-8EJ/

编写一个函数

    public func solution(_ S : inout String) -> Int

从给出的字符串 S 中，找到并返回这样一个字符的下标（下标从 0 开始算）， 使得这个字符左边的子字符串，刚好与右边的子字符串相反 （但如果这样的字符不存在的话，返回 −1）。

例如，给出这样一个字符串

"racecar"

你的函数应该返回 3，因为对于下标为 3 的字符 e， 其左边相邻的子字符串是 "rac"， 而右边相邻的子字符串是 "car"。

注： 与空字符串（长度为 0 的字符串）相反的还是一个空字符串。

假定:

        S 长度范围 [0..2,000,000].


*/


public func solution(_ S : inout String) -> Int {
    let arr: [Character] = Array(S)
    if arr.count == 0 {
        return -1
    }
    if arr.count == 1 {
        return 0
    }
    if arr.count % 2 == 0 {
        return -1
    }
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    while leftIndex < rightIndex {
        if arr[leftIndex] == arr[rightIndex] {
            leftIndex += 1
            rightIndex -= 1
        } else {
            return -1
        }
    }
    return leftIndex // 此时状态 是 ..., arr[leftIndex], 目标, arr[rightIndex], ... 但是最后一次循环+1过了
}
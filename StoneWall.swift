/*


You are going to build a stone wall. The wall should be straight and N meters long, and its thickness should be constant; however, it should have different heights in different places. The height of the wall is specified by an array H of N positive integers. H[I] is the height of the wall from I to I+1 meters to the right of its left end. In particular, H[0] is the height of the wall's left end and H[N−1] is the height of the wall's right end.

The wall should be built of cuboid stone blocks (that is, all sides of such blocks are rectangular). Your task is to compute the minimum number of blocks needed to build the wall.

Write a function:

    public func solution(_ H : inout [Int]) -> Int

that, given an array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.

For example, given array H containing N = 9 integers:
  H[0] = 8    H[1] = 8    H[2] = 5
  H[3] = 7    H[4] = 9    H[5] = 8
  H[6] = 7    H[7] = 4    H[8] = 8

the function should return 7. The figure shows one possible arrangement of seven blocks.

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [1..100,000];
        each element of array H is an integer within the range [1..1,000,000,000].

Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 

看不懂大神法 https://app.codility.com/demo/results/training98D3G4-UPN/

*/

public func solution(_ H : [Int]) -> Int {//正确22%
    // write your code in Swift 4.2.1 (Linux)
    var continuousBlocks = [Int:Int]() //记录所有高度下的连续重复次数.高度: 连续的次数
    for i in H {
        continuousBlocks[i] = 0 //每个高度作为key,value全写0
    }
    var lastHeight = H.first
    for index in 1..<H.count {
        if H[index] == lastHeight {
            continuousBlocks[H[index]]! += 1
        }
        lastHeight = H[index]
    }
    var continuous: Int = 0
    for i in continuousBlocks {
        if i.value != 0 {
            continuous += (i.value + 1)
        }
    }
    return H.count - continuous
}

//大神 看不懂
public func solution(_ H : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let N = H.count

    var stones = 0

    var stack = Array(repeating: 0, count: N)

    var stackNum = 0

    for i in 0..<N {
        while stackNum > 0 && stack[stackNum - 1] > H[i] {
            stackNum -= 1
        }
    
        if stackNum <= 0 || stack[stackNum - 1] != H[i] {
            stones += 1
            stack[stackNum] = H[i]
            stackNum += 1
        }
    }

    return stones
}

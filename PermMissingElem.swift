/*


An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given an array A, returns the value of the missing element.

For example, given array A such that:
  A[0] = 2
  A[1] = 3
  A[2] = 1
  A[3] = 5

the function should return 4, as it is the missing element.

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [0..100,000];
        the elements of A are all distinct;
        each element of array A is an integer within the range [1..(N + 1)].

Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 

N个元素数组,每个元素都是Int
每个元素范围是1~N+1
买个元素不相同

所以
1~N+1范围内
肯定有一个整数不在数组内寻找它

*/

// https://app.codility.com/demo/results/trainingGSXYTX-8XX/ 
// 虽然100分但是复杂度 O(N) or O(N * log(N)) 

public func solution(_ A :[Int]) -> Int {
    let arr = A.sorted()
    if arr.count == 0 {//空数组
        return 1
    }
    if arr.count == 1 {//只有一个元素 只可能是1或者2,判断少哪一个
        if arr.first == 2 {
            return 1
        } else {
            return 2
        }
    }
    if arr.first != 1 {//少在第一位
        return 1
    }
    if arr.last != arr.count + 1 {//少在最后
        return arr.count + 1
    }
    var index = 1
    while index < arr.count {
        if arr[index] - arr[index-1] > 1 {
            return arr[index-1] + 1
        }
        index += 1
    }
    return -1//绝对不会被使用 但是不写函数不成立
}

//https://app.codility.com/demo/results/trainingG5EQR3-N4C/  
// 假设不少一个的数列 做差法   O(N) or O(N * log(N)) 
public func solution(_ A :[Int]) -> Int {
    //实际上的总和
    let realSum = A.reduce(0, +)
    //理论上 N+1个元素都存在的时候等差数列求和
    let n = A.count
    let shouldSum = (1 + (n+1)) * (n+1) / 2
    //作差
    return shouldSum - realSum
}


//反正有数学方法时候用数学方法一定比较快/正确
/*


A non-empty array A consisting of N integers is given.

The leader of this array is the value that occurs in more than half of the elements of A.

An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.

For example, given array A such that:
    A[0] = 4
    A[1] = 3
    A[2] = 4
    A[3] = 4
    A[4] = 4
    A[5] = 2

we can find two equi leaders:

        0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
        2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.

The goal is to count the number of equi leaders.

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given a non-empty array A consisting of N integers, returns the number of equi leaders.

For example, given:
    A[0] = 4
    A[1] = 3
    A[2] = 4
    A[3] = 4
    A[4] = 4
    A[5] = 2

the function should return 2, as explained above.

Write an efficient algorithm for the following assumptions:

        N is an integer within the range [1..100,000];
        each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].


*/

//超过复杂度
public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var count = 0
    for index in 0..<A.count {
        let leftArr = A[0..<index]
        let rightArr = A[index..<A.count]
        let leftLeader = findLeader(Array(leftArr))
        let rightLeader = findLeader(Array(rightArr))
        if leftLeader != nil && rightLeader != nil {
            if leftLeader == rightLeader {
                count += 1
            }
        }
    }
    return count
}

func findLeader(_ arr: [Int]) -> Int? {
    // let dic = Dictionary(zip(arr, repeatElement(1, count: arr.count)), uniquingKeysWith: +)
    var dic = [Int: Int]()
    for item in arr {
        dic[item, default: 0] += 1
    }
    let most: Int = dic.values.max()!
    if most <= (arr.count/2) {
        return nil
    } else {
        return most
    }
}

//大神 看不懂
public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count <= 1 {
            return 0
        }
        
        var leftEquiLeaders = Dictionary<Int, Int>(minimumCapacity: count)
        
        var leftCounts = Dictionary<Int, Int>(minimumCapacity: count)
        var maxLeft = (value: Int.min, count: 0)
        
        for s in 0..<count {
            // Left side leader
            let l = A[s]
            var newCount = 1
            if let currentCount = leftCounts[l] {
                newCount += currentCount
            }
            
            leftCounts[l] = newCount
            
            if maxLeft.count < newCount {
                maxLeft = (l, newCount)
            }
            
            if maxLeft.count >= (s + 1) / 2 + 1 {
                leftEquiLeaders[s] = maxLeft.value
            }
        }
        
        var leadersCount = 0
        
        var rightCounts = Dictionary<Int, Int>(minimumCapacity: count)
        var maxRight = (value: Int.min, count: 0)
        
        for s in 0..<count {
            // Right side leader
            // It is possible to count only left equi leaders (if exist) to improve performance
            let rightIndex = count - 1 - s
            let r = A[rightIndex]
            var newCount = 1
            if let currentCount = rightCounts[r] {
                newCount += currentCount
            }
            
            rightCounts[r] = newCount
            
            if maxRight.count < newCount {
                maxRight = (r, newCount)
            }
            
            let rs = rightIndex - 1
            
            if maxRight.count >= (count - rightIndex) / 2 + 1 {
                if let leftLeader = leftEquiLeaders[rs], leftLeader == maxRight.value {
                    leadersCount += 1
                }
            }
        }

        return leadersCount
    }


//also
public func solution(inout A : [Int]) -> Int {
    // write your code in Swift 2.2
    var candidate = 0

    var count = 0

    for i in A {
        if count == 0 {
            candidate = i
        }
        if candidate == i {
            count += 1
        } else {
            count -= 1
        }
    }

    count = 0

    for i in A {
        if i == candidate {
            count += 1
        }
    }

    var equiLeaders = 0

    var leftLeaders = 0

    var rightLeaders = count

    for i in 0..<A.count {
        if A[i] == candidate {
            leftLeaders += 1
            rightLeaders -= 1
        }
    
        if leftLeaders > (i + 1) / 2 && rightLeaders > (A.count - i - 1) / 2 {
            equiLeaders += 1
        }
    }

    return equiLeaders
}

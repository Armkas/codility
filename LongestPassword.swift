/*
这题有难度

https://app.codility.com/demo/results/trainingX3BY6Y-VBF/

You would like to set a password for a bank account. However, there are three restrictions on the format of the password:

        it has to contain only alphanumerical characters (a−z, A−Z, 0−9); 只包含字母和数字
        there should be an even number of letters; 偶数个字母
        there should be an odd number of digits.奇数个数字
        //注意0是偶数 反正用 0 % 2 == 0 能判断

You are given a string S consisting of N characters. String S can be divided into words by splitting it at, and removing, the spaces. The goal is to choose the longest word that is a valid password. You can assume that if there are K spaces in string S then there are exactly K + 1 words.

For example, given "test 5 a0A pass007 ?xy1", there are five words and three of them are valid passwords: "5", "a0A" and "pass007". Thus the longest password is "pass007" and its length is 7. Note that neither "test" nor "?xy1" is a valid password, because "?" is not an alphanumerical character and "test" contains an even number of digits (zero).

Write a function:

    public func solution(_ S : inout String) -> Int

that, given a non-empty string S consisting of N characters, returns the length of the longest word from the string that is a valid password. If there is no such word, your function should return −1.

For example, given S = "test 5 a0A pass007 ?xy1", your function should return 7, as explained above.

Assume that:

        N is an integer within the range [1..200];
        string S consists only of printable ASCII characters and spaces.

In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
Copyright 2009–2022 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited. 
*/

public func solution(_ S : String) -> Int {
    //根据空格切分, 根据长度排序
    let passwords = S.components(separatedBy: " ").sorted { (l,r) -> Bool in
        return l.count > r.count
    }
    var maxlenth = -1 //符合条件password个数为0时候返回-1
    for password in passwords {
        if check(password) {
            maxlenth = max(maxlenth, password.count)
        }
    }
    return maxlenth
}

func check(_ str: String) -> Bool {
    let letters = CharacterSet.letters//所有字母的Set
    let digits = CharacterSet.decimalDigits//所有数子的Set
    var numberOfLetters = 0
    var numberOfDigits = 0
    
    for c in str.unicodeScalars {//不加会报错 格式不对
        if letters.contains(c) {
            numberOfLetters += 1
        } else if digits.contains(c) {
            numberOfDigits += 1
        } else {
            return false //含有字母数字外的字符
        }
    }
    
    //需要奇数个数字 和 偶数个 字母
    if numberOfDigits % 2 == 1 && numberOfLetters % 2 == 0 {//注意0是偶数,所以没有数字是false; 0 % 2 == 0 包括进去了
        return true
    } else {
        return false
    }
}
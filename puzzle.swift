//let input = readLine()
//let words = input?.components(separatedBy: " ")
//var N = 0
//var M = 0
//
//let input2 = readLine()
//if let input2 = input2 {
//    let inputNumberCharacters = input2.split(separator: " ")
//    let numbers = inputNumberCharacters.map { Int(String($0))! }
//    M = numbers[0]
//    N = numbers[1]
//}
//
//var table: [[String]] = []
//
//for _ in 1...M {
//    let row: [String] = readLine()!.split(separator: " ").map({ (substring) in return String(substring)})
//    table.append(row)
//
//}
//
//print(table)
//
//  main.swift
//  hw3
//
//  Created by Niloofar Bahrani on 4/1/1399 AP.
//  Copyright © 1399 Niloofar Bahrani. All rights reserved.
//

import Foundation

class TrieNode{
    var children: [Character:TrieNode] = [:]
    var isFinal: Bool = false

    func createChildFor(_ character: Character) -> TrieNode {
        let node = TrieNode()

        children[character] = node

        return node
    }

    func getOrCreateChildFor(_ character: Character) -> TrieNode {
        if let child = children[character] {
            return child
        } else {
            return createChildFor(character)
        }
    }

}

class Trie {
    var root = TrieNode()
    var temp_Node: TrieNode = TrieNode()
    let SIZE: Int = 26;
    let ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var M: Int = 3
    var N: Int = 3
    var  boggle:[[String]] = [[]]
    var  is_checked:[[Bool]] = []
    var findSet = Set<String>()
    func insert(_ word: String){
        let strArr1 = Array(word)
        insert(characters: strArr1)
    }

    func insert(characters: [Character]) {
      var node = root
      for character in characters {
          node = node.getOrCreateChildFor(character)
      }
      node.isFinal = true //
    }

    func query(_ word: String) -> Bool {
        let strArr2 = Array(word)
        return query(characters: strArr2)
    }

    func query(characters: [Character]) -> Bool {
           var node : TrieNode? = root
           for character in characters {
             node = node?.children[character]
             if node == nil {
               return false
             }
           }
           return node!.isFinal
    }
    
//    func init_trie(){
//        for i in 0...self.M - 1 {
//            for j in 0...self.N - 1 {
//                print(i,j)
//                self.is_checked[i][j] = false
//            }
//        }
//    }

}

func temp_func_for_check(word:String, i:Int, j:Int, trie: Trie) -> [String] {
    var ans = [String]()
    if trie.is_checked[i][j] == true {
        trie.is_checked[i][j] = false
    } else {
        trie.is_checked[i][j] = true
        for ii in i-1 ... i+1{
            for jj in j-1 ... j+1{
                if (0 <= ii && ii < trie.M && 0 <= jj && jj < trie.N && (i != ii || j != jj)){
                    let temp_ans: [String] = temp_func_for_check(word:word, i:ii , j:jj, trie:trie)
                    for t in temp_ans{
                        ans.append(trie.boggle[i][j] + t)
                    }
                }
            }
        }
        trie.is_checked[i][j] = false
    }
    return ans
}

var myTrie = Trie()
//let words = "\(readLine()!)".uppercased().split{$0 == " "}.map(String.init)
//for w in words{
//    print(w)
//    myTrie.insert(w)
//}
let input = "\(readLine()!)".uppercased().split{$0 == " "}.map(String.init).map { Int(String($0))! }
myTrie.M = input[0]
myTrie.N = input[1]
var table = [[String]]()
var bool_arr = [Bool]()
for j in 1...myTrie.N{
    bool_arr.append(false)
}

for _ in 1...myTrie.M {
    var aux = [String]()

    readLine()?.uppercased().split(separator: " ").map({
        if aux.count < myTrie.N {
          aux.append(String($0))
        }
    })
    myTrie.is_checked.append(bool_arr)
    table.append(aux)
}
myTrie.boggle = table
//myTrie.init_trie()
print("\nsalaaam\n")
//print(myTrie.is_checked)
let my_ans = temp_func_for_check(word: "man", i: 0, j: 0, trie: myTrie)
for mm in my_ans{
    print(mm)
}

//for i in 0...myTrie.M-1{
//    for j in 0...myTrie.N-1{
//        myTrie.is_checked[i][j] = true
//        print(table[i][j])
//
//
//        // body
//
//
//        myTrie.is_checked[i][j] = false
//    }
//}

//var  boggle:[[String]] = table
//print(myTrie.boggle[0][2])

//var ask = "\(readLine()!)"
//print(myTrie.query(ask))



//print("Enter names:")
//var words = readLine()
//var wrd = "\(words!)"
//let tmp = wrd.split(separator: " ")
////print(tmp[tmp.endIndex - 3])
//let mystr = "abcdefghijklmnopqrstuvwxyz"
//let ark = Array(mystr)
//print(ark)

//print(wrd.split(separator: " ")[1])

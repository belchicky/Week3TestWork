//
//  BruteForceOperation.swift
//  Week3TestWork
//
//  Created by Konstantins Belcickis on 28/04/2020.
//  Copyright © 2020 E-legion. All rights reserved.
//


import Foundation

class BruteForceOperation: Operation {
    
    private let characterArray = Consts.characterArray
    private var password: String
    private var startString: String
    private var endString: String
    public var result: String? {
        didSet {
            cancel()
        }
    }
    
    init(startString: String, endString: String, password: String) {
        self.startString = startString
        self.endString = endString
        self.password = password
    }
    
    override func main() {
        guard !isCancelled else { return }
        
        let inputPassword = password
        var startIndexArray = [Int]()
        var endIndexArray = [Int]()
        let maxIndexArray = characterArray.count
        
        
        for char in startString {
            for (index, value) in characterArray.enumerated() where value == "\(char)" {
                startIndexArray.append(index)
            }
        }
        
        for char in endString {
            for (index, value) in characterArray.enumerated() where value == "\(char)" {
                endIndexArray.append(index)
            }
        }
        
        var currentIndexArray = startIndexArray
        
        
        while  (!isCancelled) {
            
            
            let currentPass = self.characterArray[currentIndexArray[0]] +
                self.characterArray[currentIndexArray[1]] +
                self.characterArray[currentIndexArray[2]] +
                self.characterArray[currentIndexArray[3]]
            
            if inputPassword == currentPass {
                result = currentPass
            } else {
                if currentIndexArray.elementsEqual(endIndexArray + [1]) {
                    
                    result = "Error"
                    cancel()
                }
                
                for index in (0 ..< currentIndexArray.count).reversed() {
                    guard currentIndexArray[index] < maxIndexArray - 1 else {
                        currentIndexArray[index] = 0
                        continue
                    }
                    currentIndexArray[index] += 1
                    break
                }
            }
        }
    }
    
    
}

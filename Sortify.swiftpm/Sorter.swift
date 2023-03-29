//
//  SortingAlgs.swift
//  NCX
//
//  Created by Gaetano Celentano on 23/03/23.
//

import Foundation


class Sorter {
    
    func bubbleSort<T: Comparable>(_ array: inout [T]) {
        let n = array.count
        for i in 0..<n {
            for j in 1..<n-i {
                if array[j] < array[j-1] {
                    array.swapAt(j, j-1)
                }
            }
        }
    }
    
    func insertionSort<T: Comparable>(_ array: inout [T]){
        let n = array.count
        for i in 0..<n {
            var j = i
            while j > 0 && array[j-1] > array[j] {
                array.swapAt(j,j-1)
                j -= 1
            }
        }
    }
    
    func selectionSort<T: Comparable>(_ array: inout [T]){
        var min_idx = 0
        let n = array.count
        
        for i in 0..<n {
            min_idx = i
            for j in i+1..<n{
                if array[j] < array[min_idx]{
                    min_idx = j
                }
            }
            if min_idx != i {
                array.swapAt(min_idx, i)
            }
        }
        
    }
    
    func quickSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count/2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quickSort(less) + equal + quickSort(greater)
    }
    
    func mergeSort<T: Comparable>(_ array: inout [T], startIndex: Int, endIndex: Int){
        if startIndex >= endIndex {
            return
        }
        
        let middleIndex = (startIndex + endIndex) / 2
        mergeSort(&array, startIndex: startIndex, endIndex: middleIndex)
        mergeSort(&array, startIndex: middleIndex+1, endIndex: endIndex)
        merge(&array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
        
    }
    
    func merge<T:Comparable>(_ array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int){
        
        let leftSubarray = Array(array[startIndex...middleIndex])
        let rightSubarray = Array(array[middleIndex+1...endIndex])
        
        var index = startIndex
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
            if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
                array[index] = leftSubarray[leftIndex]
                leftIndex += 1
            }
            else {
                array[index] = rightSubarray[rightIndex]
                rightIndex += 1
            }
            index += 1
        }
        
        while leftIndex < leftSubarray.count {
            array[index] = leftSubarray[leftIndex]
            index += 1
            leftIndex += 1
        }
        
        while rightIndex < rightSubarray.count {
            array[index] = rightSubarray[rightIndex]
            index += 1
            rightIndex += 1
        }
        
        
    }
    
}

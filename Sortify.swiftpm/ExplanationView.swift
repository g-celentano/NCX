//
//  Explanation.swift
//  NCX
//
//  Created by Gaetano Celentano on 24/03/23.
//

import SwiftUI

struct Explanation: View {
    
    @State var array : Array<Int>
    @State var alg : String
    
    var body: some View {
            NavigationStack{
                switch(alg){
                case "Bubble Sort":
                    BubbleSort(array: array)
                case "Selection Sort":
                    SelectionSort(array: array)
                case "Insertion Sort":
                    InsertionSort(array: array)
                case "Merge Sort":
                    MergeSort(array: array)
                case "Quick Sort":
                    QuickSort(array: array)
                default:
                    EmptyView()
                }
            }
    }
}

struct Explanation_Previews: PreviewProvider {
    static var previews: some View {
        Explanation(array: [1,2,3], alg: "Bubble Sort")
    }
}

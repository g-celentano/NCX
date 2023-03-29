//
//  SwiftUIView.swift
//  
//
//  Created by Gaetano Celentano on 27/03/23.
//

import SwiftUI


struct MergeSort: View {
    @State var array: Array<Int>
    @State var arraySteps : [[Int]] = []
    @State var steps : Int = 0
    @State var sorted : [Int] = []
    @State var codeVisible : Bool = false
    @State var chevronRotation : Double = 0.0
    @State var activeSpaces : [Int] = []
    @State var indexes : [Int] = [8,7,5,3,2,0,6,1,4]
    
    
    var body: some View {
        NavigationView{
            GeometryReader{ proxy in
                
                let width = proxy.size.width
                let height = proxy.size.height
                VStack{
                    
                    ScrollViewReader{ reader in
                        ScrollView{
                            VStack{
                                Text("The **Merge Sort**  uses a recursive algorithm to achieve its results. The divide-and-conquer algorithm breaks down a big problem into smaller, more manageable pieces that look similar to the initial problem. It then solves these subproblems recursively and puts their solutions together to solve the original problem.\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Divide-and-conquer recursively solves subproblems; each subproblem must be smaller than the original problem, and each must have a base case. A divide-and-conquer algorithm has three parts:\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                VStack{
                                    HStack{
                                        Image(systemName: "1.circle.fill")
                                        Spacer()
                                        Text("Divide up the problem into a lot of smaller pieces of the same problem.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "2.circle.fill")
                                        Spacer()
                                        Text("Conquer the subproblems by recursively solving them. Solve the subproblems as base cases if they're small enough.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "3.circle.fill")
                                        Spacer()
                                        Text("To find the solutions to the original problem, combine the solutions of the subproblems.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                }
                                .font(Font.system(size: 18, design: .rounded))
                                .fontWeight(.bold)
                                HStack{
                                    Text("Source:")
                                    Link("simplilearn", destination: URL(string: "https://www.simplilearn.com/tutorials/data-structure-tutorial/merge-sort-algorithm")! )
                                }
                                .font(.caption)
                                
                                Text("\nHow does it work?")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Think of it as a recursive algorithm continuously splits the array in half until it cannot be further divided. This means that if the array becomes empty or has only one element left, the dividing will stop, i.e. it is the base case to stop the recursion. If the array has multiple elements, split the array into halves and recursively invoke the merge sort on each of the halves. Finally, when both halves are sorted, the merge operation is applied. Merge operation is the process of taking two smaller sorted arrays and combining them to eventually make a larger one.")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                
                                HStack{
                                    Text("Source:")
                                    Link("GeeksForGeeks", destination: URL(string: "https://www.geeksforgeeks.org/merge-sort/")! )
                                }
                                .font(.caption)
                                
                                
                                HStack{
                                    
                                    Text("\nSwift Implementation")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .rotationEffect(Angle(degrees: chevronRotation))
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                    
                                }
                                .font(.title)
                                .background(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    withAnimation{
                                        codeVisible.toggle()
                                        if codeVisible {
                                            chevronRotation = 90.0
                                        } else {
                                            chevronRotation = 0.0
                                        }
                                    }
                                }
                                
                                
                                VStack{
                                    
                                    Text("**func** _mergeSort_<T: Comparable>(_ _array_: **inout** [T], \n\t_startIndex_: **Int**, _endIndex_: **Int**)\n{\n\tif startIndex >= endIndex {\n\t\treturn\n\t}\n\tlet middleIndex = (startIndex + \n\t\tendIndex) / 2\n\n\tmergeSort(&array, \n\t\tstartIndex: startIndex, \n\t\tendIndex: middleIndex)\n\n\tmergeSort(&array, \n\t\tstartIndex: middleIndex+1, \n\t\tendIndex: endIndex)\n\n\tmerge(&array, \n\t\tstartIndex: \n\t\tstartIndex, \n\t\tmiddleIndex: middleIndex, \n\t\tendIndex: endIndex)\n}")
                                        .frame(width: width*0.8, alignment: .leading)
                                        .font(Font.system(.title3, design: .monospaced))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(uiColor: .systemGray6)).shadow(radius: 4, x: 3, y: 3))
                                    
                                    
                                    Text("**func** _merge_<T: Comparable>(_ _array_: **inout** [T], \n\t_startIndex_: **Int**, _middleIndex_: **Int**, _endIndex_: **Int**)\n{\n\t**let** leftSubArr = **Array**(\n\t array[startIndex...middleIndex])\n\t**let** rightSubArr = **Array**(\n\t array[middleIndex+1, endIndex])\n\n\t**var** index = startIndex\n\t**var** leftIndex = 0\n\t**var**rightIndex = 0\n\n\t**while** leftIndex < \n\t leftSubbArr._count &&_ \n\t rightIndex < rightSubArr._count_\n\t{\n\t\t**if** leftSubArr[leftIndex] <\n\t\t rightSubArr[rightIndex] {\n\t\t\tarray[index] = \n\t\t\t leftSubArr[leftIndex]\n\t\t\tleftIndex+=1\n\t\t}\n\t\t**else** {\n\t\t\tarray[index] = \n\t\t\t rightSubArr[rightIndex]\n\t\t\trightIndex+=1\n\t\t}\n\n\t\t**while** leftIndex < \n\t\tleftSubArr._count_ {\n\t\t\tarray[index] =\n\t\t\t leftSubArr[leftIndex]\n\t\t\tindex+=1\n\t\t\tleftIndex+=1\n\t\t}\n\n\t\t**while** rightIndex < \n\t\trightSubArr._count_ {\n\t\t\tarray[index] =\n\t\t\t rightSubArr[rightIndex]\n\t\t\tindex+=1\n\t\t\trightIndex+=1\n\t\t} \n}")
                                        .frame(width: width*0.8, alignment: .leading)
                                        .font(Font.system(.title3, design: .monospaced))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(uiColor: .systemGray6)).shadow(radius: 4, x: 3, y: 3))
                                }
                                .frame(maxWidth: width*0.8, maxHeight: codeVisible ? .infinity : height*0.1)
                                
                                /*Text("Visual Example")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Now you will see step by step how the merge sort works.")// to sort in ascending order the array generated before.")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                */
                            }
                            .frame(width: width*0.9)
                            
                            
                            

                            
                            
                        }
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    let unsorted = array 
                    mergeSort(&array, startIndex: 0, endIndex: array.count - 1)
                    sorted = arraySteps.popLast() ?? []
                    arraySteps.append(unsorted)
                    arraySteps = arraySteps.reversed()
                }
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }
        .navigationTitle(Text("Merge Sort"))
        .navigationViewStyle(StackNavigationViewStyle())


        
    }
    
    
    
        
    func mergeSort(_ array: inout [Int], startIndex: Int, endIndex: Int){
        if startIndex >= endIndex {
            return
        }
        
        let middleIndex = (startIndex + endIndex) / 2
        mergeSort(&array, startIndex: startIndex, endIndex: middleIndex)
        mergeSort(&array, startIndex: middleIndex+1, endIndex: endIndex)
        merge(&array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
        
    }
    
    func merge(_ array: inout [Int], startIndex: Int, middleIndex: Int, endIndex: Int){
        
        let leftSubarray = Array(array[startIndex...middleIndex])
        let rightSubarray = Array(array[middleIndex+1...endIndex])
        arraySteps.append(leftSubarray)
        arraySteps.append(rightSubarray)
        
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

struct MergeSort_Previews: PreviewProvider {
    static var previews: some View {
        MergeSort(array: [19,2,1,42,22,99,12,56,73,10])
    }
}

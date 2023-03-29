//
//  SwiftUIView.swift
//  
//
//  Created by Gaetano Celentano on 27/03/23.
//

import SwiftUI

struct SelectionSort: View {
    @State var array: Array<Int>
    @State var arraySteps : [[Int]] = []
    @State var steps : Int = 0
    @State var codeVisible : Bool = false
    @State var chevronRotation : Double = 0.0
    
    
    var body: some View {
        NavigationView{
            GeometryReader{ proxy in
                
                let width = proxy.size.width
                let height = proxy.size.height
                VStack{
                    ScrollViewReader{ reader in
                        ScrollView{
                            VStack{
                                Text("The **selection sort** algorithm is a simple, yet effective sorting algorithm. A selection-based sorting algorithm is described as an in-place comparison-based algorithm that divides the list into two parts, the sorted part on the left and the unsorted part on the right. Initially, the sorted section is empty, and the unsorted section contains the entire list. When sorting a small list, selection sort can be used.\n\nIn the selection sort, the cost of swapping is irrelevant, and all elements must be checked. The cost of writing to memory matters in selection sort, just as it does in flash memory (the number of writes/swaps is O(n) as opposed to O(n2) in bubble sort).\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("How does it work?")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Selection sort works by taking the smallest element in an unsorted array and bringing it to the front. You’ll go through each item (from left to right) until you find the smallest one. The first item in the array is now sorted, while the rest of the array is unsorted.")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Text("Source:")
                                    Link("simplilearn", destination: URL(string: "https://www.simplilearn.com/tutorials/data-structure-tutorial/selection-sort-algorithm")! )
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
                                .background(.white)
                                .font(.title)
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
                                    Text("**func** _selectionSort_<T: Comparable>(_ _array_: **inout** [T]){\n\t**var** min_idx = 0\n\t**let** n = array.count\n\t**for** i **in** 0..<n {\n\t\tmin_idx = i\n\t\t**for** j **in** i+1..<n {\n\t\t\t**if** array[j] < \n\t\t\t\tarray[min_idx] {\n\t\t\t\t min_idx = j\n\t\t\t}\n\t\t}\n\t\t**if** min_idx != i {\n\t\t\tarray._swapAt_(min_idx,i)\n\t\t}   \n\t}\n}")
                                        .frame(maxWidth: width*0.8, alignment: .leading)
                                        .font(Font.system(size: width*0.025, design: .monospaced))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(uiColor: .systemGray6)).shadow(radius: 4, x: 3, y: 3))
                                }
                                .frame(maxHeight: codeVisible ? .infinity : height * 0.1)
                                
                                Text("Visual Example")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Now you will see step by step how the selection sort works to sort in ascending order the array generated before")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .frame(width: width*0.9)
                            
                            if arraySteps.count != 0{
                                VStack{
                                    HStack{
                                        
                                        let arr = arraySteps[steps]
                                        let diff = steps >= 1 ? getDifference(arr, arraySteps[steps-1]) : []
                                        
                                        ForEach(0..<arr.count, id: \.self){ index in
                                            VStack{
                                                Text(String(arr[index]))
                                                    .font(Font.system(size: width*0.045, weight: .regular, design: .rounded))
                                                    .frame(width: width*0.06)
                                                    .padding(width*0.0095)
                                                    .background(LinearGradient(colors: [
                                                        Color(uiColor: .white),
                                                        diff.contains(index) && steps != arraySteps.count - 1 ?
                                                        Color(uiColor: .systemBlue) :
                                                            Color(uiColor: .systemRed)
                                                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    .clipShape(Circle())
                                                    .foregroundColor(.black)
                                                
                                            }
                                            
                                        }
                                    }
                                }
                                Button {
                                    withAnimation{
                                        if steps < arraySteps.count - 1{
                                            steps += 1
                                        }
                                    }
                                } label: {
                                    if steps != arraySteps.count - 1{
                                        Text("Next Step")
                                    } else {
                                        Text("Done")
                                    }
                                }
                                .font(.title2)
                                .disabled(steps == arraySteps.count - 1)
                                .padding()
                                
                                
                            }
                            
                            
                        }
                    }
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    var min_idx = 0
                    let n = array.count
                    arraySteps.append(array)
                    
                    for i in 0..<n {
                        min_idx = i
                        for j in i+1..<n{
                            if array[j] < array[min_idx]{
                                min_idx = j
                            }
                        }
                        if min_idx != i {
                            array.swapAt(min_idx, i)
                            arraySteps.append(array)
                        }
                    }
                }
                
            }
        }
        .navigationTitle(Text("Selection Sort"))
    }
}

struct SelectionSort_Previews: PreviewProvider {
    static var previews: some View {
        SelectionSort(array: [2,23,1,3,2,1,3,22])
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Gaetano Celentano on 25/03/23.
//

import SwiftUI

struct BubbleSort: View {
    
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
                                Text("**Bubble Sort** is a basic algorithm for arranging an array of numbers or other elements in the correct order. The method works by examining each set of adjacent elements in the array, from left to right, switching their positions if they are out of order. The algorithm then repeats this process until it can run through the entire string and find no two elements that need to be swapped.\n")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title3)
                                
                                
                                Text("If it's simple, why is it used?")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Because it is the simplest type of sorting algorithm, bubble sort does not get used much in real-world computer science.\nIts most common uses for programmers include the following:\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                VStack{
                                    Spacer()
                                    HStack{
                                        Image(systemName: "1.circle.fill")
                                        Text("A way to learn basic sorting")
                                            .font(Font.system(size: 18, design: .rounded))
                                            .fontWeight(.bold)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    HStack{
                                        Image(systemName: "2.circle.fill")
                                        Text("A methodology for sorting tiny datasets")
                                            .fontWeight(.bold)
                                            .font(Font.system(size: 18, design: .rounded))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    HStack{
                                        Image(systemName: "3.circle.fill")
                                        Text("A sorting methodology for datasets that are mostly in order already")
                                            .font(Font.system(size: 18, design: .rounded))
                                            .fontWeight(.bold)
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                }
                                HStack{
                                    Text("Source:")
                                    Link("Product Plan", destination: URL(string: "https://www.productplan.com/glossary/bubble-sort/")! )
                                }
                                .font(.caption)
                                
                                
                                HStack{
                                    
                                    Text("\nSwift Implementation")
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .rotationEffect(Angle(degrees: chevronRotation))
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                        .padding(.trailing)
                                    
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
                                    Text("**func** _bubbleSort_<T: Comparable>(_ _array_: **inout** [T]){\n\t**let** n = array.count\n\t**for** i **in** 0..<n {\n\t\t**for** j **in** 1..< n-i {\n\t\t\t**if** array[j] < array[j-1] {\n\t\t\t\tarray._swapAt_(j,j-1)\n\t\t\t}\n\t\t}\n\t}\n}")
                                        .frame(maxWidth: width*0.8, alignment: .leading)
                                        .font(Font.system(.title3, design: .monospaced))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(uiColor: .systemGray6)).shadow(radius: 4, x: 3, y: 3))
                                }
                                .frame(maxHeight: codeVisible ? .infinity : height * 0.1)
                                
                                Text("Visual Example")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Now you will see step by step how the bubble sort works to sort in ascending order the array generated before")
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
                    let n = array.count
                    arraySteps.append(array)
                    for i in 0..<n {
                        for j in 1..<n-i {
                            if array[j] < array[j-1] {
                                array.swapAt(j, j-1)
                                arraySteps.append(array)
                            }
                        }
                    }
                }
                
            }
        }
        .navigationTitle(Text("Bubble Sort"))
    }
    
    
}

struct BubbleSort_Previews: PreviewProvider {
    static var previews: some View {
        BubbleSort(array: [11,87,88,99,5,6,7,8,9,10])
    }
}

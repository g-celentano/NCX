//
//  SwiftUIView.swift
//  
//
//  Created by Gaetano Celentano on 27/03/23.
//

import SwiftUI

struct InsertionSort: View {
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
                                Text("**Insertion sort** is a simple sorting algorithm that works similar to the way you sort playing cards in your hands. The array is virtually split into a sorted and an unsorted part. Values from the unsorted part are picked and placed at the correct position in the sorted part.\n")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Characteristics of Insertion Sort:\n")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                VStack{
                                    HStack{
                                        Image(systemName: "1.circle.fill")
                                        Spacer()
                                        Text("This algorithm is one of the simplest algorithm with simple implementation")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "2.circle.fill")
                                        Spacer()
                                        Text("Basically, Insertion sort is efficient for small data values")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "3.circle.fill")
                                        Spacer()
                                        Text("Insertion sort is adaptive in nature, i.e. it is appropriate for data sets which are already partially sorted.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                }
                                .fontWeight(.bold)
                                Spacer()
                                HStack{
                                    Text("Source:")
                                    Link("GeeksForGeeks", destination: URL(string: "https://www.geeksforgeeks.org/insertion-sort/")! )
                                }
                                .font(.caption)
                                
                                HStack{
                                    
                                    Text("\nSwift Implementation")
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .rotationEffect(Angle(degrees: chevronRotation))
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                    Spacer()
                                    
                                    
                                }
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
                                    Text("**func** _insertionSort_<T: Comparable>(_ _array_: **inout** [T]){\n\t**let** n = array.count\n\t**for** i **in** 0..<n {\n\t\t**var** j = i\n\t\t**while** j > 0 _&&_ \n\t\tarray[j-1] > array[j] {\n\t\t\tarray._swapAt_(j,j-1)\n\t\t\tj -= 1\n\t\t}\n\t}\n}")
                                        .frame(maxWidth: width*0.8, alignment: .leading)
                                        .font(Font.system(.title3, design: .monospaced))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(uiColor: .systemGray6)).shadow(radius: 4, x: 3, y: 3))
                                }
                                .frame(maxHeight: codeVisible ? .infinity : height*0.1)
                                
                                
                                Text("Visual Example")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Now you will see step by step how the selection sort works to sort in ascending order the array generated before")
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
                        var j = i
                        while j > 0 && array[j-1] > array[j] {
                            array.swapAt(j,j-1)
                            arraySteps.append(array)
                            j -= 1
                        }
                    }
                }
                
            }
        }
        .navigationTitle(Text("Insertion Sort"))    }
}

struct InsertionSort_Previews: PreviewProvider {
    static var previews: some View {
        InsertionSort(array: [99,3,5,11,2,1])
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Gaetano Celentano on 27/03/23.
//

import SwiftUI


struct QuickSort: View {
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
                                Text("**Quicksort** is a highly efficient sorting technique that divides a large data array into smaller ones. A vast array is divided into two arrays, one containing values smaller than the provided value, say pivot, on which the partition is based. The other contains values greater than the pivot value.\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("To sort an array, you will follow the steps below:\n")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                VStack{
                                    HStack{
                                        Image(systemName: "1.circle.fill")
                                        Spacer()
                                        Text("You will make any index value in the array as a pivot.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "2.circle.fill")
                                        Spacer()
                                        Text("Then you will partition the array according to the pivot.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "3.circle.fill")
                                        Spacer()
                                        Text("Then you will recursively quicksort the left partition")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    Spacer()
                                    HStack{
                                        Image(systemName: "4.circle.fill")
                                        Spacer()
                                        Text("After that, you will recursively quicksort the correct partition.")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                }
                                .font(Font.system(size: 18, design: .rounded))
                                .fontWeight(.bold)
                                HStack{
                                    Text("Source:")
                                    Link("simplilearn", destination: URL(string: "https://www.simplilearn.com/tutorials/data-structure-tutorial/quick-sort-algorithm")! )
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
                                    
                                    
                                    
                                    
                                    Text("**func** _quickSort_<T: Comparable>(_ _array_: **inout** [T])\n{\n\t**guard** array._count_ > 1 \n\t **else** { return array }\n\t**let** pivot = array[ array._count_/2 ]\n\t**let** less = array._filter_{ **$0** < pivot }\n\t**let**equal = array.filter { **$0** == pivot }\n\t**let** greater = array.filter {**$0** > pivot } \n}")
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
                   
                }
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }
        .navigationTitle(Text("Quick Sort"))
        .navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
    
    
}

struct QuickSort_Previews: PreviewProvider {
    static var previews: some View {
        QuickSort(array: [19,2,1,42,22,99,12,56,73,10])
    }
}

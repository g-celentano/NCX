import SwiftUI

/// an app that show visually one data structure and how different algorithms affect it

extension Text {
    public func gridButton(width: CGFloat, height: CGFloat, disabled: Bool) -> some View {
        return self
            .frame(width:  width, height: height)
            .padding()
            .background(disabled ? Color(uiColor: .systemRed).opacity(0.5) : Color(uiColor: .systemRed))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10, x: 0, y: 10)
    }
}

func getDifference(_ first: Array<Int>, _ second: Array<Int>) -> Array<Int>{
    var diff : [Int] = []
    for i in 0..<first.count {
        if first[i] != second[i]{
            diff.append(i)
        }
    }
    return diff
}




struct ContentView: View {
    
    var sorter = Sorter()
    @State var array : [Int] = []
    @State var sortedArray : [Int] = []
    @State var selected : String = ""
    let clock = ContinuousClock()
    @State var time : Duration = Duration(secondsComponent: 0, attosecondsComponent: 0)
    @State var notation : String = ""
    @State var disabled = false
    @State var firstOpen = true
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ proxy in
                let screen_width = proxy.size.width
                let screen_height = proxy.size.height
                
                VStack {
                    VStack{
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(0..<sortedArray.count, id: \.self){ index in
                                    Text(String(sortedArray[index]))
                                        .font(Font.system(size: screen_width*0.045, weight: .regular, design: .rounded))
                                        .padding(screen_width*0.025)
                                        .frame(width: screen_width*0.11)
                                        .background(LinearGradient(colors: [ Color(uiColor: .white),Color(uiColor: .systemRed)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .clipShape(Circle())
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.top, screen_height*0.05)
                        }
                        .padding(.horizontal)
                        .scrollIndicators(.hidden)
                        
                        Spacer()
                        
                        Text("Used Algorithm: \(selected)")
                            .font(Font.system(size: screen_width*0.05, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        Text("Big O Notation: \(notation)")
                            .font(Font.system(size: screen_width*0.05, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        Text("Execution Time: \(time.description)")
                            .font(Font.system(size: screen_width*0.05, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.bottom, screen_height*0.001)
                        
                        NavigationLink(destination: Explanation(array: array, alg: selected)) {
                            HStack{
                                Text("Explanation")
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                            }
                            .font(Font.system(size: screen_width*0.065, weight: .regular, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.bottom)
                        }
                        .disabled(selected == "")
                        .foregroundColor(selected == "" ? Color(uiColor: .systemRed).opacity(0.3) : Color(uiColor: .systemRed) )
                        
                        
                        
                        
                        
                    }
                    .frame(width: screen_width*0.98, height: screen_height*0.45)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3))
                    .cornerRadius(10)
                    .padding(.top, screen_height*0.02)
                    
                    
                    Spacer()
                    
                    
                    VStack{
                        HStack{
                            Text("Bubble Sort")
                                .font(Font.system(size: screen_width*0.035, weight: .regular, design: .rounded))
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: disabled)
                                .onTapGesture {
                                    disabled = true
                                    selected = "Bubble Sort"
                                    notation = "O(n^2)"
                                    time = clock.measure{
                                        sorter.bubbleSort(&sortedArray)
                                    }
                                }
                                .disabled(disabled)
                                
                            
                            Text("Generate Array")
                                .font(Font.system(size: screen_width*0.035, weight: .bold, design: .rounded))
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: false)
                                .onTapGesture {
                                    disabled = false
                                    selected = ""
                                    notation = ""
                                    time = Duration(secondsComponent: 0, attosecondsComponent: 0)
                                    
                                    array = []
                                    for _ in 0..<10{
                                        let n = Int.random(in: 0..<99)
                                        array.append(n)
                                    }
                                    sortedArray = array
                                }
                            
                            Text("Insertion Sort")
                                .font(Font.system(size: screen_width*0.035, weight: .regular, design: .rounded))
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: disabled)
                                .onTapGesture {
                                    disabled = true
                                    selected = "Insertion Sort"
                                    notation = "O(n^2)"
                                    time = clock.measure {
                                        sorter.insertionSort(&sortedArray)
                                    }
                                }
                                .disabled(disabled)
                            
                        }
                        
                        HStack{
                            
                            Text("Selection Sort")
                                .font(Font.system(size: screen_width*0.035, weight: .regular, design: .rounded))
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: disabled)
                                .onTapGesture {
                                    disabled = true
                                    selected = "Selection Sort"
                                    notation = "O(n^2)"
                                    time = clock.measure{
                                        sorter.selectionSort(&sortedArray)
                                    }
                                }
                                .disabled(disabled)
                        
                            Text("Merge Sort")
                                .font(Font.system(size: screen_width*0.035, weight: .regular, design: .rounded)) 
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: disabled)
                                .onTapGesture {
                                    disabled = true
                                    selected = "Merge Sort"
                                    notation = "O(n*log(n))"
                                    time = clock.measure{
                                        sorter.mergeSort(&sortedArray, startIndex: 0, endIndex: sortedArray.count-1)
                                    }
                                }
                                .disabled(disabled)
                           
                            Text("Quick Sort")
                                .font(Font.system(size: screen_width*0.035, weight: .regular, design: .rounded)) 
                                .gridButton(width:  screen_width*0.2, height: screen_width*0.12, disabled: disabled)
                                .onTapGesture {
                                    disabled = true
                                    selected = "Quick Sort"
                                    notation = "O(log(n))"
                                    time = clock.measure{
                                        sortedArray = sorter.quickSort(sortedArray)
                                    }
                                }
                                .disabled(disabled)

                        }
                        .padding(.vertical)
                    }
                    .padding(.bottom, screen_height*0.05)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    if firstOpen {
                        firstOpen = false
                        for _ in 0..<10{
                            let n = Int.random(in: 0..<99)
                            array.append(n)
                        }
                        sortedArray = array
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

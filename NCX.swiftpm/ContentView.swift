import SwiftUI

/// an app that show visually one data structure and how different algorithms affect it
///

extension Button {
    public func gridButton(width: CGFloat, height: CGFloat, disabled: Bool) -> some View {
        return self
            .frame(width:  width, height: height)
            .padding()
            .background(disabled ? Color(uiColor: .systemRed).opacity(0.5) : Color(uiColor: .systemRed))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10, x: 0, y: 10)
            .disabled(disabled)
    }
}

@available(iOS 16.0, *)
struct ContentView: View {
    
    var sorter = Sorter()
    @State var array : [Int] = []
    @State var selected : String = ""
    let clock = ContinuousClock()
    @State var time : Duration = Duration(secondsComponent: 0, attosecondsComponent: 0)
    @State var notation : String = ""
    @State var disabled = false
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ proxy in
                let screen_width = proxy.size.width
                let screen_height = proxy.size.height
                
                VStack {
                    VStack{
                        
                        ScrollView(.horizontal){
                            HStack{
                                    ForEach(0..<array.count, id: \.self){ index in
                                        Text(String(array[index]))
                                            .font(.title2)
                                            .padding(screen_width*0.013)
                                            .frame(width: screen_width*0.1)
                                            .background(LinearGradient(colors: [ Color(uiColor: .white),Color(uiColor: .systemRed)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .clipShape(Circle())
                                            .foregroundColor(.black)
                                    }
                            }
                            .padding(.top, screen_height*0.02)
                        }
                        .padding(.horizontal)
                        .scrollIndicators(.hidden)
                        
                        Spacer()
                        
                        Text("Used Algorithm: \(selected)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        Text("Big O Notation: \(notation)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        Text("Execution Time: \(time.description)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.bottom, screen_height*0.001)
                        
                        NavigationLink(destination: Explanation(array: array, alg: selected)) {
                            HStack{
                                Text("Explanation")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.bottom)
                        }
                        .disabled(selected == "")
                        .foregroundColor(selected == "" ? Color(uiColor: .systemRed).opacity(0.3) : Color(uiColor: .systemRed) )
                        
                        
                        
                        
                        
                    }
                    .frame(width: screen_width*0.98, height: screen_height*0.3)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3))
                    .cornerRadius(10)
                    .padding(.top, screen_height*0.02)
                    
                    
                    Spacer()
                    
                    
                    VStack{
                        HStack{
                            Button {
                                disabled = true
                                selected = "Bubble Sort"
                                notation = "O(n^2)"
                                time = clock.measure{
                                    sorter.bubbleSort(&array)
                                }
                            } label: {
                                Text("Bubble Sort")
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: disabled)
                            
                            
                            Button {
                                disabled = false
                                selected = ""
                                notation = ""
                                time = Duration(secondsComponent: 0, attosecondsComponent: 0)
                                array = []
                                for _ in 0..<10{
                                    let n = Int.random(in: 0..<100)
                                    array.append(n)
                                }
                            } label: {
                                Text("Generate Array")
                                    .fontWeight(.bold)
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: false)
                            
                            Button {
                                disabled = true
                                selected = "Insertion Sort"
                                notation = "O(n^2)"
                                time = clock.measure {
                                    sorter.insertionSort(&array)
                                }
                            } label: {
                                Text("Insertion Sort")
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: disabled)
                            
                        }
                        
                        HStack{
                            
                            Button {
                                disabled = true
                                selected = "Selection Sort"
                                notation = "O(n^2)"
                                time = clock.measure{
                                    sorter.selectionSort(&array)
                                }
                            } label: {
                                Text("Selection Sort")
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: disabled)
                            
                            Button {
                                disabled = true
                                selected = "Merge Sort"
                                notation = "O(n*log(n))"
                                time = clock.measure{
                                    sorter.mergeSort(&array, startIndex: 0, endIndex: array.count-1)
                                }
                            } label: {
                                Text("Merge Sort")
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: disabled)
                            
                            Button {
                                disabled = true
                                selected = "Quick Sort"
                                notation = "O(log(n))"
                                time = clock.measure{
                                    array = sorter.quickSort(array)
                                }
                            } label: {
                                Text("Quick Sort")
                            }
                            .gridButton(width:  screen_width*0.2, height: screen_width*0.11, disabled: disabled)
                        }
                        .padding(.vertical)
                    }
                    .padding(.bottom, screen_height*0.05)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    for _ in 0..<10{
                        let n = Int.random(in: 0..<100)
                        array.append(n)
                    }
                }
            }
        }
        
    }
}

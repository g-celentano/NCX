# Sortify
A Swift Playground project that explains how some of the existing sorting algorithms work on an array( of integers in this case).

## Sorting algorithms present in the application
- Insertion Sort
- Quick Sort
- Merge Sort
- Bubble Sort
- Selection Sort

### What does the application do?

Other than showing the sorting of the array, the app tells also the Big-O Notation of that particular algorithm, with also how much time it took to execute. In addition to that, there are also the explanations for the algorithms present in the app, with a little interaction to better understand the selected algorithm (just for the simpler ones for the moment).

### How are the visualizations done?

For the more straightforward sorting algorithms, the visualization process involves informing the user of the elements that are being manipulated in each step. This is achieved through a function that tracks the indices involved in the swapping phase, allowing for the identification of the elements that are affected and notifying the user accordingly.

The function used to get the differences between two steps is: <br>


```swift
func getDifference<T: Comparable>(_ first: Array<T>, _ second: Array<T>) -> Array<Int>{
    var diff : [Int] = []
    for i in 0..<first.count {
        if first[i] != second[i]{
            diff.append(i)
        }
    }
    return diff
}
```
And then the differences are highlighetd by using different colors in the background of the interested elements:

```swift
HStack{
                                        
      let arr = arraySteps[steps] // getting the current step
      let diff = steps >= 1 ? getDifference(arr, arraySteps[steps-1]) : [] // getting the differences between the current and the previous step

      ForEach(0..<arr.count, id: \.self){ index in
          VStack{
              Text(String(arr[index]))
                  .font(Font.system(size: width*0.045, weight: .regular, design: .rounded))
                  .frame(width: width*0.06)
                  .padding(width*0.0095)
                  .background(LinearGradient(colors: [
                      Color(uiColor: .white),
                      diff.contains(index) && steps != arraySteps.count - 1 ? // <- ternary operator to check which indices are involved in the swapping
                      Color(uiColor: .systemBlue) : Color(uiColor: .systemRed) // color selections based on the condition of the ternary operator
                  ], startPoint: .topLeading, endPoint: .bottomTrailing))
                  .clipShape(Circle())
                  .foregroundColor(.black)

          }

      }

  }
}
```

### Screenshots from the app

<img src="https://user-images.githubusercontent.com/111139129/228561566-00d7d0e4-0c5e-40e4-8994-7690903ffc23.png" width = "30%" height="30%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/111139129/228561557-2fa54224-a160-4d2d-8cef-0a2f8a81dac8.png" width = "30%" height="30%"> <br> <br> <img src="https://user-images.githubusercontent.com/111139129/228561547-f3db1ba8-df45-445d-b6a5-cdc9ae563813.png" width = "30%" height="30%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/111139129/228561526-99481c05-145c-4c5b-8b23-1ab3d4111cc8.png" width = "30%" height="30%" >

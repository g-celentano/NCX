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
        if #available(iOS 16.0, *) {
            NavigationStack{
                Text(alg)
                ForEach(0..<array.count, id: \.self) { index in
                    Text(String(array[index]))
                }
            }
        } else {
            NavigationView {
                Text(alg)
                ForEach(0..<array.count, id: \.self) { index in
                    Text(String(array[index]))
                }
            }
        }
    }
}

struct Explanation_Previews: PreviewProvider {
    static var previews: some View {
        Explanation(array: [1,2,3], alg: "Bubble Sort")
    }
}

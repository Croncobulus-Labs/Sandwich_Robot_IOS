//
//  ContentView.swift
//  Shared
//
//  Created by nate wert on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 10)
            
            if messageText != "" {
                Text(messageText)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button(action: {
                messageText = "attempting to make a sandwich"
                Task {
                    messageText = await NetworkCalls.makeSandwich()
                }
            }, label: {
                Text("Make A Sandwich")
                    .padding()
                    .background(.green)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: {
                messageText = "attempting to refill machine"
                Task {
                    messageText = await NetworkCalls.refillContainers()
                }
            }, label: {
                Text("Refill Machine")
                    .padding()
                    .background(.red)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: {
                messageText = "attempting to close the door"
                Task {
                    messageText = await NetworkCalls.doneRefill()
                }
            }, label: {
                Text("Finish Refill")
                    .padding()
                    .background(.yellow)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            })
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

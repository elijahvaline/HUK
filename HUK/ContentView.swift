//
//  ContentView.swift
//  HUK
//
//  Created by Elijah Valine on 8/9/22.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    @State var scene: SCNScene? = .init(named: "monkey.scn")
    var body: some View {
        VStack{
            Text("Monkey")
            CustomSceneView(scene: $scene)
        }
       
           
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Object Recognizer
//
//  Created by Jeffrey Zhou on 8/12/22.
//

import SwiftUI

struct ContentView: View
{
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("Hello World")
                VStack
                {
                    ZStack
                    {
                        Rectangle().fill(.secondary)
                        Text("Tap to select a photo")
                            .foregroundColor(.white)
                            .font(.headline)
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture(perform: selectImage)
                }
                .padding([.horizontal, .bottom])
                .onChange(of: inputImage){ _ in loadImage() }
                .sheet(isPresented: $showingImagePicker)
                {
                    ImagePicker(image: $inputImage)
                }
            }
        }
    }
    
    func selectImage()
    {
        showingImagePicker = true
        
    }
    
    func loadImage()
    {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

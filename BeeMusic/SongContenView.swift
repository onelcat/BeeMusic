//
//  SongContenView.swift
//  BeeMusic
//
//  Created by flqy on 2020/12/17.
//

import SwiftUI


struct Blur: UIViewRepresentable {
    
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
    
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}

struct SongContenView: View {

    @State private var isAnimating = false

    @State private var showProgress = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        
        NavigationView {
            ZStack {

                Image("ty")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VisualEffectView(effect: UIBlurEffect(style: .light))
                    .edgesIgnoringSafeArea(.all)

                Image("ty")
//                    .resizable()
//                    .frame(width: 230, height: 230, alignment: .center)
                    .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
//                    .animation(self.isAnimating ? foreverAnimation : .none)
                    .onAppear{
                        self.isAnimating = true
                    }
            }

            
        }
        .navigationBarTitle("Navigation", displayMode: .inline)
        
        

    }
}

struct SongContenView_Previews: PreviewProvider {
    static var previews: some View {
        SongContenView()
    }
}

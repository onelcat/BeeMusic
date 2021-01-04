//
//  SongContenView.swift
//  BeeMusic
//
//  Created by flqy on 2020/12/17.
//

import SwiftUI
import UIKit

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

private
extension SongContenView {

}


struct SongContenView: View {
    let url = URL(string: "http://music.163.com/song/media/outer/url?id=1399694841.mp3")!
//    1399694841
//    let player: Player = Player.shared
    
    @State private var isAnimating = false

    @State private var showProgress = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 5.0)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        
        // 数据依赖逻辑
        
        ZStack {

            Image("ty")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            //  加上模糊效果
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)

            
            Button(action: buttonAction) {
                Image("ty")
                    .resizable()
                    .frame(width: 230, height: 230, alignment: .center)
                    .cornerRadius(115)
                    .rotationEffect(self.isAnimating ? .init(degrees: 360) : .init(degrees: 0))
                    .animation(self.isAnimating ? foreverAnimation : .none)
                    .onAppear{
                        withAnimation {
                            self.isAnimating = true
                        }
                    }
            }
        }
        .onAppear{
//            self.player.play(url: url)
//            self.player.play()
        }
        .navigationBarTitle("正在播放", displayMode: .inline)
    }
    
    func buttonAction() {
        debugPrint("点击按钮")
    }
    
}

struct SongContenView_Previews: PreviewProvider {
    static var previews: some View {
        SongContenView()
    }
}

//
//  IG_storyview.swift
//  Instagram_UI
//
//  Created by jo on 27/12/24.
//

import SwiftUI

struct IG_StoryModel{
    let id: Int
    let islive : Bool
    let username : String
    let avatar : String
}


struct IG_storyview: View {
    
    @State var isLive :Bool = false
    @Binding var isStoryPosted :Bool
    @State var user_name : String
    var body: some View {
        ZStack {
          
            VStack {
                Profileview(isStoryPosted: $isStoryPosted,size: .large)
                if isLive {
                    Text("Live")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,2)
                        .padding(.horizontal,2)
                        .background(
                            Color.pink
                                .cornerRadius(5)
                        )
                        .padding(.top, -17)
                    
                        .overlay( // Overlay for a white border
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2)
                                .padding(.top, -17)
                        )
                    
                }
                
                Text(user_name)
                    .font(.caption)
                    .frame(maxWidth: 62)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            }
            .frame(width: 62,height: 82)
        }
    }
}

#Preview {
    IG_storyview(isLive: true,isStoryPosted: .constant(true),user_name: "IG_USER")
    
    IG_storyview(isLive: false,isStoryPosted: .constant(false), user_name: "IG_USER")
}

struct Profileview: View {
    @Binding var isStoryPosted : Bool
    var size : ImageSize = .large
  
    var body: some View {
        Image("User_profile_image")
            .resizable()
            .frame(width: size.imageSize,height: size.imageSize)
            .aspectRatio(contentMode: .fit)
            .overlay {
                Circle()
                    .stroke(isStoryPosted ? Color.pink : Color.white,
                            lineWidth: size.borderWidth)
                    .frame(width: size.overlaySize,height: size.overlaySize)
            }
    }
}
enum ImageSize {
    case small
    case medium
    case large
    
    var imageSize :CGFloat {
        switch self {
        case .small:
            return 17
        case .medium:
            return 32
        case .large:
            return 62
        }
    }
    
    var overlaySize: CGFloat {
            imageSize + 6 // Border adds extra space
        }
        
        var borderWidth: CGFloat {
            2 // Fixed width for simplicity
        }
}

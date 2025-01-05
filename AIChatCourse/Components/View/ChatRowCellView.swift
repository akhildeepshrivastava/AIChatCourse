//
//  ChatRowCellView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var headline: String? = "Alpha"
    var imageName: String? = Constants.randomImage
    var subHdadline: String? = "This is the last message in the chat"
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                
                if let subHdadline {
                    Text(subHdadline)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)

        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
            
            ChatRowCellView(hasNewChat: false)
            
            ChatRowCellView()
            
            ChatRowCellView()
            
            ChatRowCellView()
        }
    }
   
}

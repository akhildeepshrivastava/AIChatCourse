//
//  ButtonViewModifiers.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//

import SwiftUI

struct HighlightButtomStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accentColor.opacity(0.4) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
           
    }
}


struct PressableButtomStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
           
    }
}

enum ButtonStyleOoption {
    case highlight
    case pressable
    case plain
}

extension View {
    
    @ViewBuilder
    func anyButton(_ option : ButtonStyleOoption = .plain ,action: @escaping () -> Void) -> some View {
        switch option {
            case .highlight:
            self.highLightButton(action: action)
        case .pressable:
            self.pressableButton(action: action)
        case .plain:
            self.plainButton(action: action)
        }
    }
      
    private func plainButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    
    
    private func highLightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HighlightButtomStyle())
    }
    
    private func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtomStyle())
    }
}

#Preview {
    VStack {
        Text("Hello World")
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(.highlight) {
                
            }
            .padding()
        
        Text("Hello World")
            .callToActionButton()
            .anyButton(.pressable) {
                
            }
            .padding()
        
        Text("Hello World")
            .callToActionButton()
            .anyButton() {
                
            }
            .padding()
    }
}

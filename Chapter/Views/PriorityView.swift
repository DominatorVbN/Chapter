//
//  PriorityView.swift
//  Chapter
//
//  Created by Amit Samant on 15/04/25.
//

import SwiftUI

struct PriorityView: View {
    let priority: Note.Priority
    
    var text: String {
        switch priority {
        case .high:
            return "high"
        case .normal:
            return "normal"
        case .low:
            return "low"
        }
    }
    
    var foregroundColor: Color {
        switch priority {
        case .high:
            return .white
        case .normal:
            return .black
        case .low:
            return .black
        }
    }
    
    var color: Color {
        switch priority {
        case .high:
            return Color.red
        case .normal:
            return Color.yellow
        case .low:
            return Color.white
        }
    }
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .bold()
            .fontDesign(.rounded)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(foregroundColor)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(color.gradient)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(style: .init(lineWidth: 2))
                            .opacity(0.5)
                            .foregroundStyle(foregroundColor)
                    })
            }
    }
    
    
}

#Preview("High") {
    PriorityView(priority: .high)
}

#Preview("Normal") {
    PriorityView(priority: .normal)
}

#Preview("Low") {
    PriorityView(priority: .low)
}

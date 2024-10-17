//
//  MiauFonts.swift
//  catto
//
//  Created by Cris Messias on 17/06/24.
//

import SwiftUI

// MARK: Heading
struct MiauHeadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("InknutAntiqua-Medium", size: 22))
    }
}
extension View {
    func heading() -> some View {
        self.modifier(MiauHeadingModifier())
    }
}

// MARK: Title
struct MiauTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("InknutAntiqua-Medium", size: 16))
    }
}
extension View {
    func title() -> some View {
        self.modifier(MiauTitleModifier())
    }
}

// MARK: Subtitle
struct MiauSubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("InknutAntiqua-Medium", size: 14))
    }
}
extension View {
    func subtitle() -> some View {
        self.modifier(MiauSubtitleModifier())
    }
}

// MARK: Button
struct MiauButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("InknutAntiqua-Medium", size: 14))
    }
}
extension View {
    func bodyButton() -> some View {
        self.modifier(MiauButtonModifier())
    }
}

// MARK: Body
struct MiauBodyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Regular", size: 14))
    }
}
extension View {
    func body() -> some View {
        self.modifier(MiauBodyModifier())
    }
}

// MARK: Body Bold
struct MiauBodyBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Bold", size: 14))
    }
}
extension View {
    func bodyBold() -> some View {
        self.modifier(MiauBodyBoldModifier())
    }
}

// MARK: Label
struct MiauLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Regular", size: 12))
    }
}
extension View {
    func label() -> some View {
        self.modifier(MiauLabelModifier())
    }
}

// MARK: Label Bold
struct MiauLabelBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Bold", size: 12))
    }
}
extension View {
    func labelBold() -> some View {
        self.modifier(MiauLabelBoldModifier())
    }
}

// MARK: Caption
struct MiauCaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Bold", size: 10))
    }
}
extension View {
    func caption() -> some View {
        self.modifier(MiauCaptionModifier())
    }
}


#Preview {
    VStack(spacing: 16){
        Text("Heading")
            .heading()
            .foregroundStyle(.textPrimaryLight)
        Text("Title")
            .title()
            .foregroundStyle(.textPrimaryLight)
        Text("Subtitle")
            .subtitle()
            .foregroundStyle(.textSecondary)
        Text("Button")
            .bodyButton()
            .foregroundStyle(.textButton)
            .padding(8)
            .background(.bgButton)
        Text("Body")
            .body()
            .foregroundStyle(.textPrimaryLight)
        Text("Body Bold")
            .bodyBold()
            .foregroundStyle(.textSecondary)
        Text("Label")
            .label()
            .foregroundStyle(.textPrimaryLight)
        Text("Label Bold")
            .labelBold()
            .foregroundStyle(.textSecondary)
        Text("Caption")
            .caption()
            .foregroundStyle(.textSecondary)
    }
}

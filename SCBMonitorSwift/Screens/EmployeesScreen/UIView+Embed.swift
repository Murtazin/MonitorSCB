//
//  UIView+Embed.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 12.07.2022.
//

import UIKit

extension UIView {

    struct EmbedInsets {
        let top: CGFloat?
        let left: CGFloat?
        let right: CGFloat?
        let bottom: CGFloat?

        init(top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) {
            self.top = top
            self.bottom = bottom
            self.left = left
            self.right = right
        }

        static let zero: EmbedInsets = EmbedInsets(top: 0, bottom: 0, left: 0, right: 0)
        static func all(_ distance: CGFloat) -> EmbedInsets { EmbedInsets(top: distance, bottom: distance, left: distance, right: distance) }
    }

    func embed(in container: UIView, using layoutGuide: UILayoutGuide? = nil, insets: EmbedInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)

        if let top = insets.top {
            self.topAnchor.constraint(equalTo: layoutGuide?.topAnchor ?? container.topAnchor, constant: top).isActive = true
        }
        if let bottom = insets.bottom {
            self.bottomAnchor.constraint(equalTo: layoutGuide?.bottomAnchor ?? container.bottomAnchor, constant: -bottom).isActive = true
        }
        if let leading = insets.left {
            self.leadingAnchor.constraint(equalTo: layoutGuide?.leadingAnchor ?? container.leadingAnchor, constant: leading).isActive = true
        }
        if let trailing = insets.right {
            self.trailingAnchor.constraint(equalTo: layoutGuide?.trailingAnchor ?? container.trailingAnchor, constant: -trailing).isActive = true
        }
    }
}

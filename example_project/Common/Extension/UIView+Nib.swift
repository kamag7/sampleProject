//
//  UIView+Nib.swift
//  example_project
//
//  Created by magdalena.skawinska on 12/11/2019.
//  Copyright © 2019 magdalena.skawinska. All rights reserved.
//

//import Foundation
import UIKit

extension Bundle {

    public static func nibView<V: UIView>(for viewType: V.Type, owner: Any? = nil) -> V? {
        let bundle = Bundle(for: viewType)
        return UINib(nibName: String(describing: viewType), bundle: bundle).instantiate(withOwner: owner, options: nil).first as? V
    }

    public static func nib<V: UIView>(for viewType: V.Type, owner: Any? = nil) -> UINib? {
        let bundle = Bundle(for: viewType)
        return UINib(nibName: String(describing: viewType), bundle: bundle)
    }
}


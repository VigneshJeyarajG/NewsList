//
//  ReusableView.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.

import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

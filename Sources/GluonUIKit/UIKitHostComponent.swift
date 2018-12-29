//
//  UIKitHostComponent.swift
//  GluonUIKit
//
//  Created by Max Desiatov on 29/12/2018.
//

import Gluon
import UIKit

public protocol UIKitHostComponent: AnyHostComponent {
  static func mountTarget(to parent: UIKitTarget,
                          props: AnyEquatable,
                          children: AnyEquatable) -> UIKitTarget?

  static func update(target: UIKitTarget,
                     props: AnyEquatable,
                     children: AnyEquatable)

  static func unmount(target: UIKitTarget)
}

extension UIKitHostComponent {
  static func targetAssertionFailure(_ function: String = #function) {
    typeAssertionFailure("target", function)
  }

  static func childrenAssertionFailure(_ function: String = #function) {
    typeAssertionFailure("children", function)
  }

  static func propsAssertionFailure(_ function: String = #function) {
    typeAssertionFailure("props", function)
  }

  static func parentAssertionFailure(_ function: String = #function) {
    typeAssertionFailure("parent target", function)
  }

  private static func typeAssertionFailure(_ type: String, _ function: String) {
    assertionFailure("""
    UIKitHostComponent passed unsupported \(type) type in \(function)
    """)
  }
}

//
//  AnyOptional.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

/// Allows to match for optionals with generics that are defined as non-optional.
public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}
extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

extension Optional where Wrapped == String {
    public var isNilOrEmpty: Bool { self?.isEmpty ?? true }
}


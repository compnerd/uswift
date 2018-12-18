
public protocol OptionSet : RawRepresentable {
  associatedtype Element = Self
  init(rawValue: RawValue)
}


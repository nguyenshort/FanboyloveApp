// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CounterBase: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CounterBase on Counter {
      __typename
      id
      name
      scope
      value
    }
    """

  public static let possibleTypes: [String] = ["Counter"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(CounterName.self))),
      GraphQLField("scope", type: .nonNull(.scalar(CounterScope.self))),
      GraphQLField("value", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: CounterName, scope: CounterScope, value: Int) {
    self.init(unsafeResultMap: ["__typename": "Counter", "id": id, "name": name, "scope": scope, "value": value])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Tên kiểu thống kê
  public var name: CounterName {
    get {
      return resultMap["name"]! as! CounterName
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// Phạm vi thống kê
  public var scope: CounterScope {
    get {
      return resultMap["scope"]! as! CounterScope
    }
    set {
      resultMap.updateValue(newValue, forKey: "scope")
    }
  }

  /// Số lượt
  public var value: Int {
    get {
      return resultMap["value"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }
}

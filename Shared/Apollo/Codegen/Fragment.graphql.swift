// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct BaseStory: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BaseStory on Story {
      __typename
      id
      name
      avatar
      slug
    }
    """

  public static let possibleTypes: [String] = ["Story"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
      GraphQLField("slug", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, avatar: String, slug: String) {
    self.init(unsafeResultMap: ["__typename": "Story", "id": id, "name": name, "avatar": avatar, "slug": slug])
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

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var avatar: String {
    get {
      return resultMap["avatar"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }

  public var slug: String {
    get {
      return resultMap["slug"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slug")
    }
  }
}

public struct StoryCounter: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment StoryCounter on Story {
      __typename
      ...BaseStory
      content
      counter {
        __typename
        name
        id
        scope
        value
      }
    }
    """

  public static let possibleTypes: [String] = ["Story"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(BaseStory.self),
      GraphQLField("content", type: .nonNull(.scalar(String.self))),
      GraphQLField("counter", type: .nonNull(.list(.nonNull(.object(Counter.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var content: String {
    get {
      return resultMap["content"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "content")
    }
  }

  public var counter: [Counter] {
    get {
      return (resultMap["counter"] as! [ResultMap]).map { (value: ResultMap) -> Counter in Counter(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Counter) -> ResultMap in value.resultMap }, forKey: "counter")
    }
  }

  public var fragments: Fragments {
    get {
      return Fragments(unsafeResultMap: resultMap)
    }
    set {
      resultMap += newValue.resultMap
    }
  }

  public struct Fragments {
    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var baseStory: BaseStory {
      get {
        return BaseStory(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }
  }

  public struct Counter: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Counter"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(CounterName.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("scope", type: .nonNull(.scalar(CounterScope.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: CounterName, id: GraphQLID, scope: CounterScope, value: Int) {
      self.init(unsafeResultMap: ["__typename": "Counter", "name": name, "id": id, "scope": scope, "value": value])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
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

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
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
}

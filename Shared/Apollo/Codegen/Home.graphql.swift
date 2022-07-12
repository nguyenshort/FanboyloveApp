// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class HomeTopViewQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeTopView($filter: GetStoriesFilter!) {
      stories(filter: $filter) {
        __typename
        ...BaseStory
      }
    }
    """

  public let operationName: String = "HomeTopView"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BaseStory.fragmentDefinition)
    return document
  }

  public var filter: GetStoriesFilter

  public init(filter: GetStoriesFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("stories", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(Story.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stories: [Story]) {
      self.init(unsafeResultMap: ["__typename": "Query", "stories": stories.map { (value: Story) -> ResultMap in value.resultMap }])
    }

    public var stories: [Story] {
      get {
        return (resultMap["stories"] as! [ResultMap]).map { (value: ResultMap) -> Story in Story(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Story) -> ResultMap in value.resultMap }, forKey: "stories")
      }
    }

    public struct Story: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Story"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(BaseStory.self),
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
    }
  }
}

public final class HomeEndStoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeEndStory($filter: GetStoriesFilter!) {
      stories(filter: $filter) {
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
    }
    """

  public let operationName: String = "HomeEndStory"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BaseStory.fragmentDefinition)
    return document
  }

  public var filter: GetStoriesFilter

  public init(filter: GetStoriesFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("stories", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(Story.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stories: [Story]) {
      self.init(unsafeResultMap: ["__typename": "Query", "stories": stories.map { (value: Story) -> ResultMap in value.resultMap }])
    }

    public var stories: [Story] {
      get {
        return (resultMap["stories"] as! [ResultMap]).map { (value: ResultMap) -> Story in Story(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Story) -> ResultMap in value.resultMap }, forKey: "stories")
      }
    }

    public struct Story: GraphQLSelectionSet {
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
  }
}

public final class SomeStoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SomeStories($filter: SomeStoriesFilter!) {
      someStories(filter: $filter) {
        __typename
        ...BaseStory
      }
    }
    """

  public let operationName: String = "SomeStories"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BaseStory.fragmentDefinition)
    return document
  }

  public var filter: SomeStoriesFilter

  public init(filter: SomeStoriesFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("someStories", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(SomeStory.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(someStories: [SomeStory]) {
      self.init(unsafeResultMap: ["__typename": "Query", "someStories": someStories.map { (value: SomeStory) -> ResultMap in value.resultMap }])
    }

    public var someStories: [SomeStory] {
      get {
        return (resultMap["someStories"] as! [ResultMap]).map { (value: ResultMap) -> SomeStory in SomeStory(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SomeStory) -> ResultMap in value.resultMap }, forKey: "someStories")
      }
    }

    public struct SomeStory: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Story"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(BaseStory.self),
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
    }
  }
}

public final class CountStoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CountStories($filter: CountStoriesFilter!) {
      countStories(filter: $filter)
    }
    """

  public let operationName: String = "CountStories"

  public var filter: CountStoriesFilter

  public init(filter: CountStoriesFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("countStories", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countStories: Int) {
      self.init(unsafeResultMap: ["__typename": "Query", "countStories": countStories])
    }

    public var countStories: Int {
      get {
        return resultMap["countStories"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "countStories")
      }
    }
  }
}

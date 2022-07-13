// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetChaptersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChapters($filter: GetChaptersFilter!) {
      chapters(filter: $filter) {
        __typename
        id
        ...ChapterBase
        counter {
          __typename
          ...CounterBase
        }
        order
        createdAt
      }
    }
    """

  public let operationName: String = "GetChapters"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ChapterBase.fragmentDefinition)
    document.append("\n" + CounterBase.fragmentDefinition)
    return document
  }

  public var filter: GetChaptersFilter

  public init(filter: GetChaptersFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("chapters", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(Chapter.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(chapters: [Chapter]) {
      self.init(unsafeResultMap: ["__typename": "Query", "chapters": chapters.map { (value: Chapter) -> ResultMap in value.resultMap }])
    }

    public var chapters: [Chapter] {
      get {
        return (resultMap["chapters"] as! [ResultMap]).map { (value: ResultMap) -> Chapter in Chapter(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Chapter) -> ResultMap in value.resultMap }, forKey: "chapters")
      }
    }

    public struct Chapter: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Chapter"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLFragmentSpread(ChapterBase.self),
          GraphQLField("counter", type: .nonNull(.list(.nonNull(.object(Counter.selections))))),
          GraphQLField("order", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      public var order: Int {
        get {
          return resultMap["order"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "order")
        }
      }

      public var createdAt: Double {
        get {
          return resultMap["createdAt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
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

        public var chapterBase: ChapterBase {
          get {
            return ChapterBase(unsafeResultMap: resultMap)
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
            GraphQLFragmentSpread(CounterBase.self),
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

          public var counterBase: CounterBase {
            get {
              return CounterBase(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct ChapterBase: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ChapterBase on Chapter {
      __typename
      id
      name
      slug
      avatar
    }
    """

  public static let possibleTypes: [String] = ["Chapter"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("slug", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatar", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, slug: String, avatar: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Chapter", "id": id, "name": name, "slug": slug, "avatar": avatar])
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

  public var slug: String {
    get {
      return resultMap["slug"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slug")
    }
  }

  public var avatar: String? {
    get {
      return resultMap["avatar"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }
}

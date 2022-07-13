// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetStoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetStory($slug: String!) {
      story(slug: $slug) {
        __typename
        ...StoryBase
        id
        content
        name
        categories {
          __typename
          ...CategoryBase
        }
        status
        teams
        updatedAt
        avatar
        authors
        createdAt
        counter {
          __typename
          ...CounterBase
        }
      }
    }
    """

  public let operationName: String = "GetStory"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + StoryBase.fragmentDefinition)
    document.append("\n" + CategoryBase.fragmentDefinition)
    document.append("\n" + CounterBase.fragmentDefinition)
    return document
  }

  public var slug: String

  public init(slug: String) {
    self.slug = slug
  }

  public var variables: GraphQLMap? {
    return ["slug": slug]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("story", arguments: ["slug": GraphQLVariable("slug")], type: .nonNull(.object(Story.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(story: Story) {
      self.init(unsafeResultMap: ["__typename": "Query", "story": story.resultMap])
    }

    public var story: Story {
      get {
        return Story(unsafeResultMap: resultMap["story"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "story")
      }
    }

    public struct Story: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Story"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(StoryBase.self),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("categories", type: .nonNull(.list(.nonNull(.object(Category.selections))))),
          GraphQLField("status", type: .nonNull(.scalar(StoryStatus.self))),
          GraphQLField("teams", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("authors", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var categories: [Category] {
        get {
          return (resultMap["categories"] as! [ResultMap]).map { (value: ResultMap) -> Category in Category(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Category) -> ResultMap in value.resultMap }, forKey: "categories")
        }
      }

      public var status: StoryStatus {
        get {
          return resultMap["status"]! as! StoryStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var teams: String {
        get {
          return resultMap["teams"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "teams")
        }
      }

      public var updatedAt: Double {
        get {
          return resultMap["updatedAt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
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

      public var authors: String {
        get {
          return resultMap["authors"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "authors")
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

        public var storyBase: StoryBase {
          get {
            return StoryBase(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Category"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CategoryBase.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "slug": slug])
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

          public var categoryBase: CategoryBase {
            get {
              return CategoryBase(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
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

public struct StoryBase: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment StoryBase on Story {
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

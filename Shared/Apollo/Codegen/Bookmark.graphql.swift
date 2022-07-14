// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetBookmarkersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetBookmarkers($filter: GetBookmarksFilter!) {
      bookmarks(filter: $filter) {
        __typename
        id
        createdAt
        user {
          __typename
          ...UserBase
        }
      }
    }
    """

  public let operationName: String = "GetBookmarkers"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserBase.fragmentDefinition)
    return document
  }

  public var filter: GetBookmarksFilter

  public init(filter: GetBookmarksFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("bookmarks", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(Bookmark.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bookmarks: [Bookmark]) {
      self.init(unsafeResultMap: ["__typename": "Query", "bookmarks": bookmarks.map { (value: Bookmark) -> ResultMap in value.resultMap }])
    }

    public var bookmarks: [Bookmark] {
      get {
        return (resultMap["bookmarks"] as! [ResultMap]).map { (value: ResultMap) -> Bookmark in Bookmark(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Bookmark) -> ResultMap in value.resultMap }, forKey: "bookmarks")
      }
    }

    public struct Bookmark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bookmark"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: Double, user: User) {
        self.init(unsafeResultMap: ["__typename": "Bookmark", "id": id, "createdAt": createdAt, "user": user.resultMap])
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

      public var createdAt: Double {
        get {
          return resultMap["createdAt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserBase.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String, avatar: String? = nil, uid: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "slug": slug, "avatar": avatar, "uid": uid])
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

          public var userBase: UserBase {
            get {
              return UserBase(unsafeResultMap: resultMap)
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

public final class CheckBookmarkQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CheckBookmark($input: CheckBookmarkFilter!) {
      bookmark(input: $input) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CheckBookmark"

  public var input: CheckBookmarkFilter

  public init(input: CheckBookmarkFilter) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("bookmark", arguments: ["input": GraphQLVariable("input")], type: .object(Bookmark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bookmark: Bookmark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "bookmark": bookmark.flatMap { (value: Bookmark) -> ResultMap in value.resultMap }])
    }

    public var bookmark: Bookmark? {
      get {
        return (resultMap["bookmark"] as? ResultMap).flatMap { Bookmark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "bookmark")
      }
    }

    public struct Bookmark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bookmark"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Bookmark", "id": id])
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
    }
  }
}

public final class ToogleBookmarkMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ToogleBookmark($input: ToggleBookmarkInput!) {
      toogleBookmark(input: $input) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "ToogleBookmark"

  public var input: ToggleBookmarkInput

  public init(input: ToggleBookmarkInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("toogleBookmark", arguments: ["input": GraphQLVariable("input")], type: .object(ToogleBookmark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toogleBookmark: ToogleBookmark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "toogleBookmark": toogleBookmark.flatMap { (value: ToogleBookmark) -> ResultMap in value.resultMap }])
    }

    public var toogleBookmark: ToogleBookmark? {
      get {
        return (resultMap["toogleBookmark"] as? ResultMap).flatMap { ToogleBookmark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "toogleBookmark")
      }
    }

    public struct ToogleBookmark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bookmark"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Bookmark", "id": id])
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
    }
  }
}

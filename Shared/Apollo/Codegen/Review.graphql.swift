// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetReviewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetReviews($input: GetReviewsFilter!) {
      reviews(input: $input) {
        __typename
        id
        rating
        createdAt
        content
        user {
          __typename
          id
          ...UserBase
        }
      }
    }
    """

  public let operationName: String = "GetReviews"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserBase.fragmentDefinition)
    return document
  }

  public var input: GetReviewsFilter

  public init(input: GetReviewsFilter) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("reviews", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.list(.nonNull(.object(Review.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(reviews: [Review]) {
      self.init(unsafeResultMap: ["__typename": "Query", "reviews": reviews.map { (value: Review) -> ResultMap in value.resultMap }])
    }

    public var reviews: [Review] {
      get {
        return (resultMap["reviews"] as! [ResultMap]).map { (value: ResultMap) -> Review in Review(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Review) -> ResultMap in value.resultMap }, forKey: "reviews")
      }
    }

    public struct Review: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("rating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, rating: Int, createdAt: Double, content: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "Review", "id": id, "rating": rating, "createdAt": createdAt, "content": content, "user": user.resultMap])
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

      public var rating: Int {
        get {
          return resultMap["rating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "rating")
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

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
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
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
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

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

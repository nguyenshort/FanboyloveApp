// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct UserBase: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserBase on User {
      __typename
      id
      name
      slug
      avatar
      uid
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("slug", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatar", type: .scalar(String.self)),
      GraphQLField("uid", type: .nonNull(.scalar(String.self))),
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

  /// Firebase ID
  public var uid: String {
    get {
      return resultMap["uid"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "uid")
    }
  }
}

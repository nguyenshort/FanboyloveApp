// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Nếu truyền story thì sẽ là public query
public struct GetBookmarksFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limit
  ///   - offset
  ///   - sort: Sắp xếp của bình luận
  ///   - story
  public init(limit: Int, offset: Int, sort: String, story: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["limit": limit, "offset": offset, "sort": sort, "story": story]
  }

  public var limit: Int {
    get {
      return graphQLMap["limit"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var offset: Int {
    get {
      return graphQLMap["offset"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "offset")
    }
  }

  /// Sắp xếp của bình luận
  public var sort: String {
    get {
      return graphQLMap["sort"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort")
    }
  }

  public var story: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["story"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "story")
    }
  }
}

public struct CheckBookmarkFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - story
  public init(story: GraphQLID) {
    graphQLMap = ["story": story]
  }

  public var story: GraphQLID {
    get {
      return graphQLMap["story"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "story")
    }
  }
}

public struct ToggleBookmarkInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - story
  public init(story: GraphQLID) {
    graphQLMap = ["story": story]
  }

  public var story: GraphQLID {
    get {
      return graphQLMap["story"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "story")
    }
  }
}

public struct GetChaptersFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limit
  ///   - offset
  ///   - sort: Sắp xếp của bình luận
  ///   - story
  public init(limit: Swift.Optional<Int?> = nil, offset: Swift.Optional<Int?> = nil, sort: Swift.Optional<String?> = nil, story: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["limit": limit, "offset": offset, "sort": sort, "story": story]
  }

  public var limit: Swift.Optional<Int?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var offset: Swift.Optional<Int?> {
    get {
      return graphQLMap["offset"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "offset")
    }
  }

  /// Sắp xếp của bình luận
  public var sort: Swift.Optional<String?> {
    get {
      return graphQLMap["sort"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort")
    }
  }

  public var story: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["story"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "story")
    }
  }
}

public struct GetStoriesFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - authors
  ///   - category
  ///   - limit
  ///   - offset
  ///   - sort: To sort in counter use syntax: "{name}-{socpe}"
  ///   - status: Filter by status
  ///   - teams
  ///   - user
  public init(authors: Swift.Optional<String?> = nil, category: Swift.Optional<GraphQLID?> = nil, limit: Int, offset: Int, sort: String, status: Swift.Optional<[StoryStatus]?> = nil, teams: Swift.Optional<String?> = nil, user: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["authors": authors, "category": category, "limit": limit, "offset": offset, "sort": sort, "status": status, "teams": teams, "user": user]
  }

  public var authors: Swift.Optional<String?> {
    get {
      return graphQLMap["authors"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authors")
    }
  }

  public var category: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var limit: Int {
    get {
      return graphQLMap["limit"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var offset: Int {
    get {
      return graphQLMap["offset"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "offset")
    }
  }

  /// To sort in counter use syntax: "{name}-{socpe}"
  public var sort: String {
    get {
      return graphQLMap["sort"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort")
    }
  }

  /// Filter by status
  public var status: Swift.Optional<[StoryStatus]?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<[StoryStatus]?> ?? Swift.Optional<[StoryStatus]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var teams: Swift.Optional<String?> {
    get {
      return graphQLMap["teams"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "teams")
    }
  }

  public var user: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["user"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }
}

public enum StoryStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case drop
  case end
  case onGoing
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DROP": self = .drop
      case "END": self = .end
      case "ON_GOING": self = .onGoing
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .drop: return "DROP"
      case .end: return "END"
      case .onGoing: return "ON_GOING"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: StoryStatus, rhs: StoryStatus) -> Bool {
    switch (lhs, rhs) {
      case (.drop, .drop): return true
      case (.end, .end): return true
      case (.onGoing, .onGoing): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [StoryStatus] {
    return [
      .drop,
      .end,
      .onGoing,
    ]
  }
}

public enum CounterName: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case bookmark
  case countChapters
  case review
  case reviewScore
  case view
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BOOKMARK": self = .bookmark
      case "COUNT_CHAPTERS": self = .countChapters
      case "REVIEW": self = .review
      case "REVIEW_SCORE": self = .reviewScore
      case "VIEW": self = .view
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .bookmark: return "BOOKMARK"
      case .countChapters: return "COUNT_CHAPTERS"
      case .review: return "REVIEW"
      case .reviewScore: return "REVIEW_SCORE"
      case .view: return "VIEW"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CounterName, rhs: CounterName) -> Bool {
    switch (lhs, rhs) {
      case (.bookmark, .bookmark): return true
      case (.countChapters, .countChapters): return true
      case (.review, .review): return true
      case (.reviewScore, .reviewScore): return true
      case (.view, .view): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CounterName] {
    return [
      .bookmark,
      .countChapters,
      .review,
      .reviewScore,
      .view,
    ]
  }
}

public enum CounterScope: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case day
  case month
  case total
  case `weak`
  case year
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DAY": self = .day
      case "MONTH": self = .month
      case "TOTAL": self = .total
      case "WEAK": self = .weak
      case "YEAR": self = .year
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .day: return "DAY"
      case .month: return "MONTH"
      case .total: return "TOTAL"
      case .weak: return "WEAK"
      case .year: return "YEAR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CounterScope, rhs: CounterScope) -> Bool {
    switch (lhs, rhs) {
      case (.day, .day): return true
      case (.month, .month): return true
      case (.total, .total): return true
      case (.weak, .weak): return true
      case (.year, .year): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CounterScope] {
    return [
      .day,
      .month,
      .total,
      .weak,
      .year,
    ]
  }
}

public struct SomeStoriesFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - authors
  ///   - category
  ///   - size
  ///   - status: Filter by status
  ///   - teams
  ///   - user
  public init(authors: Swift.Optional<String?> = nil, category: Swift.Optional<GraphQLID?> = nil, size: Int, status: Swift.Optional<[StoryStatus]?> = nil, teams: Swift.Optional<String?> = nil, user: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["authors": authors, "category": category, "size": size, "status": status, "teams": teams, "user": user]
  }

  public var authors: Swift.Optional<String?> {
    get {
      return graphQLMap["authors"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authors")
    }
  }

  public var category: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var size: Int {
    get {
      return graphQLMap["size"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }

  /// Filter by status
  public var status: Swift.Optional<[StoryStatus]?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<[StoryStatus]?> ?? Swift.Optional<[StoryStatus]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var teams: Swift.Optional<String?> {
    get {
      return graphQLMap["teams"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "teams")
    }
  }

  public var user: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["user"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }
}

public struct CountStoriesFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - authors
  ///   - category
  ///   - status: Filter by status
  ///   - teams
  ///   - user
  public init(authors: Swift.Optional<String?> = nil, category: Swift.Optional<GraphQLID?> = nil, status: Swift.Optional<[StoryStatus]?> = nil, teams: Swift.Optional<String?> = nil, user: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["authors": authors, "category": category, "status": status, "teams": teams, "user": user]
  }

  public var authors: Swift.Optional<String?> {
    get {
      return graphQLMap["authors"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authors")
    }
  }

  public var category: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  /// Filter by status
  public var status: Swift.Optional<[StoryStatus]?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<[StoryStatus]?> ?? Swift.Optional<[StoryStatus]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var teams: Swift.Optional<String?> {
    get {
      return graphQLMap["teams"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "teams")
    }
  }

  public var user: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["user"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }
}

public struct GetReviewsFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limit
  ///   - offset
  ///   - sort: Sắp xếp của bình luận
  ///   - story
  ///   - user
  public init(limit: Int, offset: Int, sort: String, story: Swift.Optional<GraphQLID?> = nil, user: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["limit": limit, "offset": offset, "sort": sort, "story": story, "user": user]
  }

  public var limit: Int {
    get {
      return graphQLMap["limit"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var offset: Int {
    get {
      return graphQLMap["offset"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "offset")
    }
  }

  /// Sắp xếp của bình luận
  public var sort: String {
    get {
      return graphQLMap["sort"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort")
    }
  }

  public var story: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["story"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "story")
    }
  }

  public var user: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["user"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }
}

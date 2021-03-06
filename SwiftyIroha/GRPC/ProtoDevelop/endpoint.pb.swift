// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: endpoint.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Iroha_Protocol_TxStatus: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case statelessValidationFailed // = 0
  case statelessValidationSuccess // = 1
  case statefulValidationFailed // = 2
  case statefulValidationSuccess // = 3
  case committed // = 4
  case mstExpired // = 5
  case notReceived // = 6
  case UNRECOGNIZED(Int)

  init() {
    self = .statelessValidationFailed
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .statelessValidationFailed
    case 1: self = .statelessValidationSuccess
    case 2: self = .statefulValidationFailed
    case 3: self = .statefulValidationSuccess
    case 4: self = .committed
    case 5: self = .mstExpired
    case 6: self = .notReceived
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .statelessValidationFailed: return 0
    case .statelessValidationSuccess: return 1
    case .statefulValidationFailed: return 2
    case .statefulValidationSuccess: return 3
    case .committed: return 4
    case .mstExpired: return 5
    case .notReceived: return 6
    case .UNRECOGNIZED(let i): return i
    }
  }

}

struct Iroha_Protocol_ToriiResponse: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".ToriiResponse"

  var txStatus: Iroha_Protocol_TxStatus = .statelessValidationFailed

  var txHash: Data = SwiftProtobuf.Internal.emptyData

  var errorMessage: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.txStatus)
      case 2: try decoder.decodeSingularBytesField(value: &self.txHash)
      case 3: try decoder.decodeSingularStringField(value: &self.errorMessage)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.txStatus != .statelessValidationFailed {
      try visitor.visitSingularEnumField(value: self.txStatus, fieldNumber: 1)
    }
    if !self.txHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.txHash, fieldNumber: 2)
    }
    if !self.errorMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.errorMessage, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct Iroha_Protocol_TxStatusRequest: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".TxStatusRequest"

  var txHash: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.txHash)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.txHash, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "iroha.protocol"

extension Iroha_Protocol_TxStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "STATELESS_VALIDATION_FAILED"),
    1: .same(proto: "STATELESS_VALIDATION_SUCCESS"),
    2: .same(proto: "STATEFUL_VALIDATION_FAILED"),
    3: .same(proto: "STATEFUL_VALIDATION_SUCCESS"),
    4: .same(proto: "COMMITTED"),
    5: .same(proto: "MST_EXPIRED"),
    6: .same(proto: "NOT_RECEIVED"),
  ]
}

extension Iroha_Protocol_ToriiResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_status"),
    2: .standard(proto: "tx_hash"),
    3: .standard(proto: "error_message"),
  ]

  func _protobuf_generated_isEqualTo(other: Iroha_Protocol_ToriiResponse) -> Bool {
    if self.txStatus != other.txStatus {return false}
    if self.txHash != other.txHash {return false}
    if self.errorMessage != other.errorMessage {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Iroha_Protocol_TxStatusRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_hash"),
  ]

  func _protobuf_generated_isEqualTo(other: Iroha_Protocol_TxStatusRequest) -> Bool {
    if self.txHash != other.txHash {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

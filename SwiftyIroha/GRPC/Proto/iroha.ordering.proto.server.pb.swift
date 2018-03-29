/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: ordering.proto
 *
 */

/*
 * Copyright 2017, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation
import Dispatch
import gRPC
import SwiftProtobuf

/// Type for errors thrown from generated server code.
internal enum Iroha_Ordering_Proto_OrderingGateTransportGrpcServerError : Error {
  case endOfStream
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider {
  func onproposal(request : Iroha_Ordering_Proto_Proposal, session : Iroha_Ordering_Proto_OrderingGateTransportGrpconProposalSession) throws -> Google_Protobuf_Empty
}

/// Common properties available in each service session.
internal class Iroha_Ordering_Proto_OrderingGateTransportGrpcSession {
  fileprivate var handler : gRPC.Handler
  internal var requestMetadata : Metadata { return handler.requestMetadata }

  internal var statusCode : Int = 0
  internal var statusMessage : String = "OK"
  internal var initialMetadata : Metadata = Metadata()
  internal var trailingMetadata : Metadata = Metadata()

  fileprivate init(handler:gRPC.Handler) {
    self.handler = handler
  }
}

// onProposal (Unary)
internal class Iroha_Ordering_Proto_OrderingGateTransportGrpconProposalSession : Iroha_Ordering_Proto_OrderingGateTransportGrpcSession {
  private var provider : Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Iroha_Ordering_Proto_Proposal(serializedData:requestData)
        let replyMessage = try self.provider.onproposal(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}


/// Main server for generated service
internal class Iroha_Ordering_Proto_OrderingGateTransportGrpcServer {
  private var address: String
  private var server: gRPC.Server
  private var provider: Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider?

  /// Create a server that accepts insecure connections.
  internal init(address:String,
              provider:Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    self.server = gRPC.Server(address:address)
  }

  /// Create a server that accepts secure connections.
  internal init?(address:String,
               certificateURL:URL,
               keyURL:URL,
               provider:Iroha_Ordering_Proto_OrderingGateTransportGrpcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    guard
      let certificate = try? String(contentsOf: certificateURL, encoding: .utf8),
      let key = try? String(contentsOf: keyURL, encoding: .utf8)
      else {
        return nil
    }
    self.server = gRPC.Server(address:address, key:key, certs:certificate)
  }

  /// Start the server.
  internal func start(queue:DispatchQueue = DispatchQueue.global()) {
    guard let provider = self.provider else {
      assert(false) // the server requires a provider
    }
    server.run {(handler) in
      print("Server received request to " + handler.host
        + " calling " + handler.method
        + " from " + handler.caller
        + " with " + String(describing:handler.requestMetadata) )

      do {
        switch handler.method {
        case "/iroha.ordering.proto.OrderingGateTransportGrpc/onProposal":
          try Iroha_Ordering_Proto_OrderingGateTransportGrpconProposalSession(handler:handler, provider:provider).run(queue:queue)
        default:
          break // handle unknown requests
        }
      } catch (let error) {
        print("Server error: \(error)")
      }
    }
  }
}

/// Type for errors thrown from generated server code.
internal enum Iroha_Ordering_Proto_OrderingServiceTransportGrpcServerError : Error {
  case endOfStream
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider {
  func ontransaction(request : Iroha_Protocol_Transaction, session : Iroha_Ordering_Proto_OrderingServiceTransportGrpconTransactionSession) throws -> Google_Protobuf_Empty
}

/// Common properties available in each service session.
internal class Iroha_Ordering_Proto_OrderingServiceTransportGrpcSession {
  fileprivate var handler : gRPC.Handler
  internal var requestMetadata : Metadata { return handler.requestMetadata }

  internal var statusCode : Int = 0
  internal var statusMessage : String = "OK"
  internal var initialMetadata : Metadata = Metadata()
  internal var trailingMetadata : Metadata = Metadata()

  fileprivate init(handler:gRPC.Handler) {
    self.handler = handler
  }
}

// onTransaction (Unary)
internal class Iroha_Ordering_Proto_OrderingServiceTransportGrpconTransactionSession : Iroha_Ordering_Proto_OrderingServiceTransportGrpcSession {
  private var provider : Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Iroha_Protocol_Transaction(serializedData:requestData)
        let replyMessage = try self.provider.ontransaction(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}


/// Main server for generated service
internal class Iroha_Ordering_Proto_OrderingServiceTransportGrpcServer {
  private var address: String
  private var server: gRPC.Server
  private var provider: Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider?

  /// Create a server that accepts insecure connections.
  internal init(address:String,
              provider:Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    self.server = gRPC.Server(address:address)
  }

  /// Create a server that accepts secure connections.
  internal init?(address:String,
               certificateURL:URL,
               keyURL:URL,
               provider:Iroha_Ordering_Proto_OrderingServiceTransportGrpcProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    guard
      let certificate = try? String(contentsOf: certificateURL, encoding: .utf8),
      let key = try? String(contentsOf: keyURL, encoding: .utf8)
      else {
        return nil
    }
    self.server = gRPC.Server(address:address, key:key, certs:certificate)
  }

  /// Start the server.
  internal func start(queue:DispatchQueue = DispatchQueue.global()) {
    guard let provider = self.provider else {
      assert(false) // the server requires a provider
    }
    server.run {(handler) in
      print("Server received request to " + handler.host
        + " calling " + handler.method
        + " from " + handler.caller
        + " with " + String(describing:handler.requestMetadata) )

      do {
        switch handler.method {
        case "/iroha.ordering.proto.OrderingServiceTransportGrpc/onTransaction":
          try Iroha_Ordering_Proto_OrderingServiceTransportGrpconTransactionSession(handler:handler, provider:provider).run(queue:queue)
        default:
          break // handle unknown requests
        }
      } catch (let error) {
        print("Server error: \(error)")
      }
    }
  }
}

import UIKit
import Combine

class ChatRoom {
    enum Error: Swift.Error {
        case missingConnection
    }
    
    var subject = PassthroughSubject<String, Error>()
    
    func simulateMessage() {
        subject.send("Hello!")
    }
    
    func simulateNetworkError() {
        subject.send(completion: .failure(.missingConnection))
    }
    
    func closeRoom() {
        subject.send("Chat room closed")
        subject.send(completion: .finished)
    }
    
    func restart() {
        subject = PassthroughSubject<String, Error>()
    }
}

class Client {
    var chatRoom: ChatRoom
    var cancellables = Set<AnyCancellable>()
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        subscribe()
    }
    
    func subscribe() {
        chatRoom.subject.sink { completion in
            switch completion {
            case .finished:
                print("Received finished")
            case .failure(let error):
                print("Received error: \(error)")
                self.chatRoom.restart()
                self.subscribe()
                print("Subscirbe Again.")
            }
        } receiveValue: { message in
            print("Received message: \(message)")
        }
        .store(in: &cancellables)
        
    }
}

let chatRoom = ChatRoom()
let client = Client(chatRoom: chatRoom)


chatRoom.simulateMessage()
chatRoom.simulateMessage()
chatRoom.simulateNetworkError()
chatRoom.simulateMessage()

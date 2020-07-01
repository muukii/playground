import OpenAPIKit

/**
 - 日付選択
 
 相手が無理な日を除外しなければならない
 日付のRange
 
 - 画像送信
 
 既存EndpointにアップロードしてURLをもらう
 URLと何かを合わせてMessageを送る
 なにか = training phrases
 
 */


struct Image: NominalObject {
  let url: String
  let altText: String
}

struct PlainText: NominalObject {
  let text: String
}

struct PreviewContent: Object {
  
}

struct ChatroomActionSilentPostback: NominalObject {
  let returnValue: String
}

struct ChatroomActionPostback: NominalObject {
  /// The text to display in chat UI as a placeholder while sending actual message
  let displayText: String
  /// e.g. morpheus-yes (training phrases)
  let returnValue: String
}

/// Open Calendar UI to select date
struct ChatroomActionSelectDateForScheduling: NominalObject {
  // 2019-08-09 (ISO8601)
  let minDate: String
  // 2019-08-09 (ISO8601)
  let maxDate: String
  
  // TODO: postback
}

struct ChatroomActionSelectImageForProfile: NominalObject {
}

struct ChatroomActionSelectImageForDocument: NominalObject {
  
}

///// マスターデータからアイテムを選択するアクション
//struct ChatroomActionSelectMasterDataItem {
//  let table_name: String
//}
//
//struct ChatroomActionSelectResidence {
//  let type: String = "chatroom_action_select_residence"
//}

struct ChatRoom: Object {
  /// the identifier of chatroom
  let chatroomID: String
  /// the name of chatroom to display on UI
  let chartoomName: String
  /// the image object to display to UI
  let chatroomImage: Image
  /// the preview content object to display the content of the last message in this chatroom to UI.
  let previewContent: PreviewContent
}

struct Member: Object {
  /// user or bot
  let kind: String
  let id: String
  let name: String
  let profileImage: Image
}

struct ChatroomStartResponse: Object {
  /// The name to connect pusher's channel
  let pusherChannelName: String
  /// The event name to subscrive receiving message from Pusher
  let pusherEventMessage: String
  /// The event name to subscrive user typing event from Pusher
  let pusherEventTyping: String
}

struct ChatroomListResponse: Object {
  let chatrooms: [ChatRoom]
  let members: [Member]
}

struct SenderBot: Object {
  let memberID: String
  let agent: String
}

struct SenderUser: Object {
  let memberID: String
}

struct SenderConcierge: Object {
  let memberID: String
}

struct Message: NominalObject {
  
  enum Body: OneOf {
    case plainText(PlainText)
    case image(Image)
  }
  
  enum InteractiveAccessory: OneOf {
    case plain_button(InteractiveAccessoryPlainButton)
    case vertical_button_container(InteractiveAccessoryVerticalButtonContainer)
    case horizontal_button_container(InteractiveAccessoryHorizontalButtonContainer)
    case grid_button_container(InteractiveAccessoryGridButtonContainer)
    case selection(InteractiveAccessorySelection)
    case image_cards(InteractiveAccessoryImageCardContainer)
  }
  
  enum Sender: OneOf {
    case bot(SenderBot)
    case user(SenderUser)
    case concierge(SenderConcierge)
  }
    
  let body: Body
  let interactiveAccessory: InteractiveAccessory?
  let chatroomID: String
  /// micro-seconds
  let sendTime: Int
  let updatedAt: Int
  let clientIssuedCode: String?
  let activeStatus: Int
  let sender: Sender
  
  /// フリーテキスト入力エリアに表示するプレースホルダー
  let placeholderTextOnInputView: String?
  
  
}

// MARK: InteractiveAccessories

struct InteractiveAccessoryPlainButton: NominalObject {
  
  enum Action: OneOf {
    case chatroom_action_postback(ChatroomActionPostback)
    case chatroom_action_select_day_for_scheduling(ChatroomActionSelectDateForScheduling)
    case chatroom_action_select_image_for_profile(ChatroomActionSelectImageForProfile)
    case chatroom_action_select_image_for_document(ChatroomActionSelectImageForDocument)
    //    case chatroom_action_select_residence(ChatroomActionSelectResidence)
  }
  
  let text: PlainText
  let action: Action
}

struct InteractiveAccessoryHorizontalButtonContainer: NominalObject {
  
  enum Button: OneOf {
    case plainButton(InteractiveAccessoryPlainButton)
  }
  
  let buttons: [Button]
}

struct InteractiveAccessoryVerticalButtonContainer: NominalObject {
  
  enum Button: OneOf {
    case plainButton(InteractiveAccessoryPlainButton)
  }
  
  let buttons: [Button]
}

struct InteractiveAccessoryGridButtonContainer: NominalObject {
  
  enum Button: OneOf {
    case plainButton(InteractiveAccessoryPlainButton)
  }
  
  let buttons: [Button]
}

/// 選択肢を表示するUI
struct InteractiveAccessorySelection: NominalObject {
  
  struct Placeholder: Object {
    let text: PlainText
  }
  
  struct Option: Object {
    let text: String
    let action: ChatroomActionPostback
  }
  
  let placeholder: Placeholder
  let minSelectedItems: Int
  let maxSelectedItems: Int?
  let options: [Option]
  
}

/// 写真を並ぶやつ
struct InteractiveAccessoryImageCardContainer: NominalObject {
  
  /// 写真のカード
  struct ImageCard: Object {
    let image: Image
    let action: ChatroomActionPostback
  }
  
  let cards: [ImageCard]
  
}

struct Task: Object {
  let title: String
  let id: String
  let taskID: String
  let chatroomID: String
  /// ISO8601
  let expriresAt: String
  let iconImage: Image
}

// MARK: - Requests

struct GetChatroomRequest: Endpoint {
  
  var method: HTTPMethod = .get
  var path = "chatroom"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    
  }
  
  struct Body: Object {
    
  }
  
  struct Response: Object {
    let chatrooms: [ChatRoom]
  }
  
}

struct GetChatroomHistoryRequest: Endpoint {
  
  var method: HTTPMethod = .get
  var path = "chatroom/history"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    let chatroomID: String
  }
  
  struct Body: Object {
    
  }
  
  struct Response: Object {
    
    enum Content {
      case message(Message)
    }
    
    let contents: [Content]
    let members: [Member]
  }
  
}

struct StartRequest: Endpoint {
  
  var method: HTTPMethod = .post
  var path = "/chatroom/start"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    
  }
  
  struct Body: Object {
    
    struct StartConversation: NominalObject {
      /// The value from task object
      let chatroomID: String
    }
    
    struct StartTask: NominalObject {
      /// The value from task object
      let chatroomID: String
      /// The value from task object
      let taskID: String
    }
    
    enum _Body: OneOf {
      case startConversation(StartConversation)
      case startTask(StartTask)
    }
    
    let data: _Body
    
  }
  
  struct Response: Object {
  }
  
}

struct SendMessageRequest: Endpoint {
  
  var method: HTTPMethod = .post
  var path = "/chatroom/message"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    
  }
  
  struct Body: Object {
    enum Sender: OneOf {
      case bot(SenderBot)
      case user(SenderUser)
      case concierge(SenderConcierge)
    }
    
    struct TextBody: NominalObject {
      let text: String
    }
    
    struct ReplyBody: NominalObject {
      let displayText: String
      let value: String
    }
    
    struct ImageBody: NominalObject {
      let imageURL: String
    }
    
    enum Body: OneOf {
      case text(TextBody)
      case reply(ReplyBody)
      case image(ImageBody)
    }
    
    let clientIssuedCode: String
    let targetMessageSendTime: Int
    let targetMessageSender: Sender
    let body: Body
  }
  
  struct Response: Object {
  }
  
}

struct GetTaskRequest: Endpoint {
  
  var method: HTTPMethod = .get
  var path = "/task"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    
  }
  
  struct Body: Object {
    
  }
  
  struct Response: Object {
    let tasks: [Task]
  }
  
}

struct MarkReadMessageRequest: Endpoint {
  
  var method: HTTPMethod = .put
  var path = "/chatroom/message"
  
  struct Header: Object {
    
  }
  
  struct Query: Object {
    
  }
  
  struct Body: Object {
    /// 最後に読んだメッセージのsend_timeを使う
    let sendTime: Int
  }
  
  struct Response: Object {
  }
  
}

// MARK: - Response

struct TaskListResponse: Object {
  let tasks: [Task]
}


struct PusherMessageResponse: Object {
  let contents: [Message]
}


import Foundation

public class InMemoryDataStore<T>: DataStore {
    
    typealias ContentType = T
    var shadows = Dictionary<Key, ShadowDocument<T>>()
    
    public init() {
    }
    
    public func saveShadowDocument(shadowDocument: ShadowDocument<T>) {
        let key = Key(id: shadowDocument.clientDocument.id, clientId: shadowDocument.clientDocument.clientId)
        shadows[key] = shadowDocument
    }
    
    public func getShadowDocument(documentId: String, clientId: String) -> ShadowDocument<T>?{
        return shadows[Key(id: documentId, clientId: clientId)]
    }
    
    public func saveBackupShadowDocument(backupShadowDocument: BackupShadowDocument<T>) {
    }
    
    public func getBackupShadowDocument(documentId: String, clientId: String) {
    }
    
    public func saveEdits(edit: Edit) {
    }
    
    public func getEdits(documentId: String, clientId: String) -> NSMutableArray {
        return []
    }
    
    public func removeEdit(edit: Edit) {
    }
    
    public func removeEdits(documentId: String, clientId: String) {
    }
    
}

func ==(lhs: Key, rhs: Key) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

struct Key: Hashable {
    let id: String
    let clientId: String
    
    init(id: String, clientId: String) {
        self.id = id
        self.clientId = clientId
    }
        
    var hashValue: Int {
        get {
            return "\(id),\(clientId)".hashValue
        }
    }
        
}

//
//  FirestoreMenager.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-07-06.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

fileprivate enum CollectionKeys: String {
    case user = "user"
}

class FirestoreManager {
    
    static let shared = FirestoreManager()
    
    private let firestore: Firestore
    
    private init() {
        firestore = Firestore.firestore()
    }
    
    func createUser(name: String, email: String, completion: @escaping (Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(NSError(domain: "FirestoreManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"]))
            return
        }
        let user = User(userID: userId, name: name, workoutList: [])
        let userCollection = firestore.collection(CollectionKeys.user.rawValue)
        do {
            try userCollection.document(userId).setData(from: user)
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    func addWorkout(workout: Exercise, completion: @escaping (Result<User, Error>) -> Void) {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            completion(.failure(NSError(domain: "FirestoreManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Usuário não autenticado"])))
            return
        }
        
        do{
            let workoutData = try Firestore.Encoder().encode(workout)
            
            let userRef = firestore.collection(CollectionKeys.user.rawValue).document(currentUserID)
            
            userRef.updateData(["workoutList": FieldValue.arrayUnion([workoutData])]) { error in
                if let error = error {
                    completion(.failure(error as! Error))
                } else {
                    completion(.success(()))
                }
            }
        } catch let error {
            completion(.failure(error as! Error))
        }
    }
        
    func getObjectData<T: Codable>(collection: String, forObjectType objectType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            completion(.failure(NSError(domain: "FirestoreManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Usuário não autenticado"])))
            return
        }
        
        firestore.collection(collection).document(currentUserID).getDocument { document, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let document = document, document.exists else {
                completion(.failure(NSError(domain: "FirestoreManager", code: -2, userInfo: [NSLocalizedDescriptionKey: "Documento não existe ou houve um erro"])))
                return
            }
            
            do {
                let object = try document.data(as: T.self)
                completion(.success(object))
            } catch let error {
                completion(.failure(error))
            }
        }
    }

    
}

//
//  UserServices.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase
import FirebaseFunctions

typealias FirestoreCompletion = (Error?) -> Void

struct AuthCredentials {
    
    var fullname: String
    var email: String
    var password: String
    var isMember: Bool
    var stripeId: String
    var membershipType: String
    
    
}

struct UserServices {
    
    //MARK: - SAVE DATA
    
    static func storeUserInformation(credentials: AuthCredentials, completion: @escaping(FirestoreCompletion))  {

        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { results, error in

            if let error = error {

                print("DEBUGG: FAILED TO STORE THE USER INOFRMATION\(error)")

                return
            }

            guard let user = results?.user else {return}

            var dictionary = ["fullname": credentials.fullname,
                              "userId": user.uid,
                              "email": credentials.email,
                              "stripeId": credentials.stripeId,
                              "membershipType": credentials.membershipType,
                              "isMember": credentials.isMember] as [String: Any]


            COLLECTION_USERS.document(user.uid).setData(dictionary, completion: completion)

        }

    }
    

    //MARK: - FETCH DATA

    static func fetchUser(currentId: String, completion: @escaping(User) -> Void) {
        
        COLLECTION_USERS.document(currentId).getDocument { snapshot, _ in
            
            guard let dictionary = snapshot?.data() else {return}
            
            let user = User(dictionary: dictionary)
            
            completion(user)
        }
        
    }
    
    
    static func fetchStripeUser(currentId: String, completion: @escaping(SripeUser) -> Void)  {
        
        COLLECTION_USERS.document(currentId).getDocument { snapshot, _ in
            
            guard let dictionary = snapshot?.data() else {return}
            
            let user = SripeUser(dictionary: dictionary)
            
            completion(user)
        }
        
    }
    
   
    
    
    
    static func fetchUserData(completion: @escaping(Result<String, Error>) -> ()) {
        
        let uniqueUrl = "https://us-central1-trainingzone-ea5b2.cloudfunctions.net/helloWorld"

       guard let url = URL(string: uniqueUrl) else {return}
        
       URLSession.shared.dataTask(with: url) { data, response, error in
           
           if let error = error {
               
               print("DEBUGG: FAILED TO GET THE DATA \(error.localizedDescription)")
               
               completion(.failure(error))
               return
           }
           
           guard let data = data else {return}
           
           let theBody = String(data: (data), encoding: String.Encoding.utf8)
           
           guard let responses = response as? HTTPURLResponse else {return}

           print("DEBUGG: ther status code is \(responses.statusCode)")
           
           print("DEBUGG: ther status code is \(theBody)")
           
           print("DEBUGG: ITS JUST NOT WORKINFG ANYMORE WHY ")

           do {
               
               let data = try JSONDecoder().decode(String.self, from: data)
               
               print("DEBUGG: ther status code is \(theBody)")

               completion(.success(data))
                             
               print("successfuly got the data")

           } catch let error {
               
               completion(.failure(error))
               
               print("FALED TO RECIVE THE DATA BECAUSE \(error.localizedDescription)")
               guard let responses = response as? HTTPURLResponse else {return}

               print("ther status code is \(responses.statusCode)")
           }
           
       }.resume()
        
    }

    
}

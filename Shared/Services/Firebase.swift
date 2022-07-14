//
//  Firebase.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import FirebaseAuth
import FirebaseDatabase


let DATABASE = Database.database().reference()


let USER_REF = DATABASE.child("users")

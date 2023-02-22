//
//  MessageViewModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import Foundation

func replayMessage(message: String) -> String {
    
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there!"
    }
    else if tempMessage.contains("hi") {
        return "Hey there!"
    }
    else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    }
    else if tempMessage.contains("by") {
        return "Talk to you later!"
    }
    else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    }
    else {
        return "That's cool."
    }
}

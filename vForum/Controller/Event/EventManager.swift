//
//  DummyEventData.swift
//  vForum
//
//  Created by Phúc Lý on 9/24/20.
//  Copyright © 2020 vinova.internship. All rights reserved.
//

import Foundation

class EventManager {
    static let shared = EventManager()
    
    var listBanner: [String] = ["eventBanner"]
    var listEvent: [Event] = [Event(_id: 0, title: "Event 1", description: "Description1", startDate: Date(), endDate: Date(), banner: "eventBanner" )]
    
    let nameFile = "DummyEventData"
    
    func getEvents() -> [Event] {
        return listEvent
    }
    
    func getEvents(from: Date, to: Date) -> [Event] {
        return listEvent.filter { (event) -> Bool in
            return event.startDate >= from && event.endDate <= to
        }
    }
    
    func getNewestEvents() -> [Event] {
        return listEvent.sorted { (a, b) -> Bool in
            return a.startDate > b.startDate
        }
    }
    
    func getOldestEvents() -> [Event] {
        return listEvent.sorted { (a, b) -> Bool in
            return a.startDate < b.startDate
        }
    }
    
    func getPassedEvents() -> [Event] {
        return listEvent.filter { (event) -> Bool in
            return event.endDate < Date()
        }
    }

    func getEvent(_id: Int) -> Event{
        return listEvent[_id]
    }
    
    func createEvent(title: String, description: String, startDate: Date, endDate: Date, banner: String) -> Event {
        let event = Event(_id: listEvent.count, title: title, description: description, startDate: startDate, endDate: endDate, banner: banner)
        
        listEvent.append(event)
        return event
    }
    
    func deleteEvent(_id: Int){
        listEvent.remove(at: _id)
    }
    
    func updateEvent(id : Int, title: String, description: String, startDate: Date, endDate: Date) {
        listEvent[id].title = title
        listEvent[id].description = description
        listEvent[id].startDate = startDate
        listEvent[id].endDate = endDate
    }
}

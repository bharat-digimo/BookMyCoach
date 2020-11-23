//
//  GlobalHelper.swift
//  BookMyCoach
//
//  Created by Bharat Lal on 11/23/20.
//

import Foundation

let bio = "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"

let coach1 = User(id: 1, name: "Mike Matthews", profilePhoto: "https://picsum.photos/id/1005/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach2 = User(id: 2, name: "Chris", profilePhoto: "https://randomuser.me/api/portraits/men/95.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach3 = User(id: 3, name: "Stephen", profilePhoto: "https://randomuser.me/api/portraits/men/96.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach4 = User(id: 4, name: "Robert", profilePhoto: "https://randomuser.me/api/portraits/men/97.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach5 = User(id: 5, name: "Mario S", profilePhoto: "https://randomuser.me/api/portraits/men/98.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach6 = User(id: 6, name: "Tim Johnson", profilePhoto: "https://picsum.photos/id/22/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach7 = User(id: 7, name: "Hawk T", profilePhoto: "https://picsum.photos/id/177/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach8 = User(id: 8, name: "Paul D", profilePhoto: "https://picsum.photos/id/1005/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach9 = User(id: 9, name: "Ben D", profilePhoto: "https://randomuser.me/api/portraits/men/99.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let coach10 = User(id: 10, name: "Albert K", profilePhoto: "https://randomuser.me/api/portraits/women/99.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)

let user1 = User(id: 11, name: "Johny Walker", profilePhoto: "https://picsum.photos/id/203/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user2 = User(id: 12, name: "John C", profilePhoto: "https://randomuser.me/api/portraits/women/98.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user3 = User(id: 13, name: "Angela Y", profilePhoto: "https://picsum.photos/id/1027/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 3)
let user4 = User(id: 14, name: "Celina W", profilePhoto: "https://picsum.photos/id/1011/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user5 = User(id: 15, name: "Katty Peri", profilePhoto: "https://randomuser.me/api/portraits/women/97.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 4)
let user6 = User(id: 16, name: "Paul F", profilePhoto: "https://randomuser.me/api/portraits/women/95.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user7 = User(id: 17, name: "Chris Pears", profilePhoto: "https://randomuser.me/api/portraits/women/80.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user8 = User(id: 18, name: "Joe D", profilePhoto: "https://randomuser.me/api/portraits/men/80.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 3)
let user9 = User(id: 19, name: "Trump D", profilePhoto: "https://randomuser.me/api/portraits/men/83.jpg", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 5)
let user10 = User(id: 20, name: "Serena Y", profilePhoto: "https://picsum.photos/id/1012/400/400", bio: bio, latitude: 0, longitude: 0, price: 100, type: .coach, rating: 4)

let booking1 = Booking(id: 21, userId: 1, coach: coach1, bookingDate: Date(), sessionTime: "09:00 AM")
let booking2 = Booking(id: 22, userId: 1, coach: coach1, bookingDate: Date(), sessionTime: "10:00 AM")
let booking3 = Booking(id: 23, userId: 1, coach: coach1, bookingDate: Date(), sessionTime: "11:00 AM")
let booking4 = Booking(id: 24, userId: 1, coach: coach2, bookingDate: Date(), sessionTime: "09:00 AM")
let booking5 = Booking(id: 25, userId: 1, coach: coach4, bookingDate: Date(), sessionTime: "08:00 AM")
let booking6 = Booking(id: 26, userId: 1, coach: coach7, bookingDate: Date(), sessionTime: "05:00 AM")
let booking7 = Booking(id: 27, userId: 1, coach: coach3, bookingDate: Date(), sessionTime: "07:00 PM")
let booking8 = Booking(id: 28, userId: 1, coach: coach6, bookingDate: Date(), sessionTime: "06:00 AM")
let booking9 = Booking(id: 29, userId: 1, coach: coach8, bookingDate: Date(), sessionTime: "05:00 AM")
let booking10 = Booking(id: 30, userId: 1, coach: coach9, bookingDate: Date(), sessionTime: "08:00 AM")

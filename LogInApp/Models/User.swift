//
//  User.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            userName: "User",
            password: "password",
            person: Person.getPersonData()
        )
    }
}

struct Person {
    let name: String
    let dateOfBirth: String
    let city: String
    let sex: String
    let status: String
    let occupation: String
    let aboutMeLegend: String
    let bioLegend: String
    let occupationLegend: String
    let creationLegend: String
    let firstActivityLegend: String
    let secondActivityLegend: String
    let images: [String]
    
    static func getPersonData() -> Person {
        Person(
            name: "Дмитрий Мельников",
            dateOfBirth: "19.10.1988",
            city: "Владивосток",
            sex: "Мужской",
            status: "Женат",
            occupation: "Машинист башенного крана",
            aboutMeLegend: "About me lrgend",
            bioLegend: "Bio legend",
            occupationLegend: "Occupation legend",
            creationLegend: "Creativity legend",
            firstActivityLegend: "First activity legend",
            secondActivityLegend: "Second activity legend",
            images: ["pic1", "pic2", "pic3", "pic4", "pic5",])
    }
}

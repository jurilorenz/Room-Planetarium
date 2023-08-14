//
//  Constants.swift
//  Room-Planetarium
//
//  Created by Juri Lorenz on 09.08.23.
//

import Foundation

struct RadiusConstants {
    static let mercuryRadius: Double = 2.439
    static let venusRadius: Double = 6.051
    static let earthRadius: Double = 6.371
    static let moonRadius: Double = 1.737
    static let marsRadius: Double = 3.389
    // in kilometers / 1000
}

struct SurfaceConstants {
    static let mercurySurface: String = "art.scnassets/mercury.jpg"
    static let venusSurface: String = "art.scnassets/venus.jpg"
    static let earthSurface: String = "art.scnassets/earth.jpg"
    static let moonSurface: String = "art.scnassets/moon.jpg"
    static let marsSurface: String = "art.scnassets/mars.jpg"
}

struct PlanetFacts {
    static func facts(for planetType: PlanetType) -> [String] {
        switch planetType {
        case .mercury: return mercuryFacts
        case .venus: return venusFacts
        case .earth: return earthFacts
        case .moon: return moonFacts
        case .mars: return marsFacts
        }
    }
    static let mercuryFacts = [
        "Mercury is the smallest planet in our solar system.",
        "A day on Mercury is longer than its year.",
        "Mercury has a very thin atmosphere, almost nonexistent.",
        "It has a huge temperature difference between its day and night sides.",
        "Mercury has been visited by only one spacecraft, NASA's MESSENGER.",
        "It has a lot of craters due to its thin atmosphere.",
        "Mercury has the most elongated orbit of all the planets.",
        "It was named after the Roman messenger to the gods.",
        "Mercury's surface is covered in a layer of gray, rocky material.",
        "It has a very weak magnetic field."
    ]
    
    static let venusFacts = [
        "Venus is the hottest planet in our solar system.",
        "It rotates on its axis in the opposite direction compared to most planets.",
        "Venus is often called Earth's 'sister planet' due to their similar size and composition.",
        "Its surface is extremely hot and covered in thick clouds of sulfuric acid.",
        "Venus has no moons and no magnetic field.",
        "Venus has a runaway greenhouse effect, making it extremely inhospitable.",
        "It was named after the Roman goddess of love and beauty.",
        "Venus is often visible from Earth as the 'Evening Star' or 'Morning Star'.",
        "The Soviet Union's Venera probes were the first to land on Venus.",
        "Venus has a very slow rotation, with a day longer than its year."
    ]
    
    static let earthFacts = [
        "Earth is the only planet known to support life.",
        "Seventy percent of Earth's surface is covered with water.",
        "Earth's atmosphere is composed primarily of nitrogen and oxygen.",
        "It is the fifth largest planet in our solar system.",
        "Earth has a magnetic field that protects it from harmful solar radiation.",
        "The Earth's rotation is gradually slowing down.",
        "Mount Everest is the highest point on Earth's surface.",
        "Earth's atmosphere scatters blue light, which is why the sky appears blue.",
        "The Earth is about 4.5 billion years old.",
        "The International Space Station orbits the Earth."
    ]
    
    static let moonFacts = [
        "The Moon is Earth's only natural satellite.",
        "It is about 1/6th the size of Earth.",
        "The Moon's gravity affects Earth's tides.",
        "There are dark, flat areas on the Moon's surface called maria.",
        "The Moon has a very thin and tenuous atmosphere.",
        "The Moon is tidally locked to Earth, meaning it always shows the same face to us.",
        "NASA's Apollo program successfully landed astronauts on the Moon.",
        "The Moon's surface is covered in a layer of powdery dust called regolith.",
        "The Moon has been a subject of fascination and mythology for centuries.",
        "There are six Apollo lunar landing sites on the Moon."
    ]
    
    static let marsFacts = [
        "Mars is often called the 'Red Planet' due to its reddish appearance.",
        "It has the tallest volcano and deepest, longest canyon in the solar system.",
        "Scientists have found evidence of liquid water on Mars in the past.",
        "Mars has polar ice caps that consist mainly of water and carbon dioxide.",
        "NASA's rovers, such as Curiosity and Perseverance, have explored Mars' surface.",
        "Mars has a thin atmosphere composed primarily of carbon dioxide.",
        "It has seasons similar to Earth due to its axial tilt.",
        "Mars' two moons are named Phobos and Deimos.",
        "The Martian day is called a 'sol', and it is only slightly longer than a day on Earth.",
        "Mars is a prime target for future human exploration and colonization."
    ]

}

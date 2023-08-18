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
        "Mercury is the closest planet to the Sun.",
        "It has a thin atmosphere composed mostly of oxygen.",
        "Mercury's surface temperature ranges from -173°C to 427°C.",
        "A day on Mercury is longer than its year.",
        "Mercury has been visited by only one spacecraft, NASA's MESSENGER.",
        "It's the smallest planet in our solar system.",
        "Mercury has a huge iron core, about 65% of its mass.",
        "The planet's surface is heavily cratered.",
        "Mercury's gravity is only about 38% of Earth's.",
        "The Caloris Basin is its largest impact crater.",
        "Mercury has a tenuous magnetic field.",
        "It's challenging to explore due to Sun's gravity.",
        "Mercury's thin atmosphere doesn't trap heat well.",
        "Mercury's surface resembles the Moon's in texture.",
        "Water ice exists in permanently shadowed craters.",
        "Its eccentric orbit causes significant temperature shifts.",
        "It was named after the Roman messenger god.",
        "Mercury's sunrises and sunsets are breathtaking.",
        "The planet's thin atmosphere is blown away by the solar wind.",
        "Mercury's high iron content gives it a metallic appearance.",
        "NASA's BepiColombo mission aims to study Mercury.",
        "Mercury's exosphere contains hydrogen, helium, and more.",
        "Its surface is heavily bombarded by micrometeoroids.",
        "Mercury has the most elongated orbit of all the planets."
    ]
    
    static let venusFacts = [
        "Venus is the hottest planet in our solar system.",
        "It has a thick toxic atmosphere mostly of carbon dioxide.",
        "Surface temperature can melt lead, around 462°C.",
        "A day on Venus is longer than its year.",
        "Venus is often called Earth's sister due to their similar size and composition.",
        "The planet rotates in the opposite direction to most.",
        "Its atmosphere creates a runaway greenhouse effect.",
        "Venus' surface pressure is about 92 times that of Earth.",
        "It lacks a magnetic field like Earth's.",
        "Venus is named after the Roman goddess of love.",
        "Venus' clouds are made of sulfuric acid.",
        "The surface is rocky, with plains and highlands.",
        "Venus has over 1,600 major volcanoes.",
        "Venus has no moons, unlike most planets.",
        "It's the second-brightest object in the night sky.",
        "Venus' surface is younger than most of the planets.",
        "The planet's rotation is retrograde and slow.",
        "Venus has mountains, valleys, and vast lava plains.",
        "It experiences hurricane-force winds in its upper atmosphere.",
        "Venus' thick clouds reflect sunlight strongly.",
        "Soviet probe Venera 7 landed on Venus in 1970 and transmit data from there.",
        "NASA's Magellan spacecraft mapped much of Venus' surface.",
        "Venus' surface has extensive volcanic features.",
        "Venus' day-night cycle is longer than its year.",
        "It was observed by ancient civilizations.",
        "Venus has different atmospheric layers with varying temperatures.",
        "Venus has a very small axial tilt.",
        "The planet's surface features large impact craters.",
        "It was once thought to be a tropical paradise.",
        "Venus has a relatively young geologic history."
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
        "Mars is the fourth planet from the Sun.",
        "It's often called the 'Red Planet' due to its color.",
        "Mars has a thin atmosphere, mostly carbon dioxide.",
        "Surface temperature ranges from -195°C to 20°C.",
        "The Martian day is called a 'sol', and it's only slightly longer than a day on Earth.",
        "Mars has the tallest volcano in the solar system, Olympus Mons. 21.9 km high.",
        "Mars has two small moons, Phobos and Deimos.",
        "It has the largest dust storms in the solar system.",
        "Mars' gravity is about 38% of Earth's.",
        "Water ice exists on Mars, especially in polar ice caps.",
        "Mars' surface features vast plains and ancient river valleys.",
        "NASA's Curiosity rover is exploring Mars' surface.",
        "The planet's thin atmosphere can't support liquid water.",
        "Mars' thin atmosphere results in dramatic temperature swings.",
        "It's the most likely planet for future human exploration and colonization.",
        "Mars has the solar system's deepest impact crater, Hellas Basin. 7.152 m deep.",
        "The planet's rusted appearance is due to iron-rich soil.",
        "Mars once had a more substantial atmosphere and liquid water.",
        "The Viking Landers were the first to successfully reach Mars' surface.",
        "Mars' two moons might be captured asteroids.",
        "It has the solar system's longest canyon, Valles Marineris.",
        "Mars' thin atmosphere makes the sky appear pinkish.",
        "The Mars Reconnaissance Orbiter has discovered potential water flows.",
        "It has seasons similar to Earth due to its axial tilt.",
        "Mars experiences global dust storms that can last months.",
        "The first successful Mars rover was Sojourner in 1997.",
        "Mars' surface features many impact craters.",
        "Mars' two moons are irregularly shaped and small.",
        "The planet has diverse terrain, including polar ice caps.",
        "Mars' surface is being investigated for signs of past life."
    ]

}

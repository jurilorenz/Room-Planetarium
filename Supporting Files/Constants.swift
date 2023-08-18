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
        "It's the only planet known to support life.",
        "The planet's diameter is about 12,742 km.",
        "Earth's gravity holds the atmosphere in place.",
        "The Earth's atmosphere is primarily nitrogen and oxygen.",
        "The deepest point on Earth is the Mariana Trench.",
        "Earth has a magnetic field that protects it from harmful solar radiation.",
        "Earth's atmosphere is divided into layers.",
        "The ozone layer protects us from harmful UV radiation.",
        "Earth has a molten iron core that generates its magnetic field.",
        "Earth's axial tilt causes seasons.",
        "Earth's moon is relatively large compared to its size.",
        "Earth's rotation is gradually slowing down.",
        "The Amazon Rainforest is the largest tropical rainforest.",
        "Earth's crust is divided into tectonic plates.",
        "Earth's average surface temperature is about 15°C.",
        "The hottest desert is the Lut Desert in Iran.",
        "The Earth's population is over 7.8 billion.",
        "Earth's atmosphere scatters blue light, which is why the sky appears blue.",
        "The Earth is about 4.5 billion years old.",
        "The hottest desert is the Lut Desert in Iran.",
        "Lake Baikal in Russia is the world's oldest and deepest freshwater lake.",
        "Over 80% of the Earth's oceans remain unexplored.",
        "The lowest recorded temperature on Earth is around -89.2°C in Antarctica.",
        "Lake Vostok in Antarctica is the largest subglacial lake.",
        "The Białowieża Forest on the border of Poland and Belarus is Europe's last primeval forest.",
        "Earth's core temperature is hotter than the surface of the Sun.",
        "The phenomenon of 'green flashes' can sometimes be seen during sunrises or sunsets.",
        "Earth has a second, tiny moonlet called Cruithne that orbits the Sun.",
        "The African Baobab tree can store thousands of liters of water in its trunk.",
        "The Ganges River has a natural underground aqueduct.",
        "The International Space Station orbits the Earth."
        
    ]
    
    static let moonFacts = [
        "The Moon is Earth's only natural satellite.",
        "It's about 1/6th the size of Earth.",
        "The Moon is 238,855 miles away from Earth.",
        "It has a diameter of 3,474 km.",
        "Moon's gravity is about 1/6th of Earth's.",
        "The Moon's surface is covered in impact craters.",
        "It has phases due to its changing position.",
        "The Moon is about 4.5 billion years old.",
        "NASA's Apollo program successfully landed astronauts on the Moon.",
        "The Moon's surface is covered in a layer of powdery dust called regolith.",
        "The Moon has been a subject of fascination and mythology for centuries.",
        "There are six Apollo lunar landing sites on the Moon.",
        "The Moon has no atmosphere or weather.",
        "It influences Earth's tides due to gravity.",
        "Moonquakes are caused by the cooling and contracting.",
        "The Moon's dark spots are called maria.",
        "The Moon takes 27.3 days to orbit Earth.",
        "It's slowly moving away from Earth.",
        "The far side of the Moon is never visible from Earth.",
        "Moon dust smells like gunpowder.",
        "The Moon's temperature ranges from -173°C to 127°C.",
        "The Moon's surface reflects sunlight, making it bright.",
        "The Moon's composition is similar to Earth's crust.",
        "The Moon has a synchronous rotation with Earth.",
        "The Moon's gravity affects Earth's axial tilt.",
        "The Moon's origin might be from a collision with Earth.",
        "Lunar eclipses occur when Earth blocks the Sun's light.",
        "The Moon has been visited by unmanned missions.",
        "The Moon's gravity affects Earth's wobble.",
        "The Moon's surface has no air or water erosion.",
        "The Moon's gravity helps stabilize Earth's rotation.",
        "The Moon has no magnetic field."
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

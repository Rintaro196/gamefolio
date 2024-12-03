genres = [
    "Fighting",
    "Shooter",
    "Music",
    "Puzzle",
    "Racing",
    "Real Time Strategy (RTS)",
    "Role-playing (RPG)",
    "Simulator",
    "Sport",
    "Strategy",
    "Turn-based strategy (TBS)",
    "Hack and slash/Beat \u0027em up",
    "Quiz/Trivia",
    "Adventure",
    "Indie",
    "Arcade",
    "Visual Novel",
    "Card \u0026 Board Game",
    "MOBA",
    "Point-and-click",
    "Tactical",
    "Platform"
]
genres.each do |genre|
    Genre.find_or_create_by(name: genre)
end

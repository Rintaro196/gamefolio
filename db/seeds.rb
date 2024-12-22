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

#称号作成
user = User.find_by(email: "sample@sample.com")

user_titles = []

10.times do |n|
  title = "称号#{n+1}"
  user_titles << title
end

user_titles.each do |user_title|
  UserTitle.find_or_create_by(user_id: user.id, title: user_title)
end
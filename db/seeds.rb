# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def valid?
  unless yield.valid?
    puts("Errors: [#{yield.class.name}] => #{yield.errors.full_messages}")
    exit(1)
  end
end

puts("Add Todo")

todo = Todo.create_with({
  owner: 'John Doe'
}).find_or_create_by({
  title: 'Bucket List'
})
valid? { todo }

[
  'Cuddle next to a campfire.',
  'Let go of floating lantern.',
  'Have a paint fight.',
  'Build a treehouse.',
  'Back a perfect rainbow cupcake.',
  'Play hide and seek in ikea.',
  'Meet my online friends.',
  'Dance under the Eiffel Tower.',
  'Get in a taxi and yell “Follow that car!”',
  'Wish on a shooting star.',
  'Finish an entire coloring book.',
  'Make a dreamcatcher.',
].each do |item|
  
  puts("Add Item: #{item}")

  item = Item.create_with({
    todo: todo
  }).find_or_create_by({
    title: item
  })
  valid? { item }
end


todo = Todo.create_with({
  owner: 'Jane Doe'
}).find_or_create_by({
  title: 'Crazy Bucket List'
})
valid? { todo }

[
  "1. Base Jump With a Wingsuit",
  "2. Be at the Top of the Tallest Building in the World",
  "3. Be Brave Enough to Bungee Jump",
  "4. Be Face to Face With a Tiger",
  "5. Cage Dive With Sharks",
  "6. Cage-Dive With Crocodiles in Darwin",
  "7. Capture a Fugitive",
  "8. Capture a Tornado on Film",
  "9. Cave Dive",
  "10. Chase a Tornado",
  "11. Circumnavigate the Globe By Sail",
  "12. Cliff Dive",
  "13. Cliff Diving Into Water",
  "14. Climb 5 Mountains",
  "15. Climb a Volcano",
  "16. Climb a Water Tower",
  "17. Climb a Waterfall",
  "18. Climb an Iceberg",
  "19. Climb to the Top of a Rope in a Gym",
  "20. Climb to the Top of Kale Fortress in Skopje",
  "21. Climb to the Top of Orton Hall",
  "22. Climb Up to the Statue of Christ the Redeemer in Rio",
  "23. Coal Walking",
  "24. Cross a Country By Foot",
  "25. Cross a Country With Bicycle",
  "26. Cross a Glacier on Foot",
  "27. Crowd Surf at a Rock Concert",
  "28. Deliver a Baby",
  "29. Dive in a Cage With Great Whites",
  "30. Dive in a Submarine",
  "31. Dive to a Shipwreck",
  "32. Dive to the Titanic",
  "33. Dive Under the Ice",
  "34. Dive With a Whale Shark",
  "35. Do a Bungee Race",
  "36. Do a Firewalking",
  "37. Do a Free Fall Human Suspension",
  "38. Do a Polar Bear Plunge",
  "39. Do a Polar Bear Swim",
  "40. Do a Skydive",
  "41. Do a Tandem Parachute Jump",
  "42. Do Human Bowling",
  "43. Do Reverse Bungee",
  "44. Do Something Insanely Brave",
  "45. Do the Worlds Highest Bungee Jump",
  "46. Don't Sleep For 48 Hours",
  "47. Drive 200+ Kph on the German Autobahn",
  "48. Drive a Race Car on a Race Track",
  "49. Drive a Rally Car",
  "50. Eat Bugs",
  "51. Eat Bull Testicles",
  "52. Eat Frog Legs",
  "53. Eat Iguana",
  "54. Eat Snake",
  "55. Eat Something Foreign That Looks Disgusting",
  "56. Experience a Tandem Paragliding",
  "57. Experience a Very Mild Earthquake",
  "58. Experience Four Different Extreme Environments",
  "59. Experience Weightlessness",
  "60. Feed Sharks",
  "61. Fly a Wingsuit",
  "62. Go Alligator Hunting",
  "63. Go at the Top of the Highest Building of the World",
  "64. Go Base Jumping",
  "65. Go Bobsledding",
  "66. Go Bull Riding",
  "67. Go Cave Jumping",
  "68. Go Cliff Diving",
  "69. Go Dog Sledding",
  "70. Go Go-Karting",
  "71. Go Heliboarding",
  "72. Go Helmet Diving",
  "73. Go Indoor Skydiving",
  "74. Go Into a Zero Gravity Room",
  "75. Go Into Space",
  "76. Go on a Zipline Tour",
  "77. Go Parachute Jumping",
  "78. Go Paragliding",
  "79. Go Parasailing",
  "80. Go Para-Skiing",
  "81. Go Pearl Diving",
  "82. Go Quadbiking",
  "83. Go Rappelling",
  "84. Go Red Back Spider Hunting",
  "85. Go Snorkeling in a Shipwreck",
  "86. Go Storm Chasing",
  "87. Go Swimming in the Great Barrier Reef",
  "88. Go Volcano Boarding",
  "89. Go White Water Rafting",
  "90. Go Wind Surfing",
  "91. Go Zip Lining",
  "92. Go Zorbing",
  "93. Hang Glide",
  "94. Have a Nascar Experience",
  "95. Hold a Dangerous Snake Around my Neck",
  "96. Hold a Tarantula",
  "97. Hold a Venomous Snake",
  "98. Jump from a High Place",
  "99. Jump from an Airplane",
  "100. Jump in a Fountain",
  "101. Jump Off a Rock Into the Ocean",
  "102. Jump Off a Waterfall",
  "103. Jump Off Stratosphere Tower",
  "104. Jump Out of a Plane With a Parachute",
  "105. Kill a Hog With a Bow",
  "106. Kill and Field Strip a Deer",
  "107. Kill and Skin a Rabbit",
  "108. Live in the Wild For 2 Weeks",
  "109. Live in the Wilderness With Nothing But a Knife",
  "110. Live Like a Hobo",
  "111. Raft a Class 5 Rapid",
  "112. Raft Through the Grand Canyon",
  "113. Rappel Down a Waterfall",
  "114. Rappel Down the Side of a Castle",
  "115. Reach Earth's Deepest Seabed",
  "116. Repel Down a Mountain",
  "117. Repel Into a Cave",
  "118. Repel Off a Cliff",
  "119. Ride 100 Miles Through Death Valley",
  "120. Ride 50 Rollercoasters",
  "121. Ride a Bicycle from Los Angeles to New York",
  "122. Ride a Bull",
  "123. Ride a Zipline Through the Jungle",
  "124. Run With the Bulls",
  "125. See a Bear in the Wild",
  "126. See a Tornado",
  "127. Summit Mount Everest",
  "128. Survive a Week on a Deserted Island",
  "129. Tame a Tiger",
  "130. Touch a Snake",
  "131. Zipline Through the Jungle",
].each do |item|
  
  puts("Add Item: #{item}")

  item = Item.create_with({
    todo: todo
  }).find_or_create_by({
    title: item
  })
  valid? { item }
end

puts("End!...")




  
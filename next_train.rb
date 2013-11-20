=begin
User Story:
As a train commuter
I want to know the train I should take
So that I can return home

Acceptance Criteria:
When I specify a time that I want to leave the office, the system should inform me of the next available train

UserStory:
As a train commuter taking the midnight train
I want to see the lyrics from the Journey's masterpiece "Don't Stop Believin"
So that I can sing along

Acceptance Criteria:
When the system identifies the midnight train as the next available train, the user should be presented with 
the lyrics from "Don't Stop Believin"
=end

def song(train_time)
  puts "***DON'T STOP...BELIEVIN'!***

        Just a small town girl
        Living in a lonely world
        She took the midnight train going anywhere
        Just a city boy
        Born and raised in South Detroit
        He took the midnight train going anywhere

        A singer in a smoky room
        A smell of wine and cheap perfume
        For a smile they can share the night
        It goes on and on and on and on

        Strangers waiting, up and down the boulevard 
        Their shadows searching in the night 
        Streetlights people, living just to find emotion 
        Hiding, somewhere in the night. "
end
schedule = {"Train 1" => 2,
"Train 2" => 5,
"Train 3" => 7.5,
"Train 4" => 8.5,
"Train 5" => 9,
"Train 6" => 10,
"Train 7" => 11.5,
"Train 8" => 13.5,
"Train 9" => 14.5,
"Train 10" => 17,
"Train 11" => 18,
"Train 12" => 19,
"Train 13" => 24
}

puts "What time are you leaving?"
time = gets.chomp

if time.match(/\d|\d*[.]/)
  time = time.to_f
  next_trains = []
  schedule.each do |train|
    if time < train[1]
      next_trains << train
    end
  end
  next_train_select =  next_trains.min_by{ |train, hour| (time - hour).abs}
  next_train = {}
  next_train[:train] = next_train_select[0]
  next_train[:time] = next_train_select[1]
  puts "You should catch #{next_train[:train]} leaving at #{next_train[:time]}"
  if next_train[:time] == 24
    song(next_train[:time])
  end
else
  puts "Invalid input"
end

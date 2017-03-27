require 'pry'

my_songs = {
"Go Go GO" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/04.mp3',
"Wolf" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/05.mp3',
"Blue" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '/Users/iMac/.atom/.learn-ide/home/kylewstewart-56028/code/labs/jukebox-cli/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end


def list(my_songs)
  my_songs.keys.collect {|key| puts key}
end


def play(my_songs)
  puts "Please enter a song name:"
  song = gets.chomp
  song_name = check_song(my_songs, song)
  while song_name == "invalid"
    puts "Invalid input, please try again"
    song = gets.chomp
    song_name = check_song(my_songs, song)
  end
  file = my_songs[song_name]
  system 'open #{file}'
  puts "Playing #{song_name}"
end

def check_song(my_songs, song)
  my_songs.keys.collect {|name| return name if song == name}
  "invalid"
end


def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  command = ""
  while command != "exit"
    puts "Please enter a command:"
    command = gets.chomp
    case command
    when "help"
      help
    when "list"
      list(my_songs)
    when "play"
      play(my_songs)
    when "exit"
      exit
    end
  end
end

run(my_songs)

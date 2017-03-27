songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def play(songs)
  puts "Please enter a song name or number:"
  song = gets.chomp
  song_name = check_song(songs, song)
  while song_name == "invalid"
    puts "Invalid input, please try again"
    song = gets.chomp
    song_name = check_song(songs, song)
  end
  puts "Playing #{song_name}"
end

def check_song(songs, song)
  songs.each_with_index {|val, index| return val if song == (index + 1).to_s || song == val}
  "invalid"
end

def list(songs)
  songs.each_with_index {|val, index| puts "#{index + 1}. #{val}"}
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  command = ""
  while command != "exit"
    puts "Please enter a command:"
    command = gets.chomp
    case command
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "exit"
      exit
    end
  end
end

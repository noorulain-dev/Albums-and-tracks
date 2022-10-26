require './input_functions'

module Genre

POP, CLASSIC, JAZZ, ROCK= *1..4

end

class Album

attr_accessor :title, :artist, :photoloc, :genre, :tracks

def intialize (track_title, track_artist, track_photoloc, track_genre, track_tracks)

@title=track_title
@artist=track_artist
@photoloc=track_photoloc
@genre=track_genre
@tracks=track_tracks

end

end

class Track

attr_accessor :track_title, :track_location

def initialize

@track_title=track_title
@track_location=track_location

end

end


def read_tracks(music_file)

tracks=Array.new()
count=music_file.gets.chomp.to_i
tracks=Array.new

count.times do
track=read_track(music_file)
tracks << track

end

tracks

end


def print_tracks(tracks)

x=0
tracks.times do
print_track(tracks[x], x)
x +=1
end

end

def read_album(music_file)

album_title=music_file.gets.chomp
album_artist=music_file.gets.chomp
album_photo_location=music_file.gets.chomp
album_genre= music_file.gets.chomp
tracks=read_tracks(music_file)
album=Album.new(album_title, album_artist, album_photo_location, album_genre, tracks)
album


end

def read_track(music_file)

x=0
z=0
findx = index_found

@albumarr.times do
if findx == -1
findx = i
end

if (albumarr[i].genre == genre || genre==0 && i==findx)
puts "Track record" +(i+1).to_s
puts "Track title" + albumarr[i].title
puts "Track artist" + albumarr[i].artist
puts " Track cover location" + albumarr[i].photoloc
puts "Track genre" + $genre_names[albumarr[i].genre]
x=print_tracks(albumarr[i].tracks)
z=1
findx=index_found
end
end


if z==1
x

else

puts "Album could not be found. Please read a valid album or recheck the file"
z
end
end

def lookup_albums(albumarr, title)

x=0
index_found=-1
title=title.downcase
albumarr.length.times do
target = albumarr[x].title.chomp.downcase
if (target.include? title)
index_found=x

end

x+=1

end

index_found

end


def add_album(albumarr)

txtfilename=read_string("Enter the name of the file in .txt format")
music_file=File.new(txtfilename, "r")
album_no=music_file.gets.to_i
album_no.times do
album=read_album(music_file)
albumarr<<album
end

music_file.close()
puts("From the selected file"+album_no.to_s +"albums have been read")
album_no

end

def print_albums(albumarr)

index_found=-1
options=read_integer_in_range("Display albums menu:\n1 List of Albums \n2 List of Genre \n3 Look for Album Titles \n4 Lookup Music Genres \n Please enter your choice:", 1, 4)

case options

when 1
print_albums(albumarr, 0 , index_found)

when 2,4
genre = read_integer_in_range("Enter album genre (1. Pop, 2. Classic, 3. Jazz, 4. Rock)",1,4)

when 3
title=read_string("Enter album keyword:")
index_found=search_for_album(albumarr,title)
   if index_found==-1
   puts "Keyword Not Found"
   else
   print_album(albumarr, 0, index_found)
   end
   
end

end


def update_albums(albumarr, album_no)

found=print_album(albumarr,0,-1)
puts"Album found:"+found.to_s

if found != 0

selection = read_integer_in_range("Select album number to edit:",1,album_no)
albumarr[selection-1].title=read_string("Error occurred. Please Enter a new album title")
albumarr[selection-1].genre=read_integer_in_range("Enter new album genre (1.Pop, 2. Classic, 3. Jazz, 4. Rock)",1,4)
found=1

end

found

end


def save_album(albumarr, album_no)

music_file=File.new("albums2.txt","w")
music_file.puts album_no
i=0
b=0

albumarr.times do

music_file.puts albumarr[i].title
music_file.puts albumarr[i].artist
music_file.puts albumarr[i].photoloc
music_file.puts albumarr[i].genre
music_file.puts albumarr[i].tracks.length
i+=1
albumarr.tracks.times do
music_file.puts albumarr[i].tracks[b].track_title
music_file.puts albumarr[i].tracks[b].track_location
b+=1


end
end

music_file.close()

end


def select_album

found=print_albums(albumarr)

if found != 0
selection=read_integer_in_range("Select Album Number",1,album_no)

x=print_tracks(albumarr[selection-1].tracks)
strack=read_integer_in_range("Select Track Number",1,x)
puts "Now playing Track:"+albumarr[selection-1]
tracks[strack-1].ttitle+"From the Album"+albumarr[selection-1].title

end

end


def print_track(track,x)

x+=1
puts(x.to_s+ "Track title is" + track.track_title)
puts("Track file location"+track.track.location)

end


def main

finished = false
changed = false
albumarr=Array.new

begin

puts "Welcome to Music Player \n1 Read music albums \n2 View Music Albums \n3 Choose Music Albums \n4 Update Music Albums \n5 Shutdown"

options = read_integer_in_range("Enter an option of your liking",1,6)

case option

when 1
album_no=add_album(albumarr)

when 2
print_albums(albumarr)

when 3
select_album(albumarr, album_no)

when 4
updated = update_album(albumarr, album_no)

when 5
if updated ==1
save_album(albumarr, album_no)
puts "Please be patient. Updating the existing records"

end

finished = true

else

puts "Please select again"

end
end until finished



end


main





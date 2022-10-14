FILE=$1
ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.opus}.mp3";

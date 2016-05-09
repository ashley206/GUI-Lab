import QtQuick 2.6
import QtQuick.Controls 1.5
import QtMultimedia 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("iPod")

    property bool is_playing: false
    property bool menu_isopen: false

    // Possibly use hash table instead...iffy on qml's implementation of them, though (basically tuples and cannot change them)
    property variant songs: ["Burning the Nicotine Armoire",
                             "Happiness",
                             "Open Your Eyes And Look North",
                             "Surprise! I'm From Cuba, Everyone Else Has One Brain."]
    property variant bands: ["Dance Gavin Dance", "Dance Gavin Dance", "Dance Gavin Dance"]
    property int song_index: 0
    property variant sources: ["../songs/Dance Gavin Dance - Burning Down the Nicotine Armoire (audio-cutter.com).mp3",
                               "../songs/Dance Gavin Dance - Happiness.mp3",
                               "../songs/Dance Gavin Dance - Open Your Eyes and Look North.mp3"]
    property int number_of_songs: 3

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Audio
        {
            id: song_current
            source: sources[song_index]
            volume: volume_slider.value
        }

        Image {
            id: img_iPod
            source: "iPod.svg"
            smooth: true
            sourceSize.width: parent.width * .89
            sourceSize.height: parent.height * .90
            anchors.centerIn: parent

            Rectangle
            {
                id: iPod_screen
                x: 50
                y: 31
                width: 258 - x
                height: 187 - y
                color: "orange"

                Text
                {
                    id: txt_screen_song
                    width: parent.width
                    y: 0
                    text: is_playing === true ? "Song: " + songs[song_index] : ""
                    //font.family: "BELLABOO"
                    font.pointSize: 12
                    wrapMode: Text.Wrap
                }

                Text
                {
                    id: txt_screen_band

                    anchors.top: txt_screen_song.bottom
                    width: parent.width
                    text: is_playing === true ? "Band: " + bands[song_index] : ""
                    //font.family: "BELLABOO"
                    font.pointSize: 12
                    wrapMode: Text.Wrap
                }
                MouseArea
                {
                    id: ma_screen
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("x = " + ma_screen.mouseX)
                        console.log("y = " + ma_screen.mouseY)
                        console.log("Screen clicked!")
                    }

                }

            }
            Rectangle{
                id: menu_screen
                visible: false
                x: 50
                y: 31
                width: 258 - x
                height: 187 - y
                color: "orange"

                Text{
                    id: txt_screen_menu
                    width: parent.width
                    y: 0
                    font.pointSize: 8
                    wrapMode: Text.Wrap
                    text: {
                        songs[0] + '\n' + songs[1] + '\n' + songs[2] + '\n' + songs[3];
                    }


                }
            }
            Rectangle
            {
                id: iPod_back_button
                x:80
                y: 250
                width: 40
                height: 83
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_back
                    anchors.fill: parent

                    onClicked:
                    {
                        if(song_index === 0)
                            song_index = number_of_songs;
                        else
                            song_index--;
                        txt_screen_song.text = "Song: " + songs[song_index]
                        txt_screen_band.text = "Band: " + bands[song_index]
                        song_current.play()
                        console.log("x = " + ma_mousearea_back.mouseX)
                        console.log("y = " + ma_mousearea_back.mouseY)
                        console.log("Back button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_forward_button
                x: 185
                y: 262
                width: 228 - x
                height: 331 - y
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_forward
                    anchors.fill: parent

                    onClicked:
                    {
                        // As long as you stay under the limit, you're good. If you hit the number of songs, go back to 0
                        // Just increment song index
                        if(song_index === number_of_songs)
                            song_index = 0;
                        else
                            song_index++;
                        txt_screen_song.text = "Song: " + songs[song_index]
                        txt_screen_band.text = "Band: " + bands[song_index]
                        song_current.play()

                        console.log("x = " + ma_mousearea_forward.mouseX)
                        console.log("y = " + ma_mousearea_forward.mouseY)
                        console.log("Forward button clicked!")
                    }
                }
            }

            Rectangle
            {
                id: iPod_menu_button
                x: 130
                y: 225
                width: 47
                height: 263 - y
                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_menu
                    anchors.fill: parent

                    onClicked:
                    {
                        if(menu_isopen === true)
                        {
                            iPod_screen.visible = false;
                            menu_screen.visible = true;
                            menu_isopen = false;
                        }
                        else
                        {
                            iPod_screen.visible = true;
                            menu_screen.visible = false;
                            menu_isopen = true;
                        }

                        console.log("Menu button clicked!");

                    }
                }
            }

            Rectangle
            {
                id: iPod_play_button
                x: 130
                y: 325
                width: 45
                height: 45

                // Use console.log() to find appropriate values of
                // x,y,width and height for mouse area

                color: "transparent"

                MouseArea
                {
                    id: ma_mousearea_play
                    anchors.fill: parent

                    onClicked:
                    {
                        if(menu_screen.visible === true)
                        {
                            menu_screen.visible=false;
                            iPod_screen.visible = true;
                        }

                        if(is_playing === false)    // click & is paused
                        {
                            is_playing = true;
                            txt_screen_song.text = "Song: " + songs[song_index]
                            txt_screen_band.text = "Band: " + bands[song_index]
                            song_current.play()
                        }
                        else        // click & is playing
                        {
                            is_playing = false;
                            txt_screen_song.text = "";
                            txt_screen_band.text = "";
                            song_current.pause();
                        }
                        console.log("x = " + ma_mousearea_play.mouseX)
                        console.log("y = " + ma_mousearea_play.mouseY)
                        console.log("Play button clicked!")
//                        var str = is_playing ? "playing" : "paused"
//                        console.log("Now " + str );
                    }
                }
            }


            Rectangle
            {
                id: iPod_slider
                anchors.top: iPod_play_button.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: iPod_play_button.horizontalCenter
                width: volume_slider.width
                // Use console.log() to find appropriate values of
                // x,y,width and height for mouse area

                color: "transparent"
                Slider{
                    id: volume_slider

                    value: 0.5
                }

            }
        }

    }
}

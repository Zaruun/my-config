from pytube import YouTube, Playlist

while True:
    print("1) Download a single video")
    print("2) Download a playlist")
    print("q) Exit")
    print("")

    choice = str(input("Choice: "))
    print("")

    if choice == "1":
        url = input("Enter the URL of the video: ")
        yt = YouTube(url)
        print("Title: ", yt.title)
        ys = yt.streams.get_highest_resolution()
        print("Downloading...")
        ys.download()
        print("Download completed!!")
    elif choice == "2":
        url = input("Enter the URL of the playlist: ")
        pl = Playlist(url)
        print("")
        print(f"Number of videos in playlist: {len(pl.video_urls)}" )
        print("")
        print("Downloading:")

        i = 1
        for video in pl.videos:
            print(f"{i} - {video.title}")
            video.streams.get_highest_resolution().download(filename=f"{i} - {video.title}.mp4")
            i += 1
        print("Download completed!!")
    elif choice == "q":
        break
class SongsController < ApplicationController
    def index
        @songs = Song.all 
    end

    def new
        @song = Song.new
    end

    def show 
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        @song.save
        redirect_to song_path(@song)
    end

    def update
        @song = Song.update(song_params)
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    private

    def song_params(*args)
        params.require(:song).permit(:name, :arist_id, :genre_id)
    end
end

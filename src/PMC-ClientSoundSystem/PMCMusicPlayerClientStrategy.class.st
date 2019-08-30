Class {
	#name : #PMCMusicPlayerClientStrategy,
	#superclass : #PMCMusicPlayerVLCStrategy,
	#category : #'PMC-ClientSoundSystem'
}

{ #category : #adding }
PMCMusicPlayerClientStrategy >> mediaForPlayable: aPlayable [
	| media |
	media := aPlayable path createMediaWithVLC: vlc forInstance: vlcInstance.
	vlc addOption: ':sout=#transcode{vcodec=theo,vb=1600,acodec=none}:standard{mux=ogg,dst=:8484/vlc_stream.ogg,access=http}' toMedia: media.
	^ media
]

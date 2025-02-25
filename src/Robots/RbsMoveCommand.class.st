Class {
	#name : 'RbsMoveCommand',
	#superclass : 'RbsCommand',
	#instVars : [
		'distance'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsMoveCommand class >> commandName [

	^ 'mov'
]

{ #category : 'accessing' }
RbsMoveCommand >> distance [

	^ distance
]

{ #category : 'accessing' }
RbsMoveCommand >> distance: anInteger [

	distance := anInteger
]

{ #category : 'execution' }
RbsMoveCommand >> executeOn: aRbsRobot [

	aRbsRobot move: distance
]

{ #category : 'as yet unclassified' }
RbsMoveCommand >> handleArguments: aCollection [

	distance := Object readFrom: aCollection first
]

{ #category : 'printing' }
RbsMoveCommand >> printOn: aStream [

	aStream
		nextPutAll: 'mov ';
		nextPutAll: distance asString
]

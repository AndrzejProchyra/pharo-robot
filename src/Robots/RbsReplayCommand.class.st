Class {
	#name : 'RbsReplayCommand',
	#superclass : 'RbsCommand',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsReplayCommand class >> commandName [

	^ 'replay'
]

{ #category : 'adding' }
RbsReplayCommand >> addToPathOf: aRobot [

	^ self
]

{ #category : 'execution' }
RbsReplayCommand >> executeOn: aRobot [

	aRobot replay
]

{ #category : 'as yet unclassified' }
RbsReplayCommand >> handleArguments: aCollection [

	^ self
]

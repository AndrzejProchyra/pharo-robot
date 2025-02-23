Class {
	#name : 'RbsDirectionCommand',
	#superclass : 'RbsCommand',
	#instVars : [
		'direction',
		'directionToOpposite'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsDirectionCommand class >> commandName [

	^ 'dir'
]

{ #category : 'as yet unclassified' }
RbsDirectionCommand >> computeOppositeDirection: aDirection [

	^ directionToOpposite at: aDirection
]

{ #category : 'execution' }
RbsDirectionCommand >> executeOn: aRbsRobot [

	aRbsRobot direction: direction
]

{ #category : 'as yet unclassified' }
RbsDirectionCommand >> handleArguments: aCollection [

	direction := Object readFrom: aCollection first
]

{ #category : 'initialization' }
RbsDirectionCommand >> initialize [

	super initialize.
	directionToOpposite := {
		                       (#north -> #south).
		                       (#south -> #north).
		                       (#west -> #east).
		                       (#east -> #west) } asDictionary
]

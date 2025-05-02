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

{ #category : 'converting' }
RbsDirectionCommand >> asWayBack [

	^ self class new direction:
		  (self computeOppositeDirection: direction)
]

{ #category : 'as yet unclassified' }
RbsDirectionCommand >> computeOppositeDirection: aDirection [

	^ directionToOpposite at: aDirection
]

{ #category : 'accessing' }
RbsDirectionCommand >> direction [

	^ direction
]

{ #category : 'accessing' }
RbsDirectionCommand >> direction: aString [ 
	direction := aString
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

{ #category : 'converting' }
RbsDirectionCommand >> mergeWithDirectionCommand: aRbsDirectionCommand [

	^ { self }
]

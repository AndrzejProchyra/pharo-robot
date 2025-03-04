Class {
	#name : 'RbsCommand',
	#superclass : 'Object',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsCommand class >> commandName [

	^ 'wback'
]

{ #category : 'adding' }
RbsCommand >> addToPathOf: aRobot [

	aRobot addToPath: self
]

{ #category : 'converting' }
RbsCommand >> asWayBack [

	^ self
]

{ #category : 'execution' }
RbsCommand >> executeOn: aRobot [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
RbsCommand >> handleArguments: aCollection [

	self subclassResponsibility
]

{ #category : 'operations' }
RbsCommand >> mergeWith: aCommand [

	^ aCommand mergeWithDirectionCommand: self
]

{ #category : 'as yet unclassified' }
RbsCommand >> mergeWithDirectionCommand: aRbsDirectionCommand [

	^ {
		  aRbsDirectionCommand.
		  self }
]

{ #category : 'as yet unclassified' }
RbsCommand >> mergeWithMoveCommand: aRbsMoveCommand [

	^ {
		  aRbsMoveCommand.
		  self }
]

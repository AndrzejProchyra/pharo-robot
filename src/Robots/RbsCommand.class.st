Class {
	#name : 'RbsCommand',
	#superclass : 'Object',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsCommand class >> commandName [

	self subclassResponsibility
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

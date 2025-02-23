Class {
	#name : 'RbsResetCommand',
	#superclass : 'RbsCommand',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsResetCommand class >> commandName [

	^ 'resM'
]

{ #category : 'execution' }
RbsResetCommand >> executeOn: aRobot [

	aRobot resetPath
]

{ #category : 'as yet unclassified' }
RbsResetCommand >> handleArguments: aCollection [

	^ self
]

Class {
	#name : 'RbsBaseCommand',
	#superclass : 'RbsCommand',
	#instVars : [
		'base'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsBaseCommand class >> commandName [

	^ 'base'
]

{ #category : 'execution' }
RbsBaseCommand >> executeOn: aRbsRobot [

	aRbsRobot x: base x y: base y
]

{ #category : 'as yet unclassified' }
RbsBaseCommand >> handleArguments: aCollection [

	base := (Object readFrom: aCollection first)
	        @ (Object readFrom: aCollection second)
]

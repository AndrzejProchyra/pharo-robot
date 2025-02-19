Class {
	#name : 'RbsDirectionCommand',
	#superclass : 'RbsCommand',
	#instVars : [
		'direction'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsDirectionCommand class >> commandName [

	^ 'dir'
]

{ #category : 'execution' }
RbsDirectionCommand >> executeOn: aRbsRobot [

	aRbsRobot direction: direction
]

{ #category : 'as yet unclassified' }
RbsDirectionCommand >> handleArguments: aCollection [

	direction := Object readFrom: aCollection first
]

Class {
	#name : 'RbsRobot',
	#superclass : 'RbsAbstractRobot',
	#instVars : [
		'direction',
		'commandMap',
		'path'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'as yet unclassified' }
RbsRobot >> commandClassFor: aString [

	^ commandMap at: aString
]

{ #category : 'as yet unclassified' }
RbsRobot >> computeNewPosition: anInteger [
	"Returns a point representing the location of the net move."

	^ direction = #east
		  ifTrue: [ self x + anInteger @ self y ]
		  ifFalse: [
			  direction = #west
				  ifTrue: [ self x - anInteger @ self y ]
				  ifFalse: [
					  direction = #north
						  ifTrue: [ self x @ (self y + anInteger) ]
						  ifFalse: [ self x @ (self y - anInteger) ] ] ]
]

{ #category : 'accessing' }
RbsRobot >> direction [

	^ direction
]

{ #category : 'accessing' }
RbsRobot >> direction: aDirection [

	direction := aDirection
]

{ #category : 'execution' }
RbsRobot >> execute: aString [

	| orders |
	orders := self identifyOrdersOf: aString.
	orders do: [ :order |
		order first = 'dir'
			ifTrue: [ self direction: (Object readFrom: order second) ]
			ifFalse: [
				order first = 'base'
					ifTrue: [
						self
							x: (Object readFrom: order second)
							y: (Object readFrom: order third) ]
					ifFalse: [
						order first = 'dropL'
							ifTrue: [ board atX: x - 1 atY: y put: RbsItem new ]
							ifFalse: [ self move: (Object readFrom: order second) ] ] ] ]
]

{ #category : 'as yet unclassified' }
RbsRobot >> executeCommand: anOrder [

	| command |
	command := (self commandClassFor: anOrder first) new.
	command handleArguments: anOrder allButFirst.
	path add: command.

	^ command executeOn: self
]

{ #category : 'as yet unclassified' }
RbsRobot >> executeCommandBased: aString [

	| orders |
	orders := self identifyOrdersOf: aString.
	orders do: [ :each | self executeCommand: each ]
]

{ #category : 'as yet unclassified' }
RbsRobot >> identifyOrdersOf: aString [

	| orders |
	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].
	^ orders
]

{ #category : 'initialization' }
RbsRobot >> initialize [

	super initialize.
	self initializeCommandMapping.
	path := OrderedCollection new.
	direction := #east
]

{ #category : 'initialization' }
RbsRobot >> initializeCommandMapping [

	commandMap := Dictionary new.
	RbsCommand allSubclassesDo: [ :each |
		commandMap at: each commandName put: each ]
]

{ #category : 'accessing' }
RbsRobot >> move: aDistance [

	| newPosition |
	newPosition := self computeNewPosition: aDistance.
	self board atX: self x atY: self y put: previousTile.
	self x: newPosition x y: newPosition y
]

{ #category : 'accessing' }
RbsRobot >> path [

	^ path
]

{ #category : 'accessing' }
RbsRobot >> previousTile [

	^ previousTile
]

{ #category : 'as yet unclassified' }
RbsRobot >> replay [

	path do: [ :each | each executeOn: self ]
]

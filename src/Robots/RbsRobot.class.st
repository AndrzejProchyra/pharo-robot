Class {
	#name : 'RbsRobot',
	#superclass : 'RbsAbstractRobot',
	#instVars : [
		'direction',
		'commandMap',
		'path',
		'monitoring'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'adding' }
RbsRobot >> addToPath: aCommand [ 
	
	path add: aCommand
]

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
	command := self getCommandFrom: anOrder.
	monitoring ifTrue: [ command addToPathOf: self ].
	^ command executeOn: self
]

{ #category : 'as yet unclassified' }
RbsRobot >> executeCommandBased: aString [

	| orders |
	orders := self identifyOrdersOf: aString.
	orders do: [ :each | self executeCommand: each ]
]

{ #category : 'as yet unclassified' }
RbsRobot >> getCommandFrom: anOrder [

	| command |
	command := (self commandClassFor: anOrder first) new.
	command handleArguments: anOrder allButFirst.
	^ command
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
	monitoring := true.
	direction := #east
]

{ #category : 'initialization' }
RbsRobot >> initializeCommandMapping [

	commandMap := Dictionary new.
	RbsCommand allSubclassesDo: [ :each |
		commandMap at: each commandName put: each ]
]

{ #category : 'as yet unclassified' }
RbsRobot >> mergeCommands: commands [

	^ commands inject: OrderedCollection new into: [ :acc :each |
		  | last merged |
		  acc isEmpty
			  ifTrue: [ acc add: each ]
			  ifFalse: [
				  last := acc last.
				  merged := last mergeWith: each.
				  acc removeLast.
				  acc addAll: merged ].
		  acc ]
]

{ #category : 'accessing' }
RbsRobot >> move: aDistance [

	| newPosition |
	newPosition := self computeNewPosition: aDistance.
	self board atX: self x atY: self y put: previousTile.
	self x: newPosition x y: newPosition y
]

{ #category : 'as yet unclassified' }
RbsRobot >> optimizePath: aString [

	| orders commands |
	orders := self identifyOrdersOf: aString.
	commands := orders collect: [ :order | self getCommandFrom: order ].
	path := self mergeCommands: commands
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

{ #category : 'initialization' }
RbsRobot >> resetPath [

	path reset
]

{ #category : 'startup - shutdown' }
RbsRobot >> stopMonitoring [

	monitoring := false
]

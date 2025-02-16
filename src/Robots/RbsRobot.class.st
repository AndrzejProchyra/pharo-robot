Class {
	#name : 'RbsRobot',
	#superclass : 'RbsAbstractRobot',
	#instVars : [
		'direction'
	],
	#category : 'Robots',
	#package : 'Robots'
}

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
					ifFalse: [ self move: (Object readFrom: order second) ] ] ]
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
	direction := #east
]

{ #category : 'accessing' }
RbsRobot >> move: aDistance [

	| newPosition |
	newPosition := self computeNewPosition: aDistance.
	self board atX: self x atY: self y put: previousTile.
	self x: newPosition x y: newPosition y
]

{ #category : 'accessing' }
RbsRobot >> previousTile [

	^ previousTile
]

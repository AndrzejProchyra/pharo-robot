Class {
	#name : 'RbsRobot',
	#superclass : 'RbsAbstractRobot',
	#instVars : [
		'direction'
	],
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsRobot >> direction [

	^ direction
]

{ #category : 'initialization' }
RbsRobot >> initialize [

	super initialize.
	direction := #east
]

{ #category : 'accessing' }
RbsRobot >> move: aDistance [

	board atX: x + aDistance atY: y put: self.
	board atX: x atY: y put: previousTile
]

Class {
	#name : 'RbsWaybackCommand',
	#superclass : 'RbsCommand',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'adding' }
RbsWaybackCommand >> addToPathOf: aRobot [

	^ self
]

{ #category : 'execution' }
RbsWaybackCommand >> executeOn: aRobot [

	| reversePath |
	reversePath := OrderedCollection new.
	aRobot path reversed
		ifCutOn: [ :s | s class name = #RbsDirectionCommand ]
		doWithCutAndUncuts: [ :cut :before |
			reversePath
				addLast: cut;
				addAll: before ]
		finally: [ :u | reversePath addLast: u ].
	reversePath do: [ :each | each asWayBack executeOn: aRobot ]
]

{ #category : 'as yet unclassified' }
RbsWaybackCommand >> handleArguments: aCollection [

	^ self
]

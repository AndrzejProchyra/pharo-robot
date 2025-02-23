Class {
	#name : 'RbsStopMonitoringCommand',
	#superclass : 'RbsCommand',
	#category : 'Robots',
	#package : 'Robots'
}

{ #category : 'accessing' }
RbsStopMonitoringCommand class >> commandName [

	^ 'stopM'
]

{ #category : 'adding' }
RbsStopMonitoringCommand >> addToPathOf: aRobot [

	^ self
]

{ #category : 'execution' }
RbsStopMonitoringCommand >> executeOn: aRobot [

	aRobot stopMonitoring
]

{ #category : 'as yet unclassified' }
RbsStopMonitoringCommand >> handleArguments: aCollection [

	^ self
]

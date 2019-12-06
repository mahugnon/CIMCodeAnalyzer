Class {
	#name : #PWBSpaceRemoveIlandParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'code',
		'water'
	],
	#category : #PWBCloneDetector
}

{ #category : #accessing }
PWBSpaceRemoveIlandParser >> start [
	^ code / water
]

{ #category : #accessing }
PWBSpaceRemoveIlandParser >> water [
	^ (Character space parser / Character tab parser) plus
]

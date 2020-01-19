Class {
	#name : #CIMInterrestingEntityAnnoucement,
	#superclass : #Announcement,
	#instVars : [
		'interrestingEntity'
	],
	#category : #'PWBCodeAnalyser-Interaction'
}

{ #category : #accessing }
CIMInterrestingEntityAnnoucement >> interrestingEntity [
	^ interrestingEntity
]

{ #category : #accessing }
CIMInterrestingEntityAnnoucement >> interrestingEntity: anObject [
	interrestingEntity := anObject
]

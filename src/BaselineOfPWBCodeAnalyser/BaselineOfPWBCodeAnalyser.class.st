Class {
	#name : #BaselineOfPWBCodeAnalyser,
	#superclass : #BaselineOf,
	#category : #BaselineOfPWBCodeAnalyser
}

{ #category : #baselines }
BaselineOfPWBCodeAnalyser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self baselineOfRoassal2Spec2: spec .
			self baselineOfPowerBuilderParser: spec.
			spec package: 'PWBCodeAnalyser'
			with:[
				spec requires: #('PowerBuilderParser' 'Roassal2Spec2')] ]
]

{ #category : #baselines }
BaselineOfPWBCodeAnalyser >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:LastestMoose8/src' ]
]

{ #category : #baselines }
BaselineOfPWBCodeAnalyser >> baselineOfRoassal2Spec2: spec [
	spec
		baseline: 'Roassal2Spec2'
		with: [ spec repository: 'github://mahugnon/Roassal2Spec2:master/src' ]
]

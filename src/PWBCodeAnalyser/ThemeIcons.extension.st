Extension { #name : #ThemeIcons }

{ #category : #'*PWBCodeAnalyser' }
ThemeIcons >> callTreeContent [
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAB0ElEQVQ4T5WTz0sVURTHz5lc
NIg7GfTdOzcXwp0nRYG0F39sRFCohMLCRVsDW1mbgjYFkYsghDYpb6GCuGtRFgUt/AuaOxBE
M/fOA32I4GiROifmgTJvknrv7u453+8Hzi+EwiuVlLQApxFpDgB2AWCbgGqA8FDr8qeiHvMB
l6lVALhBRPd0XH5ZFJ/1PwW4LHhPSItae5VmjCeaOoB3+3Nwzgq0luvNmjn3B7KSUHD/MRFO
Rcbrbdac6VymAqdLXkSXBZvHBNNxLFUrgAtMDaaAl9Hlwc9IS/tvc4U7TttkFt/aOloFmNJF
jcvUKxRMfQyNN5hPClEZS5L2Cdv+9cWYm286O9fms3ytdm22YWol/zMKFnwIjRwqAijpmEjt
g1OAnbZ1RDvjd/M6zvy9DLARGjl8Vv2Os3z/PyUYdJkipHQkjPs2WmmiYMEdAhpF0e33E+JC
FHtXWwFwppYIrJX6IgnmPwC0KNTyaTMQwdUzIkgi4z3JrbJ6S0jrWpdf/wsi2NfbBNZSZLy6
t+GYeMmfQbT6j9LjR9Vq348TUE/P9/Pp4e9JAroOiEmk5a2GW2gYDf/Wi3T4AsC6QkT7gLAD
RJcArOdI6WZULb/L6/8AIG3Ae1jog4MAAAAASUVORK5CYII='
]

{ #category : #'*PWBCodeAnalyser' }
ThemeIcons >> callTreeIcon [
	^ icons
			at: #'callTreeIcon'
			ifAbsentPut:[ Form fromBinaryStream: self callTreeContent base64Decoded asByteArray readStream ]
]

function onStartCountdown()
defaultDadY = getCharacterY('dad')
end

function onUpdate(elapsed)
songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/15)

		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 400*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 1000*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 400*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 800*math.sin((currentBeat+4*0.25)*math.pi), 0.5)

		noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 800*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 400*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 1000*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 400*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
setCharacterY('dad', getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/3)
end
function noteMissPress(direction)
setProperty('health', getProperty('health') + 0.023)
end
end
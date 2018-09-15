extends Control

onready var score = get_node("../Background/currentHighScore/Score")
onready var name1 = get_node("../Background/currentScoreList/ScoreList/Name/name1")
onready var name2 = get_node("../Background/currentScoreList/ScoreList/Name/name2")
onready var name3 = get_node("../Background/currentScoreList/ScoreList/Name/name3")
onready var name4 = get_node("../Background/currentScoreList/ScoreList/Name/name4")
onready var name5 = get_node("../Background/currentScoreList/ScoreList/Name/name5")
onready var name6 = get_node("../Background/currentScoreList/ScoreList/Name/name6")
onready var score1 = get_node("../Background/currentScoreList/ScoreList/Score/score1")
onready var score2 = get_node("../Background/currentScoreList/ScoreList/Score/score2")
onready var score3 = get_node("../Background/currentScoreList/ScoreList/Score/score3")
onready var score4 = get_node("../Background/currentScoreList/ScoreList/Score/score4")
onready var score5 = get_node("../Background/currentScoreList/ScoreList/Score/score5")
onready var score6 = get_node("../Background/currentScoreList/ScoreList/Score/score6")
onready var clock = get_node("../../../Hud/Clock")
const SAVE_PATH = "res://save.json"

var bestscore
var bestname

var scoreTemp
var arrScore = []

func _ready():
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		load_bestscore()

func _process(delta):
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		if arrScore.size() > 0:
			name1.text = arrScore[0]
			score1.text = arrScore[1]
		if arrScore.size() > 3:
			name2.text = arrScore[2]
			score2.text = arrScore[3]
		if arrScore.size() > 5:
			name3.text = arrScore[4]
			score3.text = arrScore[5]
		if arrScore.size() > 7:
			name4.text = arrScore[6]
			score4.text = arrScore[7]
		if arrScore.size() > 9:
			name5.text = arrScore[8]
			score5.text = arrScore[9]
		if arrScore.size() > 11:
			name6.text = arrScore[10]
			score6.text = arrScore[11]
			
	var names = []
	var scores = []
	var countName = 0
	var countScore = 1
	
	for i in range(0, arrScore.size()):
		if i < arrScore.size()/2:
			names.append(arrScore[i+countName])
			countName += 1
		if i < arrScore.size()/2:
			scores.append(arrScore[i+countScore])
			countScore +=1
		
	print('NAMEN: ', names)
	print('SCORE: ', scores)

	
func load_bestscore():
	var file = File.new()
	if not file.file_exists(SAVE_PATH): 
		return
	file.open(SAVE_PATH, File.READ)
	scoreTemp = file.get_var()
	file.close()
	arrScore = scoreTemp.split(",")

func save_bestscore():
	var file = File.new()
	file.open(SAVE_PATH, File.WRITE)
	file.store_var(str(bestname, ",", bestscore, ",", scoreTemp))
	file.close()

func set_bestscore(new_value, new_name):
	bestscore = new_value
	bestname = new_name
	save_bestscore() 


func _on_LineEdit_text_entered(new_text):
	bestname = new_text
	set_bestscore(score.text, new_text)
	load_bestscore()

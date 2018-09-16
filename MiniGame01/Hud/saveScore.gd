extends Control

onready var score = get_node("../Background/currentHighScore/Score")
onready var name1 = get_node("../Background/currentScoreList/ScoreList/Name/name1")
onready var nameM1 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name1")
onready var name2 = get_node("../Background/currentScoreList/ScoreList/Name/name2")
onready var nameM2 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name2")
onready var name3 = get_node("../Background/currentScoreList/ScoreList/Name/name3")
onready var nameM3 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name3")
onready var name4 = get_node("../Background/currentScoreList/ScoreList/Name/name4")
onready var nameM4 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name4")
onready var name5 = get_node("../Background/currentScoreList/ScoreList/Name/name5")
onready var nameM5 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name5")
onready var name6 = get_node("../Background/currentScoreList/ScoreList/Name/name6")
onready var nameM6 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Name/name6")
onready var score1 = get_node("../Background/currentScoreList/ScoreList/Score/score1")
onready var scoreM1 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score1")
onready var score2 = get_node("../Background/currentScoreList/ScoreList/Score/score2")
onready var scoreM2 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score2")
onready var score3 = get_node("../Background/currentScoreList/ScoreList/Score/score3")
onready var scoreM3 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score3")
onready var score4 = get_node("../Background/currentScoreList/ScoreList/Score/score4")
onready var scoreM4 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score4")
onready var score5 = get_node("../Background/currentScoreList/ScoreList/Score/score5")
onready var scoreM5 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score5")
onready var score6 = get_node("../Background/currentScoreList/ScoreList/Score/score6")
onready var scoreM6 = get_node("../../../../../../Menu/currentScoreList/ScoreList/Score/score6")
onready var clock = get_node("../../../Hud/Clock")
const SAVE_PATH = "res://save.json"


var bestscore
var bestname

var scoreTemp
var arrScore = []

var arrscoreSort = [0,0,0,0,0,0]
var arrnameSort = ["___","___","___","___","___","___"]
var loc

func _ready():
		load_bestscore()

func _process(delta):
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		if arrScore.size() > 0:
			name1.text = arrnameSort[0]
			nameM1.text = arrnameSort[0]
			score1.text = str(arrscoreSort[0])
			scoreM1.text = str(arrscoreSort[0])
		if arrScore.size() > 3:
			name2.text = arrnameSort[1]
			nameM2.text = arrnameSort[1]
			score2.text = str(arrscoreSort[1])
			scoreM2.text = str(arrscoreSort[1])
		if arrScore.size() > 5:
			name3.text = arrnameSort[2]
			nameM3.text = arrnameSort[2]
			score3.text = str(arrscoreSort[2])
			scoreM3.text = str(arrscoreSort[2])
		if arrScore.size() > 7:
			name4.text = arrnameSort[3]
			nameM4.text = arrnameSort[3]
			score4.text = str(arrscoreSort[3])
			scoreM4.text = str(arrscoreSort[3])
		if arrScore.size() > 9:
			name5.text = arrnameSort[4]
			nameM5.text = arrnameSort[4]
			score5.text = str(arrscoreSort[4])
			scoreM5.text = str(arrscoreSort[4])
		if arrScore.size() > 11:
			name6.text = arrnameSort[5]
			nameM6.text = arrnameSort[5]
			score6.text = str(arrscoreSort[5])
			scoreM6.text = str(arrscoreSort[5])
			
func load_bestscore():
	arrscoreSort = [0,0,0,0,0,0]
	arrnameSort = ["___","___","___","___","___","___"]
	var countName = 0
	var countScore = 1
	var names = []
	var scores = []
	var file = File.new()

	if file.file_exists(SAVE_PATH):
		if not file.file_exists(SAVE_PATH): 
			return
		file.open(SAVE_PATH, File.READ)
		scoreTemp = file.get_var()
		file.close()
		arrScore = scoreTemp.split(",")
		for i in range(0, arrScore.size()/2):
			if i < arrScore.size()/2:
				names.append(arrScore[i+countName])
				countName += 1
				scores.append(arrScore[i+countScore])
				countScore +=1
		#print(names)
		#print(scores)
	#ARRAY SORT
		for i in range(0, scores.size()):
			for j in range(0, arrscoreSort.size()):
				if int(scores[i]) >= arrscoreSort[arrscoreSort.size()-1-j]:
					loc = arrscoreSort.size()-1-j
			for k in range(0, arrscoreSort.size()-(loc+1)):
				arrscoreSort[arrscoreSort.size()-1-k] = arrscoreSort[arrscoreSort.size()-2-k]
				arrnameSort[arrscoreSort.size()-1-k] = arrnameSort[arrscoreSort.size()-2-k]
			arrscoreSort[loc] = int(scores[i])
			arrnameSort[loc] = names[i]
		#print(arrscoreSort)
		#print(arrnameSort)

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

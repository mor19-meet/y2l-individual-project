from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home_page():
    return render_template("home.html")

@app.route('/game')
def memory_game():
	return render_template('text.html')

@app.route('/endgame')
def endGamePage():
	return render_template('endGame.html')





if __name__ == '__main__':
    app.run(debug=True)


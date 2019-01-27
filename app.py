from flask import Flask, render_template, request, redirect, url_for
from database import *

app = Flask(__name__)
app.config['SECRET_KEY'] = 'suoer-secret-key'

@app.route('/')
def home_page():
    return render_template("home.html")

@app.route('/game')
def memory_game():
    return render_template('text.html')

@app.route('/endgame')
def endGamePage():
    return render_template('endGame.html')

@app.route('/' , methods = ['GET', 'POST'])
def add_a_name():
	if request.method == 'GET':
		return render_template('home.html')
	else:
		name = request.form['name']

		save_to_database(name)
		print("click below to play")
		return redirect(url_for('text.html'))

if __name__ == '__main__':
    app.run(debug=True)


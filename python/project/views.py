from project import app

@app.route("/")
def hello():
    return "<span style='color:red'>Hello from Flask!</span>"

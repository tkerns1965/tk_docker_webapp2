from project import app
from project.models import Company

@app.route("/")
def hello():
    return "<span style='color:red'>Hello from Flask!</span>"

from project import app
from project.models import Company

@app.route("/")
def hello():
    company_no = Company.get(Company.company_no == 10)
    return "<span style='color:red'>Hello from Flask!</span>"

from flask import render_template
from project import app
from project.models import Company

@app.route("/")
def show_company():
    user = {'nickname': 'Tony'}
    company_no = Company.get(Company.company_no == 10)
    # company_no = 11
    return render_template("show_company.html",
                           title="Home",
                           user=user,
                           company_no=company_no)

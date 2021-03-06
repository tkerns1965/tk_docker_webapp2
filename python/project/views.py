from flask import render_template

from project import app
from project.models.tables import Company

@app.route("/")
def show_company():
    user = {'nickname' : 'Tony'}
    company = Company.get(Company.company_no == 10)
    return render_template('show_company.html',
                           title = 'Home',
                           user = user,
                           company = company)

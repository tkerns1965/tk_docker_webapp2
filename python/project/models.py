from peewee import *

database = MySQLDatabase('timesheets', **{'host': '172.18.0.2', 'port': 3306, 'user': 'tony', 'password': '2hard4u'})

# class UnknownField(object):
#     def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Class(BaseModel):
    class_code = CharField()
    class_id = PrimaryKeyField()
    class_note = CharField(null=True)
    employee_id = IntegerField()
    equipment_code = CharField(null=True)
    equipment_note = CharField(null=True)

    class Meta:
        db_table = 'class_id'
        indexes = (
            (('employee_id', 'class_code', 'class_note', 'equipment_code', 'equipment_note'), True),
        )

class Company(BaseModel):
    company_no = PrimaryKeyField()

    class Meta:
        db_table = 'company'

class Employee(BaseModel):
    employee_code = CharField()
    employee_id = PrimaryKeyField()
    employee_note = CharField(null=True)
    timesheet_id = IntegerField()

    class Meta:
        db_table = 'employee_id'
        indexes = (
            (('timesheet_id', 'employee_code', 'employee_note'), True),
        )

class Hours(BaseModel):
    class_id = IntegerField()
    equipment_hours = DecimalField(null=True)
    labor_hours = DecimalField()
    phase_id = IntegerField()

    class Meta:
        db_table = 'hours'
        indexes = (
            (('phase_id', 'class_id'), True),
        )
        primary_key = CompositeKey('class_id', 'phase_id')

class Job(BaseModel):
    company_no = IntegerField()
    job_code = CharField()
    job_id = PrimaryKeyField()

    class Meta:
        db_table = 'job'
        indexes = (
            (('company_no', 'job_code'), True),
        )

class Phase(BaseModel):
    phase_code = CharField()
    phase_id = PrimaryKeyField()
    phase_note = CharField(null=True)
    timesheet_id = IntegerField()

    class Meta:
        db_table = 'phase'
        indexes = (
            (('timesheet_id', 'phase_code', 'phase_note'), True),
        )

class Timesheet(BaseModel):
    craft_code = CharField()
    job_id = IntegerField()
    temperature = CharField(null=True)
    timesheet_date = DateField()
    timesheet_id = PrimaryKeyField()
    weather = CharField(null=True)

    class Meta:
        db_table = 'timesheet'
        indexes = (
            (('job_id', 'timesheet_date', 'craft_code'), True),
        )

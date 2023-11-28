from django.db import models
from django.contrib.auth.models import User



class User_Role(models.Model):
    User = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Role = models.CharField(max_length=200)

class Patient_Details(models.Model):
    Patient = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Patient_Gender = models.CharField(max_length=200)
    Patient_Age = models.FloatField()
    Patient_Address = models.CharField(max_length=500)
    Patient_Weight = models.FloatField(default='0.00')
    Patient_Contact = models.BigIntegerField(default='0')
    
    
class HomePage_Fields(models.Model):
    HomePage_fields = models.CharField(max_length=200,default='NA')
    role = models.CharField(max_length=100)
    status = models.IntegerField(default=0)
    state = models.CharField(max_length=500,default="ReceptionDashboard.Receptionist")
    icon = models.CharField(max_length=500,default="fa fa-user")


class Patients_Prescriptions(models.Model):
    Patient = models.ForeignKey(User, on_delete=models.SET_NULL, null=True,related_name='patient')
    Doctor = models.ForeignKey(User, on_delete=models.SET_NULL, null=True,related_name='doctor')
    Date_of_Prescription =  models.DateTimeField(auto_now=True, null=True)
    Diagnosis = models.CharField(max_length=500,default='NA')
    Medications = models.CharField(max_length=500,default='NA')
    Dosage = models.CharField(max_length=500,default='NA')
    Instructions = models.CharField(max_length=500,default='NA')


class DoctorDepartment(models.Model):
    Department = models.CharField(max_length=500)
    status = models.BooleanField(default=True)


class Doctor_Details(models.Model):
    Doctor = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Qualification = models.CharField(max_length=500)
    Department = models.ForeignKey(DoctorDepartment, on_delete=models.SET_NULL, null=True)
    Morning_Time = models.CharField(max_length=500,default='NA')
    Evening_Time = models.CharField(max_length=500,default='NA')
    Phone_No = models.BigIntegerField()
    Doctor_Fees = models.IntegerField()
    

class Patient_Appointments(models.Model):
    Patient = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Appointment_date = models.CharField(max_length=500)
    Appointment_slot = models.CharField(max_length=500)
    Approval_status = models.BooleanField(null=True)
    Doctor = models.ForeignKey(Doctor_Details, on_delete=models.SET_NULL, null=True)
    Visit_dateTime = models.DateTimeField(null=True)
    Patient_Medical_history = models.CharField(max_length=500)
    Appointment_rejection_reason = models.CharField(max_length=500,default='NA')
    Patient_Details = models.ForeignKey(Patient_Details, on_delete=models.SET_NULL, null=True)


class Patient_Payment_History(models.Model):
    Patient = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Payment_date = models.DateTimeField(auto_now=True, null=True)
    Amount = models.IntegerField()
    Balance = models.IntegerField(default=0)
    Doctor = models.ForeignKey(Doctor_Details, on_delete=models.SET_NULL, null=True)
    
  

class Doctor_Appointments(models.Model):
    Doctor = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    add_dateTime = models.DateTimeField(auto_now=True, null=True)
    update_dateTime = models.DateTimeField(auto_now=True, null=True)
    approval_status = models.BooleanField
   


class Receptionist(models.Model):
    Patient = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    NewAppointment_dateTime = models.DateTimeField(auto_now=True, null=True)
    Doctor_Approval = models.BooleanField(default=None,null=True)
    Receptionist_Approval = models.BooleanField(default=None,null=True)
    Patient_Details = models.ForeignKey(Patient_Details, on_delete=models.SET_NULL, null=True)
    Patient_Appointments = models.ForeignKey(Patient_Appointments, on_delete=models.SET_NULL, null=True)
    Doctor = models.ForeignKey(Doctor_Details,on_delete=models.SET_NULL, null=True)

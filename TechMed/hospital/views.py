from django.contrib.auth import login, authenticate,logout
from django.http import JsonResponse,HttpResponse
import json
from django.contrib.auth.models import User
from .models import Patient_Appointments,Patient_Details,Patient_Payment_History,Patients_Prescriptions,Doctor_Details,Receptionist,DoctorDepartment,HomePage_Fields,User_Role
from datetime import datetime
from django.shortcuts import render
from django.utils.dateparse import parse_datetime
from django.core.mail import send_mail, EmailMessage
from django.template.loader import render_to_string
from django.shortcuts import render
import re





###################################-----Tested--Patient_Registeration-------###############################################
    

def PatientRegisteration(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data.get('username')
        password = data.get('password')
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        email = data.get('email')
        age = data.get('age')
        address = data.get('address')
        weight = data.get('weight')
        gender = data.get('gender')
        contact = data.get('contact')

        if not (username and password and first_name and last_name and email and age and address and weight and gender and contact):
            return JsonResponse({'error': 'Invalid registration details.'}, status=400)
        
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
            return JsonResponse({'error': 'Username or email already exists.'}, status=400)
        
        if not re.match(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$', email):
            return JsonResponse({'error': 'Incorrect email format.'}, status=400)
        
        if not re.match(r'^\d{10}$', contact):
            return JsonResponse({'message': 'Phone number must be 10 digits. Please enter again!!'}, status=400)

        if not re.match(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{6,20}$',password):
            return JsonResponse(
                {
                    'message': 'Invalid password. Password must contain at least one uppercase letter, one lowercase letter, '
                               'one special character, and be at least 8 characters long.'
                },status=400)
        
        else:
            user = User.objects.create_user(
                username=username,
                password=password,
                first_name=first_name,
                last_name=last_name,
                email=email
    
            )
            

            patientid_dict = User.objects.filter(email=email).values('id').first()
            if patientid_dict:
                patientid = patientid_dict['id']
            else:
                return JsonResponse({'error': 'User with this email does not exist.'}, status=400)

            role = User_Role.objects.create(
            User_id=patientid,
            Role="patient"
            )

            details = Patient_Details.objects.create(
                Patient_id=patientid,
                Patient_Age=age,
                Patient_Address=address,
                Patient_Weight=weight ,
                Patient_Gender=gender,
                Patient_Contact=contact

            )
        return JsonResponse({'message': 'Patient Registration successful !!'}, status=200)
    return JsonResponse({"error": "Invalid request method."}, status=405)




######################################--Tested-Doctor-Departments----#####################################################



def Doctor_Department(request):
    if request.method == 'GET':
        departments = list(DoctorDepartment.objects.filter(status=1).values('Department', 'id'))

        return JsonResponse(departments,safe=False)
    else:
        return JsonResponse({"message":"invalid request method"},status=405)
    


####################################--Tested-Doctor-Details-######################################################


def Doctor_details(request):
    if request.method == 'GET':
         depart = request.GET.get('department') 
         ddetails = list(Doctor_Details.objects.filter(Department=depart).values('Doctor__first_name','Doctor__last_name','Doctor','Department__Department'))
         return JsonResponse(ddetails,safe=False)
    else:
        return JsonResponse({'message':'invalid method'},status=405)


#####################################----Tested-Doctor_Registration------############################################



def DoctorRegistration(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data.get('username')
        password = data.get('password')
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        email = data.get('email')
        phone_no = data.get('phone_no')
        dept = data.get('department_id')
        qual = data.get('qualification')
        morning_time = data.get('morning_time')
        evening_time = data.get('evening_time')
        fees = data.get('doctor_fees')

        if not (username and password and first_name and last_name and email and phone_no and dept and qual and morning_time and evening_time and fees):
            return JsonResponse({'error': 'Invalid registration details.'}, status=400)
        
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
            return JsonResponse({'error': 'Username or email already exists.'}, status=400)
        
        if not re.match(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$', email):
            return JsonResponse({'error': 'Incorrect email format.'}, status=400)
        
        if not re.match(r'^\d{10}$', phone_no):
            return JsonResponse({'message': 'Phone number must be 10 digits. Please enter again!!'}, status=400)

        if not re.match(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{6,20}$',password):
            return JsonResponse(
                {
                    'message': 'Invalid password. Password must contain at least one uppercase letter, one lowercase letter, '
                               'one special character, and be at least 8 characters long.'
                },status=400)

        user = User.objects.create_user(
            username=username,
            password=password,
            first_name=first_name,
            last_name=last_name,
            email=email,
        )

        doctorid = User.objects.filter(email=email).values('id').first()
        doctoridd = doctorid['id']
        department_instance = DoctorDepartment.objects.filter(id=dept).first()

         
        role = User_Role.objects.create(
            User_id=doctoridd,
            Role="doctor"
            )
        doctordetails = Doctor_Details.objects.create(
            Doctor_id=doctoridd,
            Qualification=qual,
            Department=department_instance,
            Morning_Time=morning_time,
            Evening_Time=evening_time,
            Phone_No=phone_no,
            Doctor_Fees=fees
        )
        return JsonResponse({'message': 'Doctor Registration successful !!'}, status=200)
    
    else:
        return JsonResponse({'error': 'Invalid request method.'}, status=405)




#######################################-----Tested-LOGIN-------################################################



def login_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        email = data.get('email')
        password = data.get('password')
        user = User.objects.filter(email=email).first()

        if user is not None and user.check_password(password):
            auth_user = authenticate(request, username=user.username, password=password)
            role = User_Role.objects.filter(User_id=user).values('Role')

            if auth_user is not None:
                login(request, auth_user)

                if role.exists():
                    user_role = role[0]['Role']
                    if user_role == "doctor":
                        return JsonResponse({"message": "Doctor"})
                    elif user_role == "receptionist":
                        return JsonResponse({"message": "Receptionist"})
                    elif user_role == "patient":
                        return JsonResponse({"message": "Patient"})
                    else:
                        return JsonResponse({'message': 'Invalid user role'})
                    
                else:
                    return JsonResponse({'message': 'User has no role.'})
            else:
                return JsonResponse({'message': 'No user exists.'})
        else:
            return JsonResponse({'message': 'Incorrect credentials'}, status=403)
    else:
        return JsonResponse({'message': 'Invalid method'})


##################################-----Tested-LOGOUT------#################################################


def logout_view(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            request.session.flush()
            logout(request)
            response = JsonResponse({'message': 'Logout successful.'})
            return response
        else:
            return JsonResponse({'message': 'User is not authenticated.'})
    else:
        return JsonResponse({'message': 'Request not valid'})




######################################----Tested-Home page-----###########################################





def home_page(request):
    if request.method == 'GET':
        if request.user.is_authenticated:

            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "doctor":
                    doctor=list(HomePage_Fields.objects.filter(role="doctor",status="1").order_by('HomePage_fields').values('HomePage_fields','state'))
                    return JsonResponse(doctor,safe=False)
                

                elif user_role == "receptionist":
                    reception=list(HomePage_Fields.objects.filter(role="receptionist",status="1").values('HomePage_fields','state'))
                    return JsonResponse(reception,safe=False)
                
                elif user_role == "patient":
                    patient=list(HomePage_Fields.objects.filter(role="patient",status="1").values('HomePage_fields','state'))
                    return JsonResponse(patient,safe=False)
                    
            else:
                    return JsonResponse({'message': 'No user exists.'})
        else:
            return JsonResponse({"message":"user is not authenticated"})
    else:
        JsonResponse("Invalid Request")






##############################----Tested-Patient-Dashboard---########################################

def patient_profile(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "patient":
                    user_id = request.user

                    profile = list(Patient_Details.objects.filter(Patient_id=user_id).values('Patient__first_name','Patient__last_name','Patient__email','Patient__username','Patient_Gender','Patient_Age','Patient_Weight','Patient_Contact','Patient_Address'))
                    
                    return JsonResponse({'Profile':profile}, status=200)
                else:
                    return JsonResponse({"message":"please login patient"})
            else:
                    return JsonResponse({"message":"user doesn't exist"})

        else:

            JsonResponse("Patient not loggedin")
    else:
        JsonResponse("Invalid Request")




def payment_history(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "patient":
                    user_id = request.user.id
                    if Patient_Appointments.objects.filter(Patient=user_id).first():

                    
                        payement_history = list(Patient_Payment_History.objects.filter(Patient_id=user_id).values())
                    
                        return JsonResponse(payement_history,safe=False)
                    else:
                        return JsonResponse()
                else:
                    return JsonResponse({"message":"Please login patient"})

            else:
                return JsonResponse({"message":"User not exists"})    

        else:
            JsonResponse("Patient not loggedin")




  
    if request.method == 'POST':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']

                if user_role == "patient":
                    user_id = request.user.id
                    data = json.loads(request.body)
                    payementid = data.get('payement_id')
                    history = Patient_Payment_History.objects.filter(id=payementid).first()

                    if history:
                        amount = history.Amount
                        date = history.Payment_date
                        userr = User.objects.get(id=user_id)

    
                        if history.Doctor:
                            d_dept = history.Doctor.Department.Department
                            doctor = history.Doctor.Doctor.first_name + history.Doctor.Doctor.last_name
                       

                        context = {
                            'amount': amount,
                            'date': date,
                            'patient_name': userr.first_name + ' ' + userr.last_name,
                         
                            'id': payementid
                        }
                        pc = render_to_string('hospital/payment.html', context)
                        pdf = HttpResponse(content_type='template/pdf')
                        pdf['content-disposition'] = 'filename="report.pdf"'
                        pdf.write(pc)
                        return pdf
                    else:
                            return JsonResponse({"message": "Payment history not found"})

                else:
                    return JsonResponse({"message": "Please log in with patient credentials"})
        else:
            return JsonResponse({"message": "User is not authenticated"})

    return JsonResponse({"message": "Invalid Request"})






def patient_previous_appointments(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "patient":
                    user_id = request.user.id
                
            
                    appointment = list(Patient_Appointments.objects.filter(Patient=user_id).values('Appointment_date','Appointment_slot','Approval_status','Doctor','Visit_dateTime'))
                    return JsonResponse(appointment,safe=False)
                
                else:
                 return JsonResponse({"message":"Please login patient"})
            else:
                return JsonResponse({"message":"User doesn't exists"})
        else:
            JsonResponse("Patient not loggedin")
    else:
        JsonResponse("Invalid Request")




def patient(request):
    if request.method == 'POST':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "patient":
                    user_id = request.user.id
                    data = json.loads(request.body)
                    doctor_id = data.get('doctor_id')
                    paymentStatus = data.get('paymentStatus')
                    medical_history = data.get('medical_history')
                    appointment_date = data.get('appointment_date')
                    appointment_slott = data.get('appointment_slot')
                    if doctor_id and paymentStatus and medical_history and appointment_date and appointment_slott:
                        userr=User.objects.get(id=user_id)
                        doctor_instance = Doctor_Details.objects.get(Doctor=doctor_id)
                        fields= Doctor_Details.objects.filter(Doctor=doctor_id).first()
                        amount=fields.Doctor_Fees
                        patient_instance =Patient_Details.objects.get(Patient=user_id)
                        if doctor_instance and patient_instance and amount:
                    
                            if (paymentStatus=="1"):
                                appointment=Patient_Appointments.objects.create(
                                    Patient_id=user_id,
                                    Doctor = doctor_instance,
                            
                                    Patient_Medical_history = medical_history,
                                    Appointment_date = appointment_date,
                                    Appointment_slot = appointment_slott,
                                    Patient_Details = patient_instance
                                    
                                    
                                )
                                patient_user=User.objects.get(id=user_id)
                                pay=Patient_Payment_History.objects.create(
                                    Patient=patient_user,
                                    Amount=amount,
                                    Doctor=doctor_instance
                                )
                                
                            
                                return JsonResponse({'message': 'payement done , appointment received yet to be approved'})
                            else:
                                return JsonResponse({'message':'id could no match'})
                        else:
                            return JsonResponse({'message':'payement not done'})
                    else:
                       return JsonResponse({'message': 'provide all fields with correct values'}, status=401)
                else:
                    return JsonResponse({"message":"please login patient"})
            else:
                    return JsonResponse({"message":"user doesn't exist"})
        else:
          return JsonResponse({'message':'patient not loggedin'})





    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "patient":
                    user_id = request.user.id
    
                    new_appointment = list(Patient_Appointments.objects.filter(Patient_id=user_id,Approval_status=False or None,Appointment_rejection_reason='NA').values('Approval_status','Appointment_date','Doctor__Doctor_id__first_name','Doctor__Doctor_id__last_name','Doctor__Department_id__Department'))
                
                    return JsonResponse(new_appointment,safe=False)
                
                else:
                    return JsonResponse({"message":"Please login Patient"})
                
            else:
                return JsonResponse({"message":"User doesn't exist"})
    
        else:
            JsonResponse("Patient not loggedin")
    else:
        JsonResponse("Invalid Request")






###############################-----Tested-Doctor-Dashboard------#################################################






def doctor_profile(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "doctor":
                    user_id = request.user.id
            
                    profile = list(Doctor_Details.objects.filter(Doctor_id=user_id).values('Qualification','Department__Department','Doctor_id__first_name','Doctor_id__last_name','Doctor_id__email','Doctor_id__username','Phone_No','Morning_Time','Evening_Time'))
                    return JsonResponse(profile,safe=False)
                else:
                    return JsonResponse({"message": "Please login doctor"}, status=403)
            else:
                return JsonResponse({"message": "Doctor not logged in"}, status=403)
        else:
                return JsonResponse({"message": "Doctor not logged in"}, status=403)
    else:
        return JsonResponse({'message':'Invalid Request method'}, status=405)





def doctor_patients(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']

                if user_role == "doctor":
                    user_id = request.user.id
                    doctorid = Doctor_Details.objects.get(Doctor=user_id)
            
                    patients = Patient_Appointments.objects.filter(Doctor=doctorid) \
                        .values('Patient__first_name', 'Patient__last_name', 'Appointment_date', 'Appointment_slot', 'Visit_dateTime') \
                        .order_by('Patient__first_name')
                    
                    patients_list = list(patients)
                    return JsonResponse(patients_list, safe=False)
                else:
                    return JsonResponse({"message": "Please login doctor"}, status=403)
            else:
                return JsonResponse({"message": "Doctor not logged in"}, status=403)
        else:
            return JsonResponse({"message": "Doctor not logged in"}, status=403)
    else:
        return JsonResponse({'message': 'Invalid Request method'}, status=405)

        



def approved(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']

                if user_role == "doctor":
                    user_id = request.user.id
                    doctorid=Doctor_Details.objects.get(Doctor=user_id)
            
                    patients = list(Patient_Appointments.objects.filter(Doctor=doctorid,Approval_status="1").values('Patient__first_name','Patient__last_name','Appointment_date','Appointment_slot','Visit_dateTime','Patient','Patient_Details__Patient_Age','Patient_Medical_history'))
                    return JsonResponse(patients,safe=False)
                else:
                    return JsonResponse({"message": "Please login doctor"}, status=403)
            else:
                return JsonResponse({"message": "Doctor not logged in"}, status=403)
        else:
                return JsonResponse({"message": "Doctor not logged in"}, status=403)
    else:
        return JsonResponse({'message':'Invalid Request method'}, status=405)
    

    



def doctor(request):
    if request.method == 'GET':
        if not request.user.is_authenticated:
            return JsonResponse({"message": "Please log in as a doctor"}, status=403)

        role = User_Role.objects.filter(User=request.user).values('Role')
        if not role.exists():
            return JsonResponse({"message": "User role not found"}, status=403)

        user_role = role[0]['Role']
        if user_role != "doctor":
            return JsonResponse({"message": "Please log in as a doctor"}, status=403)

        user_id = request.user.id
        doctorid=Doctor_Details.objects.get(Doctor=user_id)
        
        pids = list(Receptionist.objects.filter(Receptionist_Approval=True,Doctor_Approval=None,Doctor=doctorid)
                    .values('Patient','Patient_Appointments__Appointment_date', 'Patient_Appointments__Appointment_slot',
                            'Patient_Appointments__Approval_status', 'Patient_Appointments__Patient_Medical_history',
                            'Patient_Details__Patient_Age', 'Patient_Details__Patient_Weight',
                            'Patient__first_name', 'Patient__last_name'
                    ))
        return JsonResponse(pids, safe=False)
    






    if request.method == 'POST':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']

                if user_role == "doctor":
                    user_id = request.user.id
                    data = json.loads(request.body)
                    approvalstatus = data.get('approval_status')
                    updatedDate = data.get('updatedDate')
                    updatedSlot = data.get('updatedSlot')
                    patient_id = data.get('patient_id')

                    userr = User.objects.get(id=patient_id)
                    user_id = request.user.id
                    doctorr = User.objects.get(id=user_id)
                    patientemail = userr.email
                    reason = data.get('rejection_reason')

                    if approvalstatus == "1":
                        update = Patient_Appointments.objects.filter(Patient=patient_id).last()
                        if update:
                            update.Approval_status = True

                            reception = Receptionist.objects.filter(Patient=patient_id).last()
                            reception.Doctor_Approval = True
                            reception.save()

                            if updatedDate:
                                update.Appointment_date = updatedDate
                            if updatedSlot:
                                update.Appointment_slot = updatedSlot


                            update.save()

                            amount = Patient_Payment_History.objects.filter(Patient=patient_id).first()

                            context = {
                                'doctor': doctorr.first_name + ' ' + doctorr.last_name,
                                'appointment_date': update.Appointment_date,
                                'appointment_slot': update.Appointment_slot,
                                'amount': amount.Amount,
                                'date': amount.Payment_date,
                                'patient_name': userr.first_name + ' ' + userr.last_name,
                            }
                            email_content = render_to_string('hospital/email.html', context)

                            subject = 'Appointment Approved'
                            from_email = 'srijanomar5840@gmail.com'
                            recipient_list = [patientemail]

                            send_mail(subject, 'Appointment Approved', from_email, recipient_list,
                                    html_message=email_content)

                            return JsonResponse({'message': 'Appointment approved by doctor'})

                    else:
                        reject = Patient_Appointments.objects.filter(Patient=patient_id).first()
                        if reject:
                            reject.Approval_status = False
                            reject.Appointment_rejection_reason = reason
                            reject.save()
                        dreject = Receptionist.objects.filter(Patient=patient_id).first()
                        if dreject:
                            dreject.Doctor_Approval = False
                            dreject.save()
                        balance = Patient_Payment_History.objects.filter(Patient=patient_id).first()
                        balance.Balance=balance.Amount

                        context = {
                            'reason': reason
                        }
                        email_content = render_to_string('hospital/remail.html', context)

                        subject = 'Appointment Rejected'
                        from_email = 'srijanomar5840@gmail.com'
                        recipient_list = ['omarsrijan3094@gmail.com']
                        send_mail(subject, 'Appointment rejected', from_email, recipient_list,
                                html_message=email_content)

                        return JsonResponse({'message': 'Appointment rejected by Doctor'})

                else:
                    return JsonResponse({'message': 'Please login doctor'}, status=403)
            else:
                return JsonResponse({'message': 'User not exists'}, status=403)
        else:
            return JsonResponse({'message': 'Doctor not logged in'}, status=403)
    else:
        return JsonResponse({'message': 'Invalid Request method'}, status=405)



###################################----Tested-Receptionist-Dashboard-----#######################################




def receptionist_registered_users(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "receptionist":
                    patients = list(Patient_Details.objects.values('Patient__first_name','Patient__last_name','Patient_Gender','Patient_Age','Patient_Address','Patient_Weight','Patient_Contact','Patient__first_name','Patient__last_name'))
                    return JsonResponse(patients,safe=False)
                
                else:
                 return JsonResponse({'error': 'Please login receptionist'}, status=401)
            else:
                 return JsonResponse({'error': 'User not exists'}, status=401)
            
            
        else:
            return JsonResponse({'error': 'Receptionist not logged in'}, status=401)


    else:
        return JsonResponse({'message':'Invalid Request method'}, status=405)
    



def receptionist_patients(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            user_role_query = User_Role.objects.filter(User_id=request.user)

            if user_role_query.exists():
                user_role = user_role_query.first().Role

                if user_role == "receptionist":
                    appointments = Patient_Appointments.objects.all()
                    patients_data = []
                    patient_names = set()

                    for appointment in appointments:
                        patient = appointment.Patient
                        doctor = appointment.Doctor.Doctor
                        full_name = f"{patient.first_name} {patient.last_name}"

                        if full_name not in patient_names:
                            patient_data = {
                                'First_Name': patient.first_name,
                                'Last_Name': patient.last_name,
                                'Appointment_date': appointment.Appointment_date,
                                'Appointment_slot': appointment.Appointment_slot,
                                'Approval_status': appointment.Approval_status,
                                'Doctor': f"{doctor.first_name} {doctor.last_name}",
                                'Visit_dateTime': appointment.Visit_dateTime
                            }
                            patients_data.append(patient_data)
                            patient_names.add(full_name)

                    return JsonResponse(patients_data, safe=False)
                else:
                    return JsonResponse({'error': 'Please login as a receptionist'}, status=401)
            else:
                return JsonResponse({'error': 'User does not exist'}, status=401)
        else:
            return JsonResponse({'error': 'Receptionist is not logged in'}, status=401)
    else:
        return JsonResponse({'message': 'Invalid request method'}, status=405)


def receptionist_doctors(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            if role.exists():
                user_role = role[0]['Role']


                if user_role == "receptionist":


                    doctors = list(Doctor_Details.objects.values('Doctor_id__first_name', 'Doctor_id__last_name','Department__Department','Doctor_Fees','Morning_Time','Evening_Time'))
                    return JsonResponse(doctors,safe=False)
                else:
                    return JsonResponse({'error': 'Please login with receptionist credintials'}, status=401)
            else:
                return JsonResponse({'error': 'no user found'}, status=401)
        else:
            return JsonResponse({'error': 'Receptionist not logged in'}, status=401)
                



    if request.method == 'POST':
        if request.user.is_authenticated:
            data = json.loads(request.body)
            doctor_id = data.get('doctor_id')
            doctor = list(Patient_Appointments.objects.filter(Doc=doctor_id).values().distinct())
            #patient = list(User.objects.filter(id=doctor))
            return JsonResponse(doctor,safe=False)
        else:
            return JsonResponse({'error': 'Receptionist not logged in'}, status=401)
        
    else:
        return JsonResponse({'message':'Invalid Request method'}, status=405)




def receptionist(request):
    if request.method == 'POST' and request.user.is_authenticated:
       
        user_role = User_Role.objects.filter(User_id=request.user).values('Role').first()
        
        if user_role and user_role['Role'] == "receptionist":
            data = json.loads(request.body)
            r_approval = data.get('rApproval')
            patient_id = data.get('patient_id')
            rejection_reason = data.get('reason')

          #  appointment = Patient_Appointments.objects.filter(Patient=patient_id).order_by('-Appointment_date').last()
            appointment = Patient_Appointments.objects.filter(Patient=patient_id).last()

            if appointment:
                patient=User.objects.get(id=patient_id)
                patient_details = Patient_Details.objects.get(Patient=patient_id)
                doctor = appointment.Doctor

                if r_approval in ["0", "1"]:
                    
                    Patient_Appointments.objects.filter(Patient=patient_id, Approval_status=None).update(Approval_status=False)

                    receptionist_record = Receptionist.objects.create(
                        Patient=patient,
                        Receptionist_Approval=r_approval,
                        Patient_Details=patient_details,
                        Doctor=doctor,
                        Patient_Appointments=appointment
                    )
                    if r_approval == "1":
                    
                        return JsonResponse({"message": "New Appointment approved by receptionist, yet to be approved by doctor"})
                    elif r_approval == "0"  and rejection_reason:
                        Patient_Appointments.objects.filter(Patient=patient_id, Approval_status=None).update(Approval_status=False,Appointment_rejection_reason=rejection_reason)
    

                        return JsonResponse({"message": "New Appointment rejected by receptionist"})
                else:
                    return JsonResponse({"message": "Invalid rApproval value. It should be '0' or '1'"})
            else:
                return JsonResponse({"message": "No appointments found for this patient"})
        else:
            return JsonResponse({"message": "Login with receptionist credentials"})

  

    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            user_role = role[0]['Role']

            if user_role == "receptionist":
                    newappoint = list(Patient_Appointments.objects.filter(Approval_status=None,Appointment_rejection_reason="NA").values('Appointment_date','Appointment_slot','Patient','Patient__first_name', 'Patient__last_name'))
                   
                    return JsonResponse(newappoint, safe=False)
                
            else:
                    return JsonResponse({'message': 'Login with receptionist credentials'}, status=401)
        else:
                return JsonResponse({'message': 'Receptionist not logged in'}, status=401)
    else:
            return JsonResponse({'message': 'Invalid Request method'}, status=405)

    


##########################################--Tested-Prescription----###############################################################




def all_prescriptions(request):

    if request.method=='GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            user_role = role[0]['Role']


            if user_role == "patient":
                user_id = request.user.id

                
                Prescriptions=list(Patients_Prescriptions.objects.filter(Patient_id=user_id).values('Patient__first_name','Patient__last_name',
                            'Doctor__first_name','Doctor__last_name','Date_of_Prescription','Diagnosis','Medications','Dosage',
                            'Instructions'))
            
            
                return JsonResponse(Prescriptions,safe=False)

            return JsonResponse({"message":"login with doctor credintials"})
        return JsonResponse({'message':'Patient not loggedin'},status=401)


    return JsonResponse({'message':'Invalid Request method'}, status=405)







def prescription(request):
    if request.method == 'POST':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            user_role = role[0]['Role']

            if user_role == "doctor":
                data = json.loads(request.body)
                patient_id = data.get('patient_id')
                diagnosis = data.get('diagnosis')
                prescriptions = data.get('prescriptions')

                patient_instance = User.objects.filter(id=patient_id).first()
                if not patient_instance:
                    return JsonResponse({'message': 'Patient not found.'}, status=404)

                pa = Patient_Appointments.objects.filter(Patient=patient_instance).first()
                if not pa:
                    return JsonResponse({'message': 'Patient appointment not found.'}, status=404)

                pa.Visit_dateTime = datetime.now()
                pa.save()
                user_id = request.user.id
                visit = Receptionist.objects.filter(Patient_id=patient_instance).last()

                if visit.Doctor_Approval == 1:
                    for prescription_data in prescriptions:
                        medication = prescription_data.get('medicine')
                        dosage = prescription_data.get('dosage')
                        instructions = prescription_data.get('instruction')

                        if medication:
                            appointment = Patients_Prescriptions.objects.create(
                                Patient=patient_instance,
                                Doctor_id=user_id,
                                Date_of_Prescription=pa.Appointment_date,
                                Medications=medication,
                                Dosage=dosage,
                                Diagnosis=diagnosis,
                                Instructions=instructions
                            )

                    Patient_Appointments.objects.filter(Patient=patient_instance).update(Visit_dateTime=datetime.now())
                    return JsonResponse({'message': 'Prescription details uploaded.'})
                else:
                    return JsonResponse({"message": "Appointment is not approved."})
            else:
                return JsonResponse({'message': 'Login with doctor credentials'})
        else:
            return JsonResponse({'message': 'Doctor not logged in'})




    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            user_role = role[0]['Role']

            if user_role == "doctor":
                user_id = request.user.id

                Prescriptions = list(Patients_Prescriptions.objects.filter(Doctor_id=user_id, diagnosis__exact=True).values('Date_of_Prescription', 'Diagnosis'))
                Doctor = Doctor_Details.objects.filter(Doctor_id=user_id).values('Doctor__first_name', 'Doctor__last_name')
                medications = list(Patients_Prescriptions.objects.filter(Doctor_id=user_id).values('Medications', 'Dosage', 'Instructions'))

                return JsonResponse({"prescriptions":Prescriptions,"Doctor":Doctor,"medications":medications})
            else:
                return JsonResponse({"message": "Login with doctor credentials"})
        else:
            return JsonResponse({'message': 'User not logged in'}, status=401)

    return JsonResponse({'message': 'Invalid Request method'}, status=405)




def doctor_slot(request):
    if request.method == 'GET':
        if request.user.is_authenticated:
            role = User_Role.objects.filter(User_id=request.user).values('Role')
            user_role = role[0]['Role'] if role else None 
            doctor_id = request.GET.get('doctor_id')

            if user_role == "patient":
                user_id = request.user.id

                slot1 = list(Doctor_Details.objects.filter(Doctor_id=doctor_id).values('Morning_Time'))
                slot2 = list(Doctor_Details.objects.filter(Doctor_id=doctor_id).values('Evening_Time'))
                if slot1 and slot2:

                    return JsonResponse({'slot1':slot1,'slot2':slot2})
                else:
                    return JsonResponse({"message": "Doctor not found"}, status=404)

            return JsonResponse({"message": "Login with patient credentials"})

        return JsonResponse({'message': 'Patient not logged in'}, status=401)

    return JsonResponse({'message': 'Invalid Request method'}, status=405)



def graph(request):
    if request.method == 'GET':
        patients=Patient_Details.objects.count()
        doctors=Doctor_Details.objects.count()
        departments=DoctorDepartment.objects.count()
        appointments=Patient_Appointments.objects.count()
        return JsonResponse({"patients":patients,"doctors":doctors,"departments":departments,"appointments":appointments})
    else:
        return JsonResponse({"message":"invalid request method"})





    



########################################################################################################


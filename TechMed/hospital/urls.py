from django.urls import path
from hospital import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('PatientRegisteration/', views.PatientRegisteration, name='PatientRegisteration'),
    path('Doctor_Department/',views.Doctor_Department, name='Doctor_Department'),
    path('Doctor_details/',views.Doctor_details,name='Doctor_details'),
    path('DoctorRegistration/', views.DoctorRegistration, name='DoctorRegistration'),
    path('login_view/', views.login_view, name='login_view'),
    path('logout_view/', views.logout_view, name='logout_view'),

    path('patient/',views.patient,name='patient'),
    path('patient_profile/',views.patient_profile,name='patient_profile'),
    path('payment_history/',views.payment_history,name='payment_history'),
    path('patient_previous_appointments/',views.patient_previous_appointments,name='patient_previous_appointments'),

    path('doctor/',views.doctor,name='doctor'),
    path('approved/',views.approved,name='approved'),
    path('doctor_profile/',views.doctor_profile,name='doctor_profile'),
    path('doctor_patients/',views.doctor_patients,name='doctor_patients'),

    path('receptionist/',views.receptionist,name='receptionist'),
    path('receptionist_doctors/',views.receptionist_doctors,name='receptionist_doctors'),
    path('receptionist_patients/',views.receptionist_patients,name='receptionist_patients'),
    path('receptionist_registered_users/',views.receptionist_registered_users,name='receptionist_registered_users'),

    path('all_prescriptions/',views.all_prescriptions,name='all_prescriptions'),
    path('prescription/',views.prescription,name='prescription'),
    path('home_page/',views.home_page,name='home_page'),
    path('doctor_slot/',views.doctor_slot,name='doctor_slot'),
    path('graph/',views.graph,name='graph')
   

    

] 


#+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
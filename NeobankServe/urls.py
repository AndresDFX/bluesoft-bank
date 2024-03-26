"""
URL configuration for NeobankServe project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin  
from django.urls import path
from home.views import IndexView, RegisterView, LoginView, CreateCLient, Login, Logout, ProfileView, AddAccount, GetTransactions, WithdrawMoney

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', IndexView ),
    path('register', RegisterView),
    path('login', LoginView),
    path('profile', ProfileView, name='profile'),
    
    # Get and Update Transactions
    path('add_account', AddAccount, name='add_account'),
    path('get_transactions', GetTransactions, name='get_transactions'),
    path('create-client', CreateCLient, name='create_client'),
    path('login_user', Login, name='login_user'),
    path('logout', Logout, name='logout'),
    path('withdrawMoney', WithdrawMoney, name='withdrawMoney'),
]

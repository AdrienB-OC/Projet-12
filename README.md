# EpicEvents

# How to run the server locally :


Extract the repository's files in a folder of your choosing

### 1 - Setup the virtual environment :


In your command bash/shell go in the folder containing the files

Type :  
Windows :
```
py -m venv venv
```
Unix/mac :
```
python3 -m venv venv
```


You then need to activate the virtual environment :  
Windows :
```
.\venv\Scripts\activate
```
Unix/mac :  
```
source venv/bin/activate
```
(venv) should now be displayed to the left of your command line :
```
(venv) C:\>
```

### 2 - Install the libraries required to run the server :

In the virtual environment (command bash/shell), go in the project's main folder (with the main.py file) and type : 
```
pip(3) install -r requirements.txt
```

### 3 - Setup the PostgreSQL database (Example using pgAdmin 4) :

In pgAdmin 4 create a new database then right click on it and select "Restore...". Browse to the folder in which you extracted the repository and select the "EpicEvents.sql" file.
You then need to change the DATABASE settings in the settings.py file accordingly (NAME, USER and PASSWORD)

### 4 - Create a superuser to be able to access the django admin interface and the API endpoints

Windows
```
(venv) manage.py createsuperuser

```
Unix/mac
```
(venv) python3 manage.py createsuperuser
```

Role should be set to Admin

### 5 - Run the server and access the django admin interface/the API endpoints


Windows
```
(venv) manage.py runserver

```
Unix/mac
```
(venv) python3 manage.py runserver
```

You can access the interface using this link :
```
http://127.0.0.1:8000/admin/
```

The API endpoints are as follow:
##### Register : (POST)
```
http://127.0.0.1:8000/register/
```

##### Authenticate: (POST)
```
http://127.0.0.1:8000/token/
```

##### Clients: (POST, GET, PUT, PATCH)
```
http://127.0.0.1:8000/client/<optional pk>/
```

##### Contracts: (POST, GET, PUT, PATCH)
```
http://127.0.0.1:8000/contract/<optional pk>/
```

##### Contract Statuses: (POST, GET, PUT, PATCH)
```
http://127.0.0.1:8000/contract_status/<optional pk>/
```

##### Events: (POST, GET, PUT, PATCH)
```
http://127.0.0.1:8000/event/<optional pk>/
```
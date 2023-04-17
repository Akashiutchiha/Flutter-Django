# Django CRUD

Django CRUD is a notes taking app built with Django and Flutter. The app allows users to perform CRUD (Create, Read, Update, Delete) operations to a Django backend through a Flutter app.

## Features

- Create notes with a title and description
- View a list of all notes
- Edit and update notes
- Delete notes

## Technologies

- Django 4.2
- Django REST Framework (latest)
- Flutter 3

## Installation

### Backend

1. Clone the repository and navigate to the project directory:

   ````
   git clone https://github.com/Akashiutchiha/Flutter-Django.git
   cd Flutter-Django/Django
   ```

2. Create a virtual environment and activate it:

   ````
   python3 -m venv env
   source env/bin/activate
   ```

3. Install the required packages:

   ````
   pip3 install -r requirements.txt
   ```

4. Run the migrations to create the database:

   ````
   python3 manage.py migrate
   ```

5. Start the development server:

   ````
   python3 manage.py runserver
   ```

   The backend will be accessible at `http://localhost:8000`.

### Frontend

1. Navigate to the `frontend` directory:

   ````
   cd Flutter-Django/onlineshopapp
   ```

2. Install the required packages:

   ````
   flutter pub get
   ```

3. Start the app:

   ````
   flutter run
   ```

   The app will be launched in an emulator or on a connected device.

## Usage

1. Launch the app on your emulator.

2. Create a new note by tapping the "+" button.

3. Edit a note by tapping on it and making changes.

4. Delete a note by clicking on the delete icon along side the note.

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request.




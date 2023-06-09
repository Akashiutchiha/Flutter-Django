from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import NotesSerializer
from .models import Notes
# Create your views here.

@api_view(['GET'])
def getRoute(request):
    routes = [
    {
        'Endpoint': '/api/notes',
        'method': 'GET',
        'body': None,
        'description': 'Returns an array of notes'
    },
    {
        'Endpoint': '/api/notes/id',
        'method': 'GET',
        'body': None,
        'description': 'Returns a specific note'
    },
    {
        'Endpoint': '/api/notes/create',
        'method': 'POST',
        'body': {'title': 'string', 'content': 'string'},
        'description': 'Creates a new note'
    },
    {
        'Endpoint': '/api/notes/pupdate/',
        'method': 'PUT',
        'body': {'title': 'string', 'content': 'string'},
        'description': 'Updates an existing note'
    },
    {
        'Endpoint': '/api/notes/delete/',
        'method': 'DELETE',
        'body': None,
        'description': 'Deletes a note'
    },
   
    

]
    return Response(routes)

@api_view(['GET'])
def getNotes(request):
    notes = Notes.objects.all()
    serializer = NotesSerializer(notes, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getNote(request, pk):
    notes = Notes.objects.get(id=pk)
    serializer = NotesSerializer(notes, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def createNote(request):
    data = request.data
    note = Notes.objects.create(
        body=data['body'],
    )
    serializer = NotesSerializer(note, many=False)
    return Response(serializer.data)

@api_view(['PUT'])
def updateNote(request, pk):
    data = request.data
    note = Notes.objects.get(id=pk)
    serializer = NotesSerializer(note, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteNote(request, pk):
    note = Notes.objects.get(id=pk)
    note.delete()
    return Response('Note was deleted')
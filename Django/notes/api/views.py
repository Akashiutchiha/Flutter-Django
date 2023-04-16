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

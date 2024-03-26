from typing import Dict

from django.http import HttpRequest, HttpResponse
from django.shortcuts import render

def get_common_context(request: HttpRequest) -> Dict[str, str]:
    """
    Retrieves common context variables such as login status and client ID from the request.

    Args:
        request: The HTTP request object.

    Returns:
        A dictionary containing the login status and client ID.
    """
    logged_in = request.COOKIES.get('logged_in', 'False') == 'True'
    client_id = request.session.get('client_id')
    return {'logged_in': logged_in, 'client_id': client_id}

def save_client_login(request: HttpRequest, client, account=None) -> HttpResponse:
    """
    Saves client login information in the session and cookies, then renders the dashboard.

    Args:
        request: The HTTP request object.
        client: The client instance that has logged in.
        account: The account instance associated with the client, if any.

    Returns:
        An HttpResponse object with the rendered dashboard page.
    """
    response = render(request, 'dashboard.html', {'client': client, 'account': account})
    request.session['client_id'] = client.id
    request.session['client_name'] = client.name
    response.set_cookie('logged_in', 'True')
    return response

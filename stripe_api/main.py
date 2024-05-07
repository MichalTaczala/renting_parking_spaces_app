import functions_framework


@functions_framework.http
def payment(request):
    return "Hello, world!"

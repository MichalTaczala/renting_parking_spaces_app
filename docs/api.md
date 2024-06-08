# API

### Users
- [Create a new user](#creating-a-new-user)
- [Getting all users](#getting-all-users)
- [Getting user id by firebase token](#getting-user-id-by-firebase-token)

### Parking spots
- [Create a new parking spot](#creating-a-new-parking-spot)


## Creating a new user
```shell
POST /users/create
```
Creates a new user with the specified details. If a user with the provided `firebase_token` already exists in the database, the existing user is returned.

### Parameters
- `firebase_token` (required): Unique token for the user from Firebase.
- `username` (required): Username of the user.
- `first_name` (required): First name of the user.
- `last_name` (required): Last name of the user.
- `email` (required): Email address of the user.
- `type` (optional): Type of the user (e.g., admin, regular).
- `phone_prefix` (optional): Phone prefix for the user's phone number.
- `phone` (required): Phone number of the user.

### Examples
Create a new user
**Request**
```shell
curl -X POST http://localhost:11434/api/users/create -H "Content-Type: application/json" -d '{
    "firebase_token": "abc123def456",
    "username": "johndoe",
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "type": "regular",
    "phone_prefix": "+1",
    "phone": "1234567890"
}'
```
**Response**
If the user is successfully created:
```shell
{
    "message": "Successfully created new user!"
}
```
If the user already exists (based on `firebase_token`):
```shell
{
    "message": "User already exists!"
}
```
If there are missing required fields:
```shell
{
    "message": "Missing required fields"
}
```
If there is an error:
```shell
{
    "message": "<error message>"
}
```

## Getting all users
```shell
GET /users/all
```
Gets data about all users (without firebase_tokens)
### Parameters
None
### Examples
List all users
**Request**
```shell
curl -X GET http://localhost:11434/api/users/all -H "Authorization: Your-Token-Here"
```
**Response**
If successfully retrieved:
```shell
[
    {
        "user_id": 1,
        "username": "user1",
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@example.com"
    },
    {
        "user_id": 2,
        "username": "user2",
        "first_name": "Jane",
        "last_name": "Doe",
        "email": "jane.doe@example.com"
    }
]
```
If there are no users:
```shell
[]
```
If there is a problem with the request:
```shell
{
    "message": "Error message"
}
```


## Getting user id by firebase token
```shell
GET /users/id
```
Retrieves the user ID associated with the provided Firebase token.

### Parameters
- `firebase_token` (required): Firebase token associated with the user.
### Examples
Retrieve user ID based on Firebase token
**Request**
```shell
curl -X GET http://localhost:11434/api/users/id -H "Content-Type: application/json" -d '{
    "firebase_token": "your_firebase_token_here"
}'
```
**Response**
If the user is found:
```shell
{
    "user_id": 123
}
```
If the user is not found:
```shell
{
    "message": "User not found"
}
```
If the user is missing JSON
```shell
{
    "message": "Missing JSON in request"
}
```
If there is a problem with the request:
```shell
{
    "message": "Error message"
}
```

## Creating a new parking spot
```shell
POST /api/parking_spots/create
```

Creates a new parking spott with the specified details, inc. nested address and other attributes. If address is not yet in the database, a new address is added and the address_id is attached to the parking spot model.

### Parameters
- `name` (required): Name of the parking spot.
- `description`: Description of the parking spot.
- `height`(optional): Height of the parking spot.
- `width` (optional): Width of the parking spot.
- `length` (optional): Length of the parking spot.
- `internal` (optional): Boolean indicating if the parking spot is internal. Default is `False`.
- `easy_access` (optional): Boolean indicating if the parking spot has easy access. Default is `False`.
- `security` (optional): Boolean indicating if the parking spot has security features. Default is `False`.
- `charging` (optional): Boolean indicating if the parking spot has charging capabilities. Default is `False`.
- `owner_id` (required): ID of the owner of the parking spot.
- `price` (required): Price of the parking spot.
- `currency` (optional): Currency of the price. Default is USD.
- `images_url` (optional): URL to images of the parking spot.
- `address` (required): Nested JSON object containing address details:
- `long` (required): Longitude of the address.
- `lat` (required): Latitude of the address.
- `street` (required): Street name of the address.
- `house_no` (required): House number of the address.
- `postal_code` (required): Postal code of the address.
- `city` (required): City of the address.
- `region` (optional): Region of the address.
- `district` (optional): District of the address.
- `country` (required): Country of the address.
### Examples
Create a new parking spot
**Request**
```shell
curl -X POST http://localhost:11434/api/parking_spots/create -H "Content-Type: application/json" -d '{
    "name": "Downtown Parking Spot",
    "description": "A secure parking spot in the heart of the city.",
    "height": 2.5,
    "width": 2.0,
    "length": 5.0,
    "internal": true,
    "easy_access": true,
    "security": true,
    "charging": true,
    "owner_id": 123,
    "price": 150.00,
    "currency": "USD",
    "images_url": "http://example.com/images/parkingspot.jpg",
    "address": {
        "long": -123.456,
        "lat": 49.2827,
        "street": "Main St",
        "house_no": "123",
        "postal_code": "V6B 3K9",
        "city": "Vancouver",
        "region": "BC",
        "district": "Downtown",
        "country": "Canada"
    }
}'
```
**Response**
```shell
{
    "message": "Successfully created new parking spot!"
    "parking_spot": 17
}
```

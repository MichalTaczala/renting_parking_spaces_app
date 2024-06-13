# API

### Users
- [Create a new user](#creating-a-new-user)
- [Getting all users](#getting-all-users)
- [Getting a single user profile](#gett)
- [Getting user id by firebase token](#getting-user-id-by-firebase-token)
- [Updating user profile](#updating-user-profile)

### Parking spots
- [Create a new parking spot](#creating-a-new-parking-spot)
- [Update data of a parking spot](#updating-parking-spot-data)
- [Uploading images for a specific parking spot](#uploading-images-for-a-specific-parking-spot)
- [Getting multiple parking spots data (with filters)](#getting-multiple-parking-spots-with-optional-filters)
- [Getting single parking spot data](#getting-single-parking-spot-data)
- [Deleting a parking spot](#deleting-a-parking-spot)
- [Getting parking spots by owner id](#getting-parking-spots-by-owner-id-user-id)

## Creating a new user
```shell
POST /users/create
```
Creates a new user with the specified details. If a user with the provided `firebase_token` already exists in the database, the existing user is returned.

### Parameters
None

### Request Body
The request body should be a JSON object containing the following fields:
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


## Getting a single user by id

```shell
GET /users/<int:user_id>
```
Retrieves the profile information for the user with the specified user ID.

### Parameters
- `user_id` (required): ID of the user whose profile information is to be retrieved.

### Examples
Retrieves user profile information

**Request**
```shell
curl -X GET http://localhost:11434/api/users/123
```

**Response**

If the user is found:
```shell
{
    "user_id": 123,
    "username": "john_doe",
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "phone_prefix": "48",
    "phone": "1234567890",
}
```
If the user is not found:
```shell
{
    "message": "User not found"
}
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
None
### Request Body
The request body should be a JSON object containing the following fields:
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


## Updating user profile
```shell
PUT /api/users/<int:user_id>
```
### Parameters
- `user_id` (required): ID of the user whose profile information is to be updated.

### Request Body
The request body should be a JSON object containing the fields to be updated. The following fields can be updated:
- `username` (optional): Username of the user.
- `email` (optional): Email address of the user.
- `type` (optional): Type of the user (e.g., admin, regular).
- `first_name` (optional): First name of the user.
- `last_name` (optional): Last name of the user.
- `phone_prefix` (optional): Phone prefix for the user's phone number.
- `phone` (optional): Phone number of the user.

### Examples
Update user profile information, namely email and phone.

**Request**
```shell
curl -X PUT http://localhost:11434/api/users/123 -H "Content-Type: application/json" -d '{
    "email": "john.doe.new@example.com",
    "phone_prefix": "+48",
    "phone": "444 555 666"
}'
```

**Response**
If the user profile is successfully updated:
```shell
{
    "message": "User profile updated successfully"
}
```
If the user is not found:
```shell
{
    "message": "User not found"
}
```
If there is missing JSON in the request:
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
None

### Request Body
The request body should be a JSON object containing following fields:
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

## Updating parking spot data
```shell
PUT /api/parking_spots/<int:spot_id>
```
Updates the parkign spot data.

### Parameters
None

### Request Body
The request body should be a JSON object containing at least one of the following fields:
- `name` (optional): Name of the parking spot.
- `description` (optional): Description of the parking spot.
- `height`(optional): Height of the parking spot.
- `width` (optional): Width of the parking spot.
- `length` (optional): Length of the parking spot.
- `internal` (optional): Boolean indicating if the parking spot is internal. Default is `False`.
- `easy_access` (optional): Boolean indicating if the parking spot has easy access. Default is `False`.
- `security` (optional): Boolean indicating if the parking spot has security features. Default is `False`.
- `charging` (optional): Boolean indicating if the parking spot has charging capabilities. Default is `False`.
- `owner_id` (required): ID of the owner of the parking spot.
- `price` (optional): Price of the parking spot.
- `currency` (optional): Currency of the price. Default is USD.
- `images_url` (optional): URL to images of the parking spot.
- `address` (optional): Nested JSON object containing address details:
    - `long` (optional): Longitude of the address.
    - `lat` (optional): Latitude of the address.
    - `street` (optional): Street name of the address.
    - `house_no` (optional): House number of the address.
    - `postal_code` (optional): Postal code of the address.
    - `city` (optional): City of the address.
    - `region` (optional): Region of the address.
    - `district` (optional): District of the address.
    - `country` (optional): Country of the address.

### Examples
Update description and price about a particular parking spot identified by `spot_id=123`.

**Request**
```shell
curl -X PUT http://localhost:11434/api/parking_spots/123 -H "Content-Type: application/json" -d '{
    "description": "A new, renovated secure parking spot in the heart of the city.",
    "price": 150.00,
}'
```
**Response**

If the update is successful:
```shell
{
    "message": "Parking spot information updated successfully"
}
```
If the parking spot is not found:
```shell
{
    "message": "Parking spot not found"
}
```
If an error occurs:
```shell
{
    "message": "Error message"
}
```

## Uploading images for a specific parking spot
```shell
POST /api/parking_spots/<int:spot_id>/upload_images
```
Uploads images for a specific parking spot identified by its spot_id. This endpoint allows multiple image uploads, 
but the number of images per parking spot is limited by `MAX_IMAGES_PER_PARKING_SPOT=5`.
The images are uploaded to bucket and are saved by the path `<spot_id>/<filename>`

### Parameters
- `spot_id` (required): The ID of the parking spot.

### Request body
The request body should contain multiple image files sent as multipart/form-data.
The key to the files MUST be named in order `image0`, `image1`, `image2`, `image3`, `image4`.
If less than `MAX_IMAGES_PER_PARKING_SPOT` is supposed to be uploaded, use less file keys but keep the ordering
from 0.

### Examples
Upload `2` new images for the parking spot with `spot_id = 123`.

**Request**
```shell
curl -X POST http://localhost:11434/api/parking_spots/123/upload_images -F "image0=@/path/to/image1.jpg" -F "image1=@/path/to/image2.jpg"
```

**Response**

If the images are uploaded successfully:
```shell
{
    "message": "Images uploaded successfully for parking spot 123"
}
```
If the parking spot is not found:
```shell
{
    "message": "Parking spot not found"
}
```
If there is an error with the image upload process:
```shell
{
    "error": "Error message"
}
```
If no images are provided:
```shell
{
    "error": "Image file is required"
}
```


## Getting multiple parking spots (with optional filters)
```shell
GET /api/parking_spots/all
```
Retrieves a list of all available parking spots (that is present in Rental Offers), optionally filtered by date range and sorted by distance to a user's location if coordinates are provided.
The maximum number of parking spots displayed is hardcoded in the variable `MAX_SPOTS_PER_PAGE`.

### Parameters
- `startDate` (optional): The start date for the availability filter in YYYY-MM-DD format.
- `endDate` (optional): The end date for the availability filter in YYYY-MM-DD format.
- `lat` (optional): Latitude of the user's location for distance sorting.
- `long` (optional): Longitude of the user's location for distance sorting.

**Note**: the distance sorting works only if both `lat` and `long` are provided.

### Examples
Retrieve all parking spots available from `2024-06-01` to `2024-06-07` and sorted by distance to the user's location (latitude `49.2827`, longitude `-123.1207`)

**Request**
```shell
curl -X GET "http://localhost:11434/api/parking_spots/all?startDate=2024-06-01&endDate=2024-06-07&lat=49.2827&long=-123.1207"
```

**Response**
If successful, a list of parking spot data:
```shell
[
    {
        "spot_id": 1,
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
        "address_id": 45,
        "price": 150.00,
        "currency": "USD",
        "images_url": [
            "http://example.com/images/parking_spot_1_1.jpg",
            "http://example.com/images/parking_spot_1_2.jpg"
        ],
        "distance": 0.5
    },
    ...
]
```
If there is an error:
```shell
{
    "message": "Error message describing the issue"
}
```


## Getting single parking spot data
```shell
GET /api/parking_spots/<int:spot_id>
```
Retrieves detailed information for a specific parking spot identified by its spot_id. 
If latitude and longitude are provided in the query parameters, the response includes the distance from the user's location to the parking spot.

### Parameters
- `spot_id` (required): The ID of the parking spot.

### Request body
The request may take optional additional arguments:
- `lat` (optional): the latitude position of the user's current location
- `long` (optional): the longitude position of the user's current location
Only if both arguments are provided, the distance can be computed.

### Examples
Get the data about the parking spot (`spot_id=123`) for a user whose current location is `lat=-49.2827`, `long=-123.1207`.

**Request**
```shell
curl -X GET http://localhost:11434/api/parking_spots/123?lat=49.2827&long=-123.1207
```

**Response**
The response contains detailed information about the parking spot, including its address, distance from the user's location (if provided), and URLs of associated images.

If the request is successful:
```shell
{
    "spot_id": 123,
    "name": "Downtown Parking Spot",
    "description": "A secure parking spot in the heart of the city.",
    "height": 2.5,
    "width": 2.0,
    "length": 5.0,
    "internal": true,
    "easy_access": true,
    "security": true,
    "charging": true,
    "owner_id": 456,
    "address_id": 789,
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
    },
    "distance": 2.3,
    "image_urls": [
        "http://example.com/images/parkingspot1.jpg",
        "http://example.com/images/parkingspot2.jpg"
    ]
}
```
**Note**: the `distance` metric is computed with every new GET request
**Note**: the `image_urls` contains the public URLs to images associated with the particular parking spot

If the parking spot is not found:
```shell
{
    "message": "Parking spot not found"
}
```
If there is an error with the image upload process:
```shell
{
    "error": "Error message"
}
```
If no images are provided:
```shell
{
    "error": "Image file is required"
}
```


## Deleting a parking spot
```shell
DELETE /api/parking_spots/<int:spot_id>
```
Deletes a specific parking spot identified by its spot_id.

### Parameters
- `spot_id` (required): The ID of the parking spot to delete.

### Examples
Remove parking spot with `spot_id=123`.

**Request**
```shell
curl -X DELETE http://localhost:11434/api/parking_spots/123
```

**Response**
If successful:
```shell
{
    "message": "Parking spot deleted successfully"
}
```
If the parking spot is not found:
```shell
{
    "message": "Parking spot not found"
}
```
If an error occurs:
```shell
{
    "message": "Error message"
}
```

## Getting parking spots by owner id (user id)
```shell
GET /users/{user_id}/parking_spots
```
Retrieves a list of parking spots owned by a specific user.

### Parameters
- `user_id` (required): The ID of the user whose parking spots are to be retrieved

### Examples
Retrieve parking spots belonging to user with `user_id=123`

**Request**
```shell
curl -X GET "http://localhost:11434/api/users/123/parking_spots"
```

**Response**
If the user has parking spots:
```shell
[
    {
        "spot_id": 1,
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
        "images_url": [
            "http://example.com/images/parking_spot_1_1.jpg",
            "http://example.com/images/parking_spot_1_2.jpg"
        ],
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
    },
    ...
]
```
If the user is not found:
```shell
{
    "message": "User not found"
}
```
If there is an error:
```shell
{
    "message": "Error message describing the issue"
}
```

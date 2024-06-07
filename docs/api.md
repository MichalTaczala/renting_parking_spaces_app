# API

### Users
- [Create a new user](#creating-a-new-user)

### Parking spots
- [Create a new parking spot](#creating-a-new-parking-spot)


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



#### Create new user
##### Request

```shell
curl http://localhost:11434/api/your_endpoint -d '{
    "param1": "sth",
    "param2": "sth else"
}'
```
##### Response
```json
{
    "response": "Success",
    "created_at": "2023-08-04T08:52:19.385406455-07:00",
}
```

## Creating a new user
**Type:** Private

```shell
METHOD /api/your_endpoint 
```

Short description here.

### Parameters
- `param1`: (required) sth
- `param2`: sth
- `param3`: (optional) sth


### Examples
#### Create new user
##### Request

```shell
curl http://localhost:11434/api/your_endpoint -d '{
    "param1": "sth",
    "param2": "sth else"
}'
```
##### Response
```json
{
    "response": "Success",
    "created_at": "2023-08-04T08:52:19.385406455-07:00",
}
```
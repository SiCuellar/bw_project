# BW Project - Device Readings 📱

A Sinatra 🎩 application designed to store and retrieve device readings.

## Overview

This application provides API endpoints to:

1. Store readings for specific devices.
2. Fetch readings for a particular device.

## Requirements

- Ruby (version 3.0.6) 
- Sinatra

## Setup & Installation

1. **Clone the repository**:
```
git clone git@github.com:SiCuellar/bw_project.git
cd bw_project
```

2. **Install dependencies**:
```
bundle install
```

3. **Run the application**:
```
rackup -p 9292
```


## Endpoint Curl requests (examples)
### Fetch Device Readings

### Fetch Device Readings
note: Data is stored in memory so example below will not return anything unless Post has been made. 

- Endpoint: GET /readings/:id
```
curl http://localhost:9292/readings/36d5658a-6908-479e-887e-a949ec199272
```

- Endpoint: POST /readings/
```
curl -X POST http://localhost:9292/readings \
     -H "Content-Type: application/json" \
     -d '{
         "id": "36d5658a-6908-479e-887e-a949ec199272",
         "readings": [
             {
                 "timestamp": "2021-09-29T16:08:15+01:00",
                 "count": 2
             },
             {
                 "timestamp": "2021-09-29T16:09:15+01:00",
                 "count": 15
             }
         ]
     }'

```

## Testing

- Run the test suite with:
```
rspec
```
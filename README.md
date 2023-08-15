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

## Contributing

1. **Fork the project.**
2. **Create a new branch** for your feature or bugfix.
3. **Make your changes.**
4. **Submit a pull request.**

![](https://media.giphy.com/media/H6uTWVf97ywhisZtUN/giphy.gif)
### pretend it says "BrightWheel!" under the text in the gif.🤣


## Project Reflection
note: I spent the 2 hours coding and did not count the time it took to deploy the repo and answer these questions 

What roadblocks did you run into when writing your code (i.e.,where did you spend the bulk of your time)?
- I think the first roadblock was just deciding what to use to build this. I was initally going to use rails but that would have been overkill to build something like ths. I have'nt used Sinatra in a long time so it took a while to go over the docs and read me. In particular I think the directory structure is something that took a while, since I ended up going for a more Modular style, therefore I had to make sure the files all linked together correctly.  
- In my preveous role we used Minitest for our rails app (I know... I don't know why either) so it took a while for me to get used to the Rspec syntax again.

If you had more time, what part of your project would you refactor? What other tradeoffs did you make?
 - There are a few things that could have been done different. I would have added more controller testing. I ran out of time there and added some very simple tests. I would have added some more sad path testing. This goes for both the service specs and the controller spec.
 - Better Validations would have been added, The first thing that comes to mind is the ISO-8061 timestamp format I did not have tinme to come back to that and come up with regex or use an existing gem.
 - If I had more time I would have added some swagger docs to show examples of the endpoints that the api has.
 - Something simple I could have done was added the faker gem to randomize testing data.
 - Better error logging could have been made to better understand what error was hit
 
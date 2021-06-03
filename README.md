# rask
## Setup by Docker
### Build
Execute below command in rask repository
1. `$ docker build -t rask .`
2. `$ docker run -d -p 3000:3000 --name rask -v $(pwd):/rask rask && docker stop rask`
### Run
1. Start rask server  
`$ docker start rask`
2. Stop rask server  
`$ docker stop rask`

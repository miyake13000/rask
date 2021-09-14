# rask
## Note
This branch is the archive of old main branch.  
This branch has no longer maintained.
## Setup by Docker
### Prerequisites
1. Docker is installed
### Build
1. Execute below command in rask repository  
`$ docker build -t rask .`
### Run
1. Start rask server  
`$ ./rask-docker.sh start`
2. Stop rask server  
`$ ./rask-docker.sh stop`
3. Enter container  
`$ ./rask-docker.sh bash`
### Example
1. Try to use new gem
  * `echo "new_gem" >> Gemfile`
  * `./rask-docker.sh bundle install`
  * `./rask-docker.sh update`
  * `./rask-docker.sh restart`

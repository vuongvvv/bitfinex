# bitfinex
Steps to run the test:
1. Install docker
2. Clone the repository
3. docker run --shm-size=1g -v {full path to the repo folder}:/opt/robotframework/tests:Z -e BROWSER=chrome vuongvvv/robot-framework-real-browser:latest

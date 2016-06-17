FROM jsurf/rpi-raspbian:latest
RUN [ "cross-build-start" ]
RUN mkdir -p /client_and_detection
RUN mkdir -p /lib
RUN apt-get update && apt-get install -y \
	libjpeg62 \
	libtiff5 \
	libjasper1 \
	libilmbase6 \ 
	libopenexr6 \
	libgtk2.0-0 \
	libdc1394-22 \
	libv4l-0 && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY client_and_detection /client_and_detection
COPY lib /lib
WORKDIR /client_and_detection
CMD [ "sh", "faceDetection.sh" ]

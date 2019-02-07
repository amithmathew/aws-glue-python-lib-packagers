FROM python:2.7

VOLUME /zips

RUN apt-get update
RUN apt-get install -y zip

#Install the Library
RUN mkdir /deps

RUN pip install pg8000==1.12.4 enum -t /deps
WORKDIR /deps

RUN zip -r9 /pg8000.zip *

CMD cp /pg8000.zip /zips/pg8000.zip

# Run the following commands to use this.
# docker build -t build_pg8000 .
# docker run --rm --name build_pg8000 -v $PWD/zips:/zips build_pg8000
# Copy this zip file to S3.
# aws s3 cp ./zips/pg8000.zip s3://my-glue-libs/

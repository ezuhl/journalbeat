#!/bin/bash


sudo docker build -t journalbeat:latest .
sudo docker run -v $PWD:/app/go journalbeat



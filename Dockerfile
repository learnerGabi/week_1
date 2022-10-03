# Setup a Docker container
FROM python:latest

# Configure the system
RUN apt-get update
RUN apt-get install wget 

# Do something with the system
# 1. Use wget to download the file and rename it
RUN wget https://github.com/mschermann/forensic_accounting/blob/master/fb_sub.csv -O company.csv
# 2. Understand how to get access to the container - get interactive access

# 3. Use regular expressions to find the name of the company 
#    and write it into a file called company.txt.
RUN grep -o -m1 "\(\\w*\) INC" company.csv | head -1 > company_name.txt


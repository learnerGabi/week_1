# as of 9/29/22 3.10.7 was the lastest
# why: different version may not work 
FROM python:3.10.7
USER root

# Set your working directory
WORKDIR /var/www/
# Create a dir in the home dir
RUN mkdir -p /var/www/new_dir_jupyter_user

# install first
RUN pip3 install jupyter
ENV JUPYTER_USER our_user
RUN wget https://github.com/mschermann/forensic_accounting/blob/master/Introduction.ipynb -O /var/www/new_dir_jupyter_user/user_notebook.ipynb

RUN useradd -ms /bin/bash ${JUPYTER_USER}

EXPOSE 8888

USER ${JUPYTER_USER}
 


CMD jupyter notebook --ip=0.0.0.0 --port 8888



# # 8:40
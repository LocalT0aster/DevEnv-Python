# Use an official Python runtime as a parent image
FROM python:3.12-slim-bookworm

# Set the working directory in the container
WORKDIR /app

# Install software
RUN apt-get update && apt-get install -y openssh-server git gh build-essential nano
RUN apt clean

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/requirements.txt
RUN chmod 666 requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Configure SSH
RUN mkdir -p /var/run/sshd

ARG username=user
ARG password=password

ENV username=${username}
ENV password=${password}

RUN useradd -ms /bin/bash ${username}

RUN echo "${username}:${password}" | chpasswd
RUN echo "root:${password}" | chpasswd
COPY .devenv/sshd_config /etc/ssh/sshd_config

COPY . /app
RUN chown -R ${username}:${username} /app
# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Expose port 22222
EXPOSE 22222

# Run SSH server
CMD ["/usr/sbin/sshd", "-D"]

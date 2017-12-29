LAN Party Survival Kit
======================

# Overview

This vagrant project will create a virtual machine with everything you need to host a successful LAN party.

# Software Packages

* [Docker CE](https://www.docker.com/community-edition)

# Containers

* [Apache Web Server](https://hub.docker.com/r/chrisipa/apache/) 
* [Let's Chat](https://hub.docker.com/r/sdelements/lets-chat/)
* [Samba](https://hub.docker.com/r/dperson/samba/)
* [Teamspeak](https://hub.docker.com/r/mbentley/teamspeak/)

# Usage

* Set data folder as environment variable (default is a folder in user home directory):
  ```
  export LPSK_DATA_FOLDER="/data"
  ```  

* Run vagrant to create virtual machine:
  ```
  vagrant up
  ```
